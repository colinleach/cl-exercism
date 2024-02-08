# Score categories.
# Change the values as you see fit.
YACHT = 0
ONES = 1
TWOS = 2
THREES = 3
FOURS = 4
FIVES = 5
SIXES = 6
FULL_HOUSE = 7
FOUR_OF_A_KIND = 8
LITTLE_STRAIGHT = 9
BIG_STRAIGHT = 10
CHOICE = 11


def score(dice, category):
    if category == YACHT:
        return 50 if max(freqs(dice)) == 5 else 0
    if category in [ONES, TWOS, THREES, FOURS, FIVES, SIXES]:
        return sum(x for x in dice if x == category)
    if category == FULL_HOUSE:
        return sum(dice) if sorted(freqs(dice)) == [0, 0, 0, 0, 2, 3] else 0
    if category == FOUR_OF_A_KIND:
        freq_list = freqs(dice)
        maxindex = max(freq_list)
        return 4 * (freq_list.index(max(freq_list)) + 1) if maxindex >= 4 else 0
    if category == LITTLE_STRAIGHT:
        return 30 if sorted(dice) == [1, 2, 3, 4, 5] else 0
    if category == BIG_STRAIGHT:
        return 30 if sorted(dice) == [2, 3, 4, 5, 6] else 0
    if category == CHOICE:
        return sum(dice)


def freqs(dice):
    return [len([x for x in dice if x == d]) for d in range(1, 7)]
