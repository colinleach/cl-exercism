#include "resistor_color.h"
#include <stdlib.h>

int color_code(resistor_band_t color) {    
    return (int)color;
}

resistor_band_t * colors() {
    static resistor_band_t cols[] = {
        BLACK, BROWN, RED, ORANGE, YELLOW,
        GREEN, BLUE, VIOLET, GREY, WHITE
   };
   return cols;
}
