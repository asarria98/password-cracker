#include <stdio.h>
#include <omp.h>
#include <string.h>
#include "utils.h"

void launchParallel(char *dictionary, char *hash, int length, char *key, int key_length) {
    #pragma omp parallel for
    for (int i = 0; i < strlen(dictionary); i++) {
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
    for (int length = 2; length <= MAX_KEY_LENGTH; length++){
        launchParallel(argv[1], argv[2], length, prefix, 0);
    }

    return 0;
}
