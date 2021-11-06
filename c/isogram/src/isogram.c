#include "isogram.h"

#define ALPHABETLEN 26

bool is_isogram(const char phrase[]) {
    int i;
    char c;

    if (phrase == NULL) {
        return false;
    }
    else if (strlen(phrase) == 0) {
        return true;
    }

    bool previous[ALPHABETLEN];

    for (i = 0; i < ALPHABETLEN; ++i) {
        previous[i] = false;
    }

    for (i = 0; i < (int)strlen(phrase); ++i) {
        c = phrase[i];
        if (c >= 'A' && c <= 'Z') {
                c = c - 'A' + 'a';
        }
        if (c >= 'a' && c <= 'z') {
            if (previous[c - 'a']) {
                return false;
            }
            else {
                previous[c - 'a'] = true;
            }
        }
    }
    return true;
}
