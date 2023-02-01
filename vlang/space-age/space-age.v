module main

const (
	planets = {
		'Mercury': 0.2408467
		'Venus': 0.61519726
		'Earth': 1.0
		'Mars': 1.8808158
		'Jupiter': 11.862615
		'Saturn': 29.447498
		'Uranus': 84.016846
		'Neptune': 164.79132
	}
	earth_year = 31557600 // seconds
)

fn age(seconds f64, planet string) !f64 {
	planet_year := planets[planet] or { return error("${planet} is not a valid planet")}
	return seconds / (planet_year * earth_year)
}