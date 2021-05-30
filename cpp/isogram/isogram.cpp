#include "isogram.h"

using namespace std;

namespace isogram {
	bool is_isogram(string input) {

		for (int i = 0; i < input.length(); ++i) {
			input[i] = tolower(input[i]);
		}

		for (int i = 0; i < input.length(); ++i) {
			if (isalpha(input[i])) {
				size_t loc = input.find(input[i], (size_t)i + 1);
				if (loc != string::npos) return false;
			}
		}

		return true;
	}

}  // namespace isogram
