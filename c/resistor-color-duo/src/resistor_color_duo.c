#include "resistor_color_duo.h"

int color_code(resistor_band_t colors[]) {    
    return 10 * (int)colors[0] + (int)colors[1];
}
