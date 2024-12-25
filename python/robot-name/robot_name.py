import random
import string


def generate_name():
    return "".join(random.choices(string.ascii_uppercase, k=2)) + str(random.randint(100, 999))


class Robot:
    def __init__(self):
        self.name = generate_name()
        self._used_names = {self.name}

    def reset(self):
        while self.name in self._used_names:
            self.name = generate_name()
        self._used_names.add(self.name)
