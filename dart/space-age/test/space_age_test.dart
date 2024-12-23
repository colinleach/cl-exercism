import 'package:space_age/space_age.dart';
import 'package:test/test.dart';

void main() {
  final spaceAge = SpaceAge();

  group('SpaceAge', () {
    test('age on Earth', () {
      expect(spaceAge.age(planet: 'Earth', seconds: 1000000000), equals(31.69));
    }, skip: false);

    test('age on Mercury', () {
      expect(spaceAge.age(planet: 'Mercury', seconds: 2134835688), equals(280.88));
    }, skip:false);

    test('age on Venus', () {
      expect(spaceAge.age(planet: 'Venus', seconds: 189839836), equals(9.78));
    }, skip:false);

    test('age on Mars', () {
      expect(spaceAge.age(planet: 'Mars', seconds: 2129871239), equals(35.88));
    }, skip:false);

    test('age on Jupiter', () {
      expect(spaceAge.age(planet: 'Jupiter', seconds: 901876382), equals(2.41));
    }, skip:false);

    test('age on Saturn', () {
      expect(spaceAge.age(planet: 'Saturn', seconds: 2000000000), equals(2.15));
    }, skip:false);

    test('age on Uranus', () {
      expect(spaceAge.age(planet: 'Uranus', seconds: 1210123456), equals(0.46));
    }, skip:false);

    test('age on Neptune', () {
      expect(spaceAge.age(planet: 'Neptune', seconds: 1821023456), equals(0.35));
    }, skip:false);
  });
}
