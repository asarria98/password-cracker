#include <stdio.h>
#include <string.h>
#include "utils.h"


void generateCombinations(char *charset, char *hash, int length, char *prefix, int prefixLength) {
    if (prefixLength == length) {

        char hashString[KEY_SIZE];
        compute_hash(prefix, hashString);

        if (strcmp(hashString, hash) == 0) {
            printf("Hash de ('%s') = %s\n", prefix, hash);
        }

        return;
    }

    for (int i = 0; i < strlen(charset); i++) {
        prefix[prefixLength] = charset[i];
        generateCombinations(charset, hash, length, prefix, prefixLength + 1);
    }
}

int main(int argc, char *argv[]) {
    if (argc < 3) {
        printf("Usage: %s <charset> <hash>\n", argv[0]);
        return 1;
    }

    int length = 4;
    char prefix[length + 1];

    generateCombinations(argv[1], argv[2], length, prefix, 0);

    return 0;
}
