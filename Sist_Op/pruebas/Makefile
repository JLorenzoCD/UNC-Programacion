CC = gcc
CFLAGS = -Wall -Werror -Wextra -pedantic -std=c99 -g
SOURCES = ej_dup2.c ej_fork.c ej_execvp.c
OBJECTS = $(SOURCES:.c=.o)

TARGET = prueba
ARCHIVOS_BASURA = lala.txt cpuinfo.txt

all: dup2

dup2: ej_dup2.o
	$(CC) $(CFLAGS) -o $(TARGET) ej_dup2.o $(LFLAGS) $(LIBS)

fork: ej_fork.o
	$(CC) $(CFLAGS) -o $(TARGET) ej_fork.o $(LFLAGS) $(LIBS)

execvp: ej_execvp.o
	$(CC) $(CFLAGS) -o $(TARGET) ej_execvp.o $(LFLAGS) $(LIBS)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) $(OBJECTS) $(TARGET) $(ARCHIVOS_BASURA)

run_dup2: dup2
	./$(TARGET)

run_fork: fork
	./$(TARGET)

run_execvp: execvp
	./$(TARGET)

.PHONY: clean run_dup2 run_fork run_execvp