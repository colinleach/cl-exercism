#if !defined(PANGRAM_H)
#define PANGRAM_H

#include <string>
#include <algorithm>

using namespace std;

namespace pangram {
    bool is_pangram(string input);
}  // namespace pangram

#endif // PANGRAM_H