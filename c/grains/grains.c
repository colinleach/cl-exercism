#include "grains.h"

uint64_t square(uint8_t index) {
    if (index < 1 || index > 64) return 0;
    
    uint64_t accum = 1;
    for (uint8_t i=1; i<index; i++) accum *= 2;
    return accum;
}

uint64_t total(void) {
    return 0xffffffffffffffff;
}
