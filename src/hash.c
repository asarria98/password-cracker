#include <stdio.h>
#include "utils.h"

int main(int argc, char *argv[]) {
    if (argc != 2){
        printf("Error, usage: %s <string>\n", argv[0]);
        return -1;
    }

    char hashString[KEY_SIZE];
    compute_hash(argv[1], hashString);
    printf("hash: %s\n", hashString);

    return 0;
}