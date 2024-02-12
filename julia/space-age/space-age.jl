PLANETS = Dict(
    "Mercury" => 0.2408467,
    "Venus" => 0.61519726,
    "Earth" => 1.0,
    "Mars" => 1.8808158,
    "Jupiter" => 11.862615,
    "Saturn" => 29.447498,
    "Uranus" => 84.016846,
    "Neptune" => 164.79132
)
EARTH_SECONDS = 31557600

onPlanet(seconds, planet) = seconds / (PLANETS[planet] * EARTH_SECONDS)
onEarth(seconds) = onPlanet(seconds, "Earth")
onMercury(seconds) = onPlanet(seconds, "Mercury")
onVenus(seconds) = onPlanet(seconds, "Venus")
onMars(seconds) = onPlanet(seconds, "Mars")
onJupiter(seconds) = onPlanet(seconds, "Jupiter")
onSaturn(seconds) = onPlanet(seconds, "Saturn")
onUranus(seconds) = onPlanet(seconds, "Uranus")
onNeptune(seconds) = onPlanet(seconds, "Neptune")
