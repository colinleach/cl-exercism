def annotate(garden):
    def process_square(row, col):
        value = garden[row][col]
        if value == '*':
            return '*'
        if value == ' ':
            count = count_adjacent(row, col)
            return str(count) if count > 0 else ' '
        raise ValueError('The board is invalid with current input.')
    def count_adjacent(row, col):
        adj_squares = [
            (row - 1, col - 1),
            (row - 1, col),
            (row - 1, col + 1),
            (row, col - 1),
            (row, col + 1),
            (row + 1, col - 1),
            (row + 1, col),
            (row + 1, col + 1),
        ]
        neighbors = [garden[r][c] for r, c in adj_squares
                     if 0 <= r < rows and 0 <= c < cols]
        return len([adj for adj in neighbors if adj == '*'])
    rows = len(garden)
    if rows > 0:
        cols = len(garden[0])
    else:
        return []
    if any([len(r) != cols for r in garden]):
        raise ValueError('The board is invalid with current input.')
    return [''.join([process_square(row, col) for col in range(cols)])
            for row in range(rows)]
