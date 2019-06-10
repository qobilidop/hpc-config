#include <stdio.h>
#include <mpi.h>
#include <omp.h>

int main(int argc, char **argv)
{
    int mpi_size, mpi_rank, plen;
    char pname[MPI_MAX_PROCESSOR_NAME];
    int omp_n, omp_i;

    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &mpi_size);
    MPI_Comm_rank(MPI_COMM_WORLD, &mpi_rank);
    MPI_Get_processor_name(pname, &plen);
    #pragma omp parallel private(omp_n, omp_i)
    {
        omp_n = omp_get_num_threads();
        omp_i = omp_get_thread_num();
        printf("Hello World from MPI %d/%d OMP %d/%d on %s\n",
               mpi_rank, mpi_size, omp_i, omp_n, pname);
    }
    MPI_Finalize();

    return 0;
}
