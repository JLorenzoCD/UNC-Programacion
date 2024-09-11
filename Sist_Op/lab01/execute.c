#include "execute.h"

#include <assert.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>     /* fork, close, dup, execvp, pipe */
#include <fcntl.h>      /* open */
#include <sys/wait.h>   /* wait */
#include <sys/stat.h>   /* S_IWUSR, S_IRUSR, ... */

#include "command.h"
#include "builtin.h"

#include "tests/syscall_mock.h"

#define MAX_CMD 500

/*
 * Takes a scommand CMD and transforms its list of arguments into an array meant
 * to be passed to EXECVP
 * Returns a pointer to the array, type char*. The array is NULL-terminated.
 */
static char** scommand_to_array(scommand cmd);

/*
 * Decides if the next command to execute is an internal command or an external
 * command and calls the correct function to handle it.
 * APIPE is the pipeline that contains the commands to be executed, PIPE is the
 * FILE DESCRIPTOR meant to be used as STDIN for the command to be executed
 * (which is a pipe, or -1 if this is the first command), and CPID is a variable
 * that will be modified to contain the PID of the child process launched by fork,
 *  or -1 if the command is internal.
 * Returns the FILE DESCRIPTOR of the pipe[0] meant to be used as STDIN for the
 * next command.
 * Returns -1 if there was an error or if the last command in the pipeline is
 * to be executed.
 */
static int execute_command(pipeline apipe, int pipe, pid_t* cpid);

/*
 * Prepares the input/output streams before executing an internal command.
 * APIPE is a pointer to the pipeline containing the command to be executed.
 * IN_PIPE is the FILE DESCRIPTOR meant to be used as STDIN for the command to
 * be executed (its value is -1 if this is the first command). It represents the
 * pipe opened by the previous command.
 * Returns the FILE DESCRIPTOR of the pipe created for this command, meant to be
 * used in place of STDIN for the next command, or -1 if there has been an error
 * or if this is the last command.
 */
static int handle_internal(pipeline apipe, int in_pipe);

/*
 * Forks the process and handles what happens in the parent process. It calls
 * a function to handle the child process.
 * It also sets cpid to the pid of the child process.
 * APIPE is a pointer to the pipeline that contains the command to be executed.
 * IN_PIPE is the FILE DESCRIPTOR meant to be used as STDIN for the command to
 * be executed (its value is -1 if this is the first command). It represents the
 * pipe opened by the previous command.
 * Returns the FILE DESCRIPTOR of the pipe created for this command, meant to be
 * used in place of STDIN for the next command, or -1 if there has been an error
 * or if this is the last command.
 */
static int handle_external(pipeline apipe, int in_pipe, pid_t* cpid);

/* * Prepares the input/output streams before calling execvp.
 * ASSUME this function will ONLY be executed by the CHILD PROCESS.
 * CMD is a pointer to the scommand to be executed.
 * IN_PIPE is the FILE DESCRIPTOR meant to be used as STDIN for this command (its
 * value is -1 if this is the first command). It represents the pipe opened by
 * the previous command.
 * NEW_PIPE is the pipe opened by this command.
 */
static void execute_child_process(scommand cmd, int in_pipe, int new_pipe[2]);

/*
 * Redirects STDIN to the file named IN, and STDOUT to the file named OUT.
 * If either IN or OUT is NULL, that stream does not get redirected.
 */
static int redirect_filename(char* in, char* out);

void execute_pipeline(pipeline apipe) {
    assert(apipe != NULL);

    /*
     * Represents the file descriptor to a pipe which the next command to
     * be executed should use as its standard input.
     */
    int in_pipe = -1; /* I make -1 mean that there is no file descriptor here */

    pid_t cpid;
    pid_t cpid_arr[MAX_CMD];
    unsigned int cpid_counter = 0;
    bool error = false;
    /* Loop while there are commands to execute */
    while (!pipeline_is_empty(apipe)) {
        in_pipe = execute_command(apipe, in_pipe, &cpid);
        if (in_pipe == -1 &&
            pipeline_length(apipe) > 1) {
            error = true;
            break;
        }
        pipeline_pop_front(apipe);
        if (cpid_counter < MAX_CMD) {
            cpid_arr[cpid_counter] = cpid;
            cpid_counter++;
        }
    } // End of WHILE

    if (!error)
        for (unsigned int i = 0; i < cpid_counter; i++)
            if (pipeline_get_wait(apipe) && !error) {
                int wstatus = 0;
                if (cpid_arr[i] != -1) {
                    int result = waitpid(cpid_arr[i], &wstatus, 0);
                    if (result == -1) {
                        /* MANAGE ERROR */
                        perror("Error in execute_pipeline");
                        fprintf(stderr, "Error waiting for process %u.\n", (unsigned int)cpid_arr[i]);
                        break;
                    }
                }
            }
}

