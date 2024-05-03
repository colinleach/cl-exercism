def spiral_matrix(size):
    if size == 0:
        return []

    output = [[0 for _ in range(size)] for _ in range(size)]
    output[0][0] = 1
    counter = 2
    row, col, direction = 0, 0, 0
    directions = ('right', 'down', 'left', 'up')

    while counter <= size * size:
        if directions[direction] == 'right':
            while col < size - 1 and output[row][col + 1] == 0:
                col += 1
                output[row][col] = counter
                counter += 1
        elif directions[direction] == 'down':
            while row < size - 1 and output[row + 1][col] == 0:
                row += 1
                output[row][col] = counter
                counter += 1
        elif directions[direction] == 'left':
            while col > 0 and output[row][col - 1] == 0:
                col -= 1
                output[row][col] = counter
                counter += 1
        elif directions[direction] == 'up':
            while row > 0 and output[row - 1][col] == 0:
                row -= 1
                output[row][col] = counter
                counter += 1
        direction = (direction + 1) % 4

    return output
