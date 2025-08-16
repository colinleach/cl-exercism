#include "space_age.h"

float age(planet_t planet, int64_t seconds) 
{
    if (planet < 0 || planet > NEPTUNE) {
        return -1.0f;
    }
    
    float orbital_periods[] = {
        0.2408467f,  // MERCURY
        0.61519726f, // VENUS
        1.0f,        // EARTH
        1.8808158f,  // MARS
        11.862615f,  // JUPITER
        29.447498f,  // SATURN
        84.016846f,  // URANUS
        164.79132f   // NEPTUNE
    };
    
    float earth_years = seconds / 31557600.0f;
    return earth_years / orbital_periods[planet];
}
