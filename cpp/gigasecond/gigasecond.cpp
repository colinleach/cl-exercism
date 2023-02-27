#include "gigasecond.h"

namespace gigasecond {
    ptime advance(ptime moment) {
        return moment + boost::posix_time::seconds(1000000000);
    }
}  // namespace gigasecond
