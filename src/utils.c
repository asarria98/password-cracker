#include "utils.h"
#include <string.h>
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