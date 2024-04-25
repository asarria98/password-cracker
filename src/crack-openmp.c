#include <stdio.h>
#include <omp.h>
#include <string.h>
#include "utils.h"

void launchParallel(char *charset, char *hash, int length, char *prefix, int prefixLength) {
    #pragma omp parallel for
    for (int i = 0; i < strlen(charset); i++) {
        char newPrefix[length + 1];
        strcpy(newPrefix, prefix);
        newPrefix[prefixLength] = charset[i];
        generateCombinations(charset, hash, length, newPrefix, prefixLength + 1);
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
