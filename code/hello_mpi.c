#include <stdio.h>
#include <mpi.h>

int main(int argc, char **argv)
{
    int mpi_size, mpi_rank, plen;
    char pname[MPI_MAX_PROCESSOR_NAME];

    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &mpi_size);
    MPI_Comm_rank(MPI_COMM_WORLD, &mpi_rank);
    MPI_Get_processor_name(pname, &plen);
    printf("Hello World from MPI %d/%d on %s\n",
           mpi_rank, mpi_size, pname);
    MPI_Finalize();

    return 0;
}
