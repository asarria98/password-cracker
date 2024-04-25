#include <stdio.h>
#include <string.h>
#include "utils.h"

int main(int argc, char *argv[]) {
    if (argc < 3) {
        printf("Usage: %s <charset> <hash>\n", argv[0]);
        return 1;
    }

    char prefix[MAX_KEY_LENGTH + 1];
    for (int length = 2; length <= MAX_KEY_LENGTH; length++){
        generateCombinations(argv[1], argv[2], length, prefix, 0);
    }

    return 0;
}
