#ifndef UTILS_H
#define UTILS_H

#define HASH_SIZE 32
#define KEY_SIZE HASH_SIZE * 2 + 1
#define MAX_KEY_LENGTH 6

int compute_hash(char *str, unsigned char mdString[KEY_SIZE]);
void generateCombinations(char *charset, char *hash, int length, char *prefix, int prefixLength);

#endif /* UTILS_H */
