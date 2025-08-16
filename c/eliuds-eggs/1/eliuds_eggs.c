#include "eliuds_eggs.h"

unsigned int egg_count(unsigned int coop) {
    unsigned int count = 0;
    while (coop > 0) {
        if (coop & 1) count++;
        coop >>= 1;
    }
    return count;
}