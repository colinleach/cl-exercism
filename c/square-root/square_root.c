#include "square_root.h"

// Crude, brute-force method: only suitable for small-ish integer roots
unsigned long square_root(unsigned long n) {
    unsigned long root = 0;
    while (root * root < n) root++;
    return root;
}