class School:
    def __init__(self):
        self.grades = {}
        self.added_ok = []

    def add_student(self, name, grade):
        if name in self.roster():
            self.added_ok.append(False)
        else:
            if grade in self.grades:
                self.grades[grade].append(name)
            else:
                self.grades[grade] = [name,]
            self.added_ok.append(True)

    def roster(self):
        names = []
        for grade in sorted(self.grades.keys()):
            names += sorted(self.grades[grade])
        return names

    def grade(self, grade_number):
        return [] if grade_number not in self.grades else sorted(self.grades[grade_number])

    def added(self):
        return self.added_ok