static int execute_command(pipeline apipe, int in_pipe, pid_t* cpid) {
    if (builtin_is_internal(pipeline_front(apipe))) {
        *cpid = -1;
        in_pipe = handle_internal(apipe, in_pipe);
    }
    else {
        in_pipe = handle_external(apipe, in_pipe, cpid);
    }

    return in_pipe;
}

static int handle_internal(pipeline apipe, int in_pipe) {
    /* Does not create another thread. It closes IN_PIPE */
    bool error = false;
    scommand cmd = pipeline_front(apipe);
    int new_pipe[2] = { -1, -1 };
    int result = 0;

    /* Gets a new pipe only if this is not the last command in the pipe */
    if (!builtin_alone(apipe)) {
        result = pipe(new_pipe);
        if (result == -1) {
            /* MANAGE ERROR */
            perror("Problem in handle_internal");
            close(in_pipe);
            return -1;
        }
    }

    /*
     * from new_pipe, the builtin will only use new_pipe[1]; new_pipe[0] is the
     * file descriptor THIS function should return.
     * IN_PIPE will be closed AFTER the builtin uses it, if it needs it.
     */

     /* Now I will redirect input and output of the builtin if needed */
     /* in_pipe and new_pipe[1] will get closed at the end of the function */
    int temp_stdin;
    int temp_stdout;

    /* Save stdin and stdout to restore them later on */
    temp_stdin = dup(STDIN_FILENO);
    if (temp_stdin == -1) {
        /* MANAGE ERROR */
        perror("Error in handle_internal");
        error = true;
    }

    if (!error)
        temp_stdout = dup(STDOUT_FILENO);
    if (temp_stdout == -1) {
        /* MANAGE ERROR */
        perror("Error in handle_internal");
        error = true;
    }

    /* Redirect to pipes */
    if (!error)
        if (scommand_get_redir_in(cmd) == NULL && in_pipe != -1) {
            int result = dup2(in_pipe, STDIN_FILENO);
            if (result == -1) {
                /* MANAGE ERROR */
                perror("Error redirecting stdin to pipe in handle_internal");
                error = true;
            }
        }

    if (!error)
        if (scommand_get_redir_out(cmd) == NULL && new_pipe[1] != -1) {
            int result = dup2(new_pipe[1], STDOUT_FILENO);
            if (result == -1) {
                /* MANAGE ERROR */
                perror("Error redirecting stdout to pipe in handle_internal");
                error = true;
            }
        }


    /* Now we redirect input to the specified files */
    char* input_redir = scommand_get_redir_in(cmd);
    char* output_redir = scommand_get_redir_out(cmd);

    if (!error)
        result = redirect_filename(input_redir, output_redir);
    if (result == -1 && !error) {
        /* MANAGE ERROR */
        fprintf(stderr, "Error redirecting input to/from files in handle_internal.\n");
        error = true;
    }

    /* Now we execute the command */
    if (!error)
        builtin_run(cmd);

    /* And now we clean up */
    result = dup2(temp_stdin, STDIN_FILENO);
    if (result == -1) {
        /* CHECK FOR ERRORS */
    }
    result = dup2(temp_stdout, STDOUT_FILENO);
    if (result == -1) {
        /* CHECK FOR ERRORS */
    }
    close(temp_stdin);
    close(temp_stdout);

    if (in_pipe != -1)
        close(in_pipe);
    if (new_pipe[1] != -1)
        close(new_pipe[1]);
    return new_pipe[0];
}

