#include <stdio.h>
#include <mpi.h>
#include <string.h>
#include "utils.h"

void launchParallel(char *dictionary, char *hash, int length, char *key, int key_length) {
    int rank, size, i;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    int chunk_size = strlen(dictionary) / size;
    int start = rank * chunk_size;
    int end = (rank + 1) * chunk_size;

    for (int i = start; i < end; i++) {
        char new_key[length + 1];
        strcpy(new_key, key);
        new_key[key_length] = dictionary[i];
        generateCombinations(dictionary, hash, length, new_key, key_length + 1);
    }
}

int main(int argc, char *argv[]) {
    if (argc < 3) {
        printf("Usage: %s <charset> <hash>\n", argv[0]);
        return 1;
    }

    char prefix[MAX_KEY_LENGTH + 1];
    MPI_Init(&argc, &argv);
    for (int length = 2; length <= MAX_KEY_LENGTH; length++){
        launchParallel(argv[1], argv[2], length, prefix, 0);
    }
    MPI_Finalize();

    return 0;
}