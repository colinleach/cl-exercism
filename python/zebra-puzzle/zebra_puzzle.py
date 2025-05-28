from itertools import permutations
from enum import Enum

class Nation(Enum):
    ENGLISH = 1
    SPANISH = 2
    UKRAINIAN = 3
    NORWEGIAN = 4
    JAPANESE = 5

class Color(Enum):
    RED = 1
    GREEN = 2
    IVORY = 3
    YELLOW = 4
    BLUE = 5

class Hobby(Enum):
    DANCING = 1
    READING = 2
    PAINTING = 3
    FOOTBALL = 4
    CHESS = 5

class Animal(Enum):
    DOG = 1
    SNAIL = 2
    FOX = 3
    HORSE = 4
    ZEBRA = 5

class Drink(Enum):
    COFFEE = 1
    MILK = 2
    ORANGE = 3
    TEA = 4
    WATER = 5


def solve():
    perms = list(permutations([1, 2, 3, 4, 5]))
    result = []

    # 10: The Norwegian lives in the first house
    nation_iter = [nation for nation in perms if nation[0] == Nation.NORWEGIAN.value]
    for nation in nation_iter:
        # 2: The Englishman lives in the red house
        # 6: The green house is immediately to the right of the ivory house
        # 15: The Norwegian lives next door to the blue house
        color_iter = [color for color in perms if
                      nation.index(Nation.ENGLISH.value) == color.index(Color.RED.value) and
                      color.index(Color.GREEN.value) == color.index(Color.IVORY.value) + 1 and
                      abs(nation.index(Nation.NORWEGIAN.value) - color.index(Color.BLUE.value)) == 1]
        for color in color_iter:
            # 4: The person in the green house drinks coffee
            # 5: The Ukrainian drinks tea
            # 9: The person in the middle house drinks milk
            drink_iter = [drink for drink in perms if
                          color.index(Color.GREEN.value) == drink.index(Drink.COFFEE.value) and
                          nation.index(Nation.UKRAINIAN.value) == drink.index(Drink.TEA.value) and
                          drink[2] == drink.index(Drink.MILK.value)]
            for drink in drink_iter:
                # 3: The Spaniard owns the dog
                animal_iter = (animal for animal in perms if
                               nation.index(Nation.SPANISH.value) == animal.index(Animal.DOG.value))
                for animal in animal_iter:
                    # 7: The snail owner likes to go dancing
                    # 8: The person in the yellow house is a painter
                    # 11: The person who enjoys reading lives in the house next to the person with the fox
                    # 12: The painter's house is next to the person with the horse
                    # 13: The person who plays football drinks orange juice
                    # 14: The Japanese person plays chess
                    hobby_iter = (hobby for hobby in perms if
                                  animal.index(Animal.SNAIL.value) == hobby.index(Hobby.DANCING.value) and
                                  color.index(Color.YELLOW.value) == hobby.index(Hobby.PAINTING.value) and
                                  abs(hobby.index(Hobby.READING.value) - animal.index(Animal.FOX.value)) == 1 and
                                  abs(hobby.index(Hobby.PAINTING.value) - animal.index(Animal.HORSE.value)) == 1 and
                                  hobby.index(Hobby.FOOTBALL.value) == drink.index(Drink.ORANGE.value) and
                                  nation.index(Nation.JAPANESE.value) == hobby.index(Hobby.CHESS.value))
                    for hobby in hobby_iter:
                        result.append( (nation, color, drink, animal, hobby) )

    assert len(result) == 1
    return result[0]


def drinks_water():
    nation, _, drink, _, _ = solve()
    water_index = drink.index(Drink.WATER.value)
    nation_index = nation[water_index]
    return Nation(nation_index).name.title()


def owns_zebra():
    nation, _, _, animal, _ = solve()
    animal_index = animal.index(Animal.ZEBRA.value)
    nation_index = nation[animal_index]
    return Nation(nation_index).name.title()
