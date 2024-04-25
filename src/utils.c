#include "utils.h"
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <openssl/sha.h>

int compute_hash(char *str, unsigned char mdString[KEY_SIZE]) {
    unsigned char digest[HASH_SIZE];

    SHA256_CTX ctx;
    SHA256_Init(&ctx);
    SHA256_Update(&ctx, str, strlen(str));
    SHA256_Final(digest, &ctx);

    for (int i = 0; i < HASH_SIZE; i++) {
        sprintf(&mdString[i*2], "%02x", (unsigned int) digest[i]);
    }

    return 0;
}

void generateCombinations(char *charset, char *hash, int length, char *prefix, int prefixLength) {
    if (prefixLength == length) {
        char hashString[KEY_SIZE];
        compute_hash(prefix, hashString);

        if (strcmp(hashString, hash) == 0) {
            printf("Hash de ('%s') = %s\n", prefix, hash);
            exit(0);
        }
        return;
    }

    for (int i = 0; i < strlen(charset); i++) {
        prefix[prefixLength] = charset[i];
        generateCombinations(charset, hash, length, prefix, prefixLength + 1);
    }
}