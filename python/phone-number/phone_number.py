import re


class PhoneNumber:
    def __init__(self, number, elf=None):
        if re.search(r"[a-zA-Z]", number):
            raise ValueError("letters not permitted")

        digits = re.sub(r"[ +\-().]", "", number)
        if re.search(r"[^0-9]", digits):
            raise ValueError("punctuations not permitted")
        if len(digits) < 10:
            raise ValueError("must not be fewer than 10 digits")
        if len(digits) > 11:
            raise ValueError("must not be greater than 11 digits")
        if len(digits) == 11 and digits[0] != '1':
            raise ValueError("11 digits must start with 1")

        self.number = digits[-10:]
        self.area_code = self.number[:3]
        self.exchange_code = self.number[3:6]

        if self.area_code[0] in ['0', '1']:
            msg = 'zero' if self.area_code[0] == '0' else 'one'
            raise ValueError(f"area code cannot start with {msg}")
        if self.exchange_code[0] in ['0', '1']:
            msg = 'zero' if self.exchange_code[0] == '0' else 'one'
            raise ValueError(f"exchange code cannot start with {msg}")

    def pretty(self):
        return f"({self.area_code})-{self.exchange_code}-{self.number[-4:]}"
