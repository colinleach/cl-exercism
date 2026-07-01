# values to represent each player
PLAYER_X = 1
PLAYER_O = -1


def gamestate(board):
    # convert board to integers, so we can do arithmetic
    values = {'X': PLAYER_X, ' ': 0, 'O': PLAYER_O}
    int_board = [[values[pos] for pos in row] for row in board]

    # preliminary checks for validity
    board_total = sum([sum(row) for row in int_board])
    if board_total > 1:
        raise ValueError("Wrong turn order: X went twice")
    if board_total < 0:
        raise ValueError("Wrong turn order: O started")

    # winning lines for each player
    x_wins = wins(int_board, PLAYER_X)
    o_wins = wins(int_board, PLAYER_O)
    if sum(x_wins) > 0 and sum(o_wins) > 0:
        raise ValueError("Impossible board: game should have ended after the game was won")

    # work out result for a valid board
    total_wins = sum(x_wins) + sum(o_wins)
    if total_wins == 1 or valid_double_win(x_wins) or valid_double_win(o_wins):
        return 'win'
    if any([n == 0 for row in int_board for n in row]):
        return 'ongoing'
    return 'draw'


def valid_double_win(wins):
    # a player can win on both diagonals simultaneously
    rows, cols, diags = wins
    return sum(wins) == 2 and rows < 2 and cols < 2


def wins(int_board, player):
    row_wins = sum([sum(row) == 3 * player for row in int_board])

    transpose_board = list(map(list, zip(*int_board)))
    col_wins = sum([sum(row) == 3 * player for row in transpose_board])

    diag1 = sum([int_board[n][n] for n in (0, 1, 2)])
    diag2 = sum([int_board[n][2 - n] for n in (0, 1, 2)])
    diag_wins = (diag1 == 3 * player) + (diag2 == 3 * player)
    return (row_wins, col_wins, diag_wins)
