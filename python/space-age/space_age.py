class SpaceAge:
    PLANETS = {
        'Mercury': 0.2408467,
        'Venus': 0.61519726,
        'Earth': 1.0,
        'Mars': 1.8808158,
        'Jupiter': 11.862615,
        'Saturn': 29.447498,
        'Uranus': 84.016846,
        'Neptune': 164.79132
    }

    def __init__(self, seconds):
        self.seconds = seconds
        self.earth_seconds = 31557600

    def on_planets(self, planet):
        return round(self.seconds / (self.PLANETS[planet] * self.earth_seconds), 2)

    def on_earth(self):
        return self.on_planets('Earth')

    def on_mercury(self):
        return self.on_planets('Mercury')

    def on_venus(self):
        return self.on_planets('Venus')

    def on_mars(self):
        return self.on_planets('Mars')

    def on_jupiter(self):
        return self.on_planets('Jupiter')

    def on_saturn(self):
        return self.on_planets('Saturn')

    def on_uranus(self):
        return self.on_planets('Uranus')

    def on_neptune(self):
        return self.on_planets('Neptune')