static int handle_external(pipeline apipe, int in_pipe, pid_t* cpid) {
    scommand cmd = pipeline_front(apipe);

    int new_pipe[2] = { -1, -1 };
    int result;

    /* First, we create the pipe ONLY if this is not the last command */
    if (pipeline_length(apipe) > 1) {
        result = pipe(new_pipe);
        if (result == -1) {
            /* MANAGE ERROR */
            if (in_pipe != -1)
                close(in_pipe);
            return -1;
        }
    }

    pid_t fork_status;
    fork_status = fork();
    if (fork_status == -1) {
        if (new_pipe[1] != -1)
            close(new_pipe[1]);
        if (in_pipe != -1)
            close(in_pipe);
        if (new_pipe[0] != -1)
            close(new_pipe[0]);
        return -1;
    }
    else {
        switch (fork_status) {
        case 0:
            execute_child_process(cmd, in_pipe, new_pipe);
            break;
        default:
            if (new_pipe[1] != -1)
                close(new_pipe[1]);
            if (in_pipe != -1)
                close(in_pipe);
            *cpid = fork_status;
            break;
        }
    }

    return new_pipe[0];
}

static void execute_child_process(scommand cmd, int in_pipe, int new_pipe[2]) {
    /* We are in the CHILD PROCESS */

    /*
     * new_pipe[1] and in_pipe will be closed by the OS when the proces stops
     * executing.
     */
    if (new_pipe[0] != -1)
        close(new_pipe[0]);

    int result = 0;

    /* First, I redirect to the pipes */
    if (in_pipe != -1) {
        result = dup2(in_pipe, STDIN_FILENO);
        if (result == -1) {
            /* MANAGE ERROR */
            perror("Error setting STDIN in execute_child_process");
            exit(EXIT_FAILURE);
        }
        close(in_pipe);
        in_pipe = -1;
    }

    if (new_pipe[1] != -1) {
        result = dup2(new_pipe[1], STDOUT_FILENO);
        if (result == -1) {
            /* MANAGE ERROR */
            perror("Error setting STDOUT in execute_child_process");
            exit(EXIT_FAILURE);
        }
        close(new_pipe[1]);
        new_pipe[1] = -1;
    }

    /* Now, we redirect to the specified files, if there is any file specified */
    char* input_redir = scommand_get_redir_in(cmd);
    char* output_redir = scommand_get_redir_out(cmd);
    result = redirect_filename(input_redir, output_redir);
    if (result == -1) {
        /* MANAGE ERROR */
        perror("Error redirecting streams to files in execute_child_process");
        exit(EXIT_FAILURE);
    }

    /* Now we execute the command */
    char** args = NULL;
    args = scommand_to_array(cmd);
    result = execvp(args[0], args);
    if (result == -1) {
        /* CHECK FOR ERRORS */
        /* PROBABLY EXIT, SINCE THIS IS THE CHILD PROCESS */
        perror("Error executing external command");
        fprintf(stderr, "mybash: %s\n", args[0]);
        exit(EXIT_FAILURE);
    }
}

static char** scommand_to_array(scommand cmd) {
    int i = 0;
    int n_args = scommand_length(cmd);

    char** args = NULL;
    args = calloc(n_args + 1, sizeof(char*));
    if (args == NULL) {
        perror("Error in scommand_to_array.\n");
        return NULL;
    }

    while (!scommand_is_empty(cmd)) {
        args[i] = strdup(scommand_front(cmd));
        scommand_pop_front(cmd);
        i++;
    }
    args[i] = NULL; /* el ultimo elemento debe ser NULL. */

    return args;
}

static int redirect_filename(char* in, char* out) {
    if (in != NULL) {
        int fd = open(in, O_RDONLY, S_IRUSR);
        if (fd == -1) {
            perror("Error in redirect_filename (in)");
            fprintf(stderr, "Problem opening file %s\n", in);
            return -1;
        }

        int result = dup2(fd, STDIN_FILENO);
        if (result == -1) {
            perror("Error in redirect_filename (in)");
            fprintf(stderr, "Problem redirecting streams (in).\n");
            close(fd);
            return -1;
        }
        close(fd);
    }
    if (out != NULL) {
        int fd = open(out, O_WRONLY | O_CREAT | O_TRUNC,
            S_IRUSR | S_IWUSR |
            S_IRGRP | S_IWGRP |
            S_IROTH | S_IWOTH);
        if (fd == -1) {
            perror("Error in redirect_filename (out)");
            fprintf(stderr, "Problem opening_file %s\n", out);
            return -1;
        }

        int result = dup2(fd, STDOUT_FILENO);
        if (result == -1) {
            fprintf(stderr, "Problem redirecting streams (out).\n");
            close(fd);
            return -1;
        }
        close(fd);
    }
    return 0;
}
