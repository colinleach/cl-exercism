#include "leap.h"

namespace leap {
	bool is_leap_year(int year) {
		return !(year % 400) || (!(year % 4) && (year % 100));
	}
}  // namespace leap
