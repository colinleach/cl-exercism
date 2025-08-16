#include "binary.h"

int convert(const char *input) {
    int value = 0;
    int multiplier = 1;
    int length = (int)strlen(input);
    for (int i = length - 1; i >= 0; i--) {
        if (input[i] == '1') {
            value += multiplier;
        } else if (input[i] != '0') {
            return INVALID;
        }
        multiplier *= 2;
    }
    return value;
}