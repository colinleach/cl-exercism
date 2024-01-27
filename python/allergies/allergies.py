class Allergies:

    def __init__(self, score):
        self.score = score % 256
        self.allergens = {
            'eggs': 1,
            'peanuts': 2,
            'shellfish': 4,
            'strawberries': 8,
            'tomatoes': 16,
            'chocolate': 32,
            'pollen': 64,
            'cats': 128
        }

    def allergic_to(self, item):
        return self.score & self.allergens[item] != 0

    @property
    def lst(self):
        return [allergen for allergen in self.allergens.keys() if self.allergic_to(allergen)]
