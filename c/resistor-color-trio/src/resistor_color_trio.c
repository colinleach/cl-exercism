#include "resistor_color_trio.h"

resistor_value_t color_code(resistor_band_t colors[]) {    
    double multiplier = 1;
    double value;
    resistor_unit_t unit;

    for (int i=0; i < (int)colors[2]; ++i) multiplier *= 10;
    value = (10 * (int)colors[0] + (int)colors[1]) * multiplier;

    if (value < 1000) {
        unit = OHMS;
    } else {
        unit = KILOOHMS;
        value /= 1000;
    }
    return (resistor_value_t){value, unit};
}
