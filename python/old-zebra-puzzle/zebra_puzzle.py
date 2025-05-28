from itertools import permutations
from collections import namedtuple

Number = namedtuple('Number', ('one', 'two', 'three', 'four', 'five'))
Color = namedtuple('Color', ('red', 'green', 'blue', 'ivory', 'yellow'))
Drink = namedtuple('Drink', ('coffee', 'tea', 'milk', 'orangeJuice', 'water'))
Pet = namedtuple('Pet', ('dog', 'fox', 'horse', 'cat', 'zebra'))
Smoke = namedtuple('Smoke', ('OldGold', 'Kools', 'LuckyStrike', 'Parliaments', 'Other'))
Nation = namedtuple('Nation', ('Englishman', 'Ukrainian', 'Spaniard', 'Norwegian', 'Japanese'))

numbers = Number(0, 1, 2, 3, 4)
colors = Color(0, 1, 2, 3, 4)
drinks = Drink(0, 1, 2, 3, 4)
pets = Pet(0, 1, 2, 3, 4)
smokes = Smoke(0, 1, 2, 3, 4)
nations = Nation(0, 1, 2, 3, 4)


def main():
    perms = list(permutations(range(5)))
    # condition 2
    for color in perms:
        if color[nations.Englishman] != colors.red:
            continue
        # condition 3
        for pet in perms:
            if pet[nations.Spaniard] != pets.dog:
                continue
            # condition 4
            for drink in perms:
                if drink[colors.green] != drinks.coffee:



# def show_row(t, data):
#   print("%6s: %12s%12s%12s%12s%12s" % (
#     t.__name__, t.elems[data[0]],
#     t.elems[data[1]], t.elems[data[2]],
#     t.elems[data[3]], t.elems[data[4]]))

def main():
    perms = list(permutations(range(5)))
    for number in perms:
        if number[Nation.Norvegian] == Number.One:  # Constraint 10
            for color in perms:
                if color[Nation.British] == Color.Red:  # Constraint 2
                    if number[color.index(Color.Blue)] == Number.Two:  # Constraint 15+10
                        if number[color.index(Color.White)] - number[color.index(Color.Green)] == 1:  # Constraint 5
                            for drink in perms:
                                if drink[Nation.Danish] == Drink.Tea:  # Constraint 4
                                    if drink[color.index(Color.Green)] == Drink.Coffee:  # Constraint 6
                                        if drink[number.index(Number.Three)] == Drink.Milk:  # Constraint 9
                                            for smoke in perms:
                                                if smoke[Nation.German] == Smoke.Prince:  # Constraint 14
                                                    if drink[
                                                        smoke.index(Smoke.BlueMaster)] == Drink.Beer:  # Constraint 13
                                                        if smoke[
                                                            color.index(Color.Yellow)] == Smoke.Dunhill:  # Constraint 8
                                                            if number[smoke.index(Smoke.Blend)] - number[
                                                                drink.index(Drink.Water)] in (1, -1):  # Constraint 16
                                                                for pet in perms:
                                                                    if pet[Nation.Swedish] == Pet.Dog:  # Constraint 3
                                                                        if pet[smoke.index(
                                                                                Smoke.PallMall)] == Pet.Bird:  # Constraint 7
                                                                            if number[pet.index(Pet.Horse)] - number[
                                                                                smoke.index(Smoke.Dunhill)] in (
                                                                            1, -1):  # Constraint 12
                                                                                if number[smoke.index(Smoke.Blend)] - \
                                                                                        number[pet.index(Pet.Cat)] in (
                                                                                1, -1):  # Constraint 11
                                                                                    print("Found a solution:")
                                                                                    show_row(Nation, range(5))
                                                                                    show_row(Number, number)
                                                                                    show_row(Color, color)
                                                                                    show_row(Drink, drink)
                                                                                    show_row(Smoke, smoke)
                                                                                    show_row(Pet, pet)
                                                                                    print


main()
#
#
#
# def drinks_water():
#     pass
#
#
# def owns_zebra():
#     pass
