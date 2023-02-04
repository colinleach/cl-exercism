import 'dart:math';

class SpaceAge {
  var planets = {
		'Mercury': 0.2408467,
		'Venus': 0.61519726,
		'Earth': 1.0,
		'Mars': 1.8808158,
		'Jupiter': 11.862615,
		'Saturn': 29.447498,
		'Uranus': 84.016846,
		'Neptune': 164.79132
	};
  int earthYear = 31557600; // seconds

  double roundDouble(double value, int places) { 
    double mod = pow(10.0, places) as double; 
    return ((value * mod).round().toDouble() / mod); 
  }

  double age({required String planet, required int seconds}) {
    double planetYear = planets[planet] ?? -1;
    double planetAge = seconds / (planetYear * earthYear);
    return roundDouble(planetAge, 2);
  } 
}
