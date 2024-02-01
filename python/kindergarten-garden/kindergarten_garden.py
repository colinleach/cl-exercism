class Garden:
    def __init__(self, diagram, students=None):
        if students is None:
            students = ('Alice', 'Bob', 'Charlie', 'David',
                        'Eve', 'Fred', 'Ginny', 'Harriet',
                        'Ileana', 'Joseph', 'Kincaid', 'Larry')
        else:
            students = sorted(students)
        self.students = {s: 2 * i for i, s in enumerate(students)}
        self.rows = diagram.split('\n')
        self.species = {'G': 'Grass', 'C': 'Clover', 'R': 'Radishes', 'V': 'Violets'}

    def plants(self, name):
        start = self.students[name]
        owns = self.rows[0][start:start + 2] + self.rows[1][start:start + 2]
        return [self.species[p] for p in owns]
