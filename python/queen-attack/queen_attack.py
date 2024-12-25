class Queen:
    def __init__(self, row, column):
        if row < 0:
            raise ValueError("row not positive")
        if row > 7:
            raise ValueError("row not on board")
        if column < 0:
            raise ValueError("column not positive")
        if column > 7:
            raise ValueError("column not on board")

        self.row = row
        self.column = column


    def can_attack(self, another_queen):
        if another_queen.row == self.row and another_queen.column == self.column:
            raise ValueError("Invalid queen position: both queens in the same square")

        same_row = self.row == another_queen.row
        same_col = self.column == another_queen.column
        same_diagonal = abs(another_queen.row - self.row) == abs(another_queen.column - self.column)
        return any([same_row, same_col, same_diagonal])
