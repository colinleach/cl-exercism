def annotate(minefield):
    def process_square(row, col):
        value = minefield[row][col]
        if value == '*':
            return '*'
        if value == ' ':
            count = count_adjacent(row, col)
            return str(count) if count > 0 else ' '
        raise ValueError('The board is invalid with current input.')

    def count_adjacent(row, col):
        # adj_squares = [
        #     (row - 1, col - 1),
        #     (row - 1, col),
        #     (row - 1, col + 1),
        #     (row, col - 1),
        #     (row, col + 1),
        #     (row + 1, col - 1),
        #     (row + 1, col),
        #     (row + 1, col + 1),
        # ]

        adj_squares = ((row + row_diff, col + col_diff) for row_diff in (-1, 0, 1) for col_diff in (-1, 0, 1))
        neighbors = [minefield[r][c] for r, c in adj_squares
                     if 0 <= r < rows and 0 <= c < cols]
        return len([adj for adj in neighbors if adj == '*'])

    rows = len(minefield)
    if rows > 0:
        cols = len(minefield[0])
    else:
        return []
    if any([len(r) != cols for r in minefield]):
        raise ValueError('The board is invalid with current input.')

    return [''.join([process_square(row, col) for col in range(cols)])
            for row in range(rows)]
