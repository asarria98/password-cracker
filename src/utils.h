#ifndef UTILS_H
#define UTILS_H

#define HASH_SIZE 32
#define KEY_SIZE HASH_SIZE * 2 + 1

int compute_hash(char *str, unsigned char mdString[KEY_SIZE]);

#endif /* UTILS_H */
