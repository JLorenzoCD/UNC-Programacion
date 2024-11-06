#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"
#include "kernel/fs.h"
#include "kernel/fcntl.h"
#include "kernel/syscall.h"
#include "kernel/param.h"
#include "kernel/memlayout.h"
#include "kernel/riscv.h"


#define CPU_MATRIX_SIZE 128
#define CPU_EXPERIMENT_LEN 32


// Multiplica dos matrices de tamaño CPU_MATRIX_SIZE x CPU_MATRIX_SIZE
// y devuelve la cantidad de operaciones realizadas / 1000
uint64
cpu_ops_cycle()
{
    uint64 kops_matmul = CPU_MATRIX_SIZE * CPU_MATRIX_SIZE * CPU_MATRIX_SIZE / 1000;
    float A[CPU_MATRIX_SIZE][CPU_MATRIX_SIZE];
    float B[CPU_MATRIX_SIZE][CPU_MATRIX_SIZE];
    float C[CPU_MATRIX_SIZE][CPU_MATRIX_SIZE];

    // Inicializar matrices con valores arbitrarios
    for (int i = 0; i < CPU_MATRIX_SIZE; i++) {
        for (int j = 0; j < CPU_MATRIX_SIZE; j++) {
            A[i][j] = i + j;
            B[i][j] = i - j;
        }
    }

    // Multiplicar matrices N veces
    for (int n = 0; n < CPU_EXPERIMENT_LEN; n++) {
        for (int i = 0; i < CPU_MATRIX_SIZE; i++) {
            for (int j = 0; j < CPU_MATRIX_SIZE; j++) {
                C[i][j] = 0.0f;
                for (int k = 0; k < CPU_MATRIX_SIZE; k++) {
                    C[i][j] += 2.0f * A[i][k] * B[k][j];
                }
            }
        }
    }

    return (kops_matmul * CPU_EXPERIMENT_LEN);
}

void
cpubench(int N, int pid)
{
    uint64 start_tick, end_tick, elapsed_ticks, total_cpu_kops, metric;
    int *measurements = malloc(sizeof(int) * N);

    //? Header
    printf(
        "LOOP_CYCLE\tPID\tTYPE\tSTART_TICK\tELAPSED_TICKS\tOPERATIONS\tMETRIC"
        "\n"
    );
    for (int i = 0; i < N; ++i) {   // Realizar N ciclos de medición
        start_tick = uptime();

        total_cpu_kops = cpu_ops_cycle();

        end_tick = uptime();
        elapsed_ticks = end_tick - start_tick;

        metric = (total_cpu_kops * 10000) / elapsed_ticks;
        measurements[i] = metric;

        printf(
            "%d\t%d\t[cpubench]\t%d\t%d\t%d\t%d\n",
            i, pid, start_tick, elapsed_ticks, total_cpu_kops, metric
        );
    }
}

int
main(int argc, char *argv[])
{
    int N, pid;
    if (argc != 2) {
        printf("Uso: benchmark N\n");
        exit(1);
    }

    N = atoi(argv[1]);  // Número de repeticiones para los benchmarks
    pid = getpid();
    cpubench(N, pid);

    exit(0);
}
