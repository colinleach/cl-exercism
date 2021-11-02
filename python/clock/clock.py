class Clock:
    def __init__(self, hour, minute):
        self.hour = hour
        self.minute = minute
        self.clean_overflows()

    def __repr__(self):
        return f"{self.hour:02d}:{self.minute:02d}"

    def __eq__(self, other):
        return self.__repr__() == other

    def __add__(self, minutes):
        self.minute += minutes
        self.clean_overflows()
        return self.__repr__()

    def __sub__(self, minutes):
        return self.__add__(-minutes)

    def clean_overflows(self):
        old_minute = self.minute
        self.minute = old_minute % 60
        self.hour = (self.hour + (old_minute // 60)) % 24
