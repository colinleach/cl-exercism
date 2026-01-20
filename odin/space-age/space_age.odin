package space_age

Planet :: enum {
	Mercury,
	Venus,
	Earth,
	Mars,
	Jupiter,
	Saturn,
	Uranus,
	Neptune,
}

age :: proc(planet: Planet, seconds: int) -> f64 {
	orbital_periods : = [8]f64{
		0.2408467,   // Mercury
		0.61519726,  // Venus
		1.0,         // Earth
		1.8808158,   // Mars
		11.862615,   // Jupiter
		29.447498,   // Saturn
		84.016846,   // Uranus
		164.79132,   // Neptune
	}	
	earth_years : f64 = f64(seconds) / 31_557_600.0
	return earth_years / orbital_periods[planet]
}
