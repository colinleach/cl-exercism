#include "darts.h"
#include <math.h>

int score(coordinate_t pt) {
    const double radius = sqrt(pt.x * pt.x + pt.y * pt.y);

    if (radius > 10) return 0;
    else if (radius > 5) return 1;
    else if (radius > 1) return 5;
    
    return 10;
}