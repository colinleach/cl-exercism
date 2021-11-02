class Luhn:
    def __init__(self, card_num):
        self.card_num = [c for c in card_num if c != ' ']

    def valid(self):
        if any([not c.isdigit() for c in self.card_num]) or len(self.card_num) < 2:
            return False

        vals = [int(c) for c in self.card_num]
        for i in range(len(vals)-2, -1, -2):
            vals[i] *= 2
            if vals[i] > 9:
                vals[i] -= 9

        return sum(vals) % 10 == 0
