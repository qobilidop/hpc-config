#include <stdio.h>
#include <omp.h>

int main(int argc, char **argv)
{
    int omp_n, omp_i;

    #pragma omp parallel private(omp_n, omp_i)
    {
        omp_n = omp_get_num_threads();
        omp_i = omp_get_thread_num();
        printf("Hello World from OMP %d/%d\n",
               omp_i, omp_n);
    }

    return 0;
}
