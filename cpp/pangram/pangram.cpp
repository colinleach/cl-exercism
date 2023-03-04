#include "pangram.h"

namespace pangram {
    bool is_pangram(string input) {
        transform(input.begin(), input.end(), input.begin(), ::tolower);
        for (int i=int('a'); i<=int('z'); i++) {
            if (input.find(i) == string::npos) return false;
        }
        return true;
    }
}  // namespace pangram
