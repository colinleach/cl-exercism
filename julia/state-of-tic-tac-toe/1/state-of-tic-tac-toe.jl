using LinearAlgebra

const x = 1
const o = -1

function wins(b_int, player)
    # It's a win if any of the rows, columns, or diagonals add up to ±3
    row_wins = count(sum(row) == 3 * player for row in eachrow(b_int))
    col_wins = count(sum(col) == 3 * player for col in eachcol(b_int))
    diag_wins = (sum(diag(b_int)) == 3 * player ? 1 : 0) + 
                (sum(diag(rotr90(b_int))) == 3 * player ? 1 : 0)
    (row_wins, col_wins, diag_wins)
end

function valid_double_win(wins)
    rows, cols, diags = wins
    sum(wins) == 2 && rows < 2 && cols < 2
end

function gamestate(board)
    # Parse to Int Matrix
    b_str = hcat(split.(board, "")...)
    replace!(b_str, "X" => "1")
    replace!(b_str, " " => "0")
    replace!(b_str, "O" => "-1")
    b_int = parse.(Int, b_str)

    sum(b_int) ∉ (0, 1) && error("Must take turns in order!")

    x_wins = wins(b_int, x)
    o_wins = wins(b_int, o)
    (sum(x_wins) > 0 && sum(o_wins) > 0) && error("Too many wins!")

    total_wins = sum(x_wins) + sum(o_wins)
    if total_wins == 1 || valid_double_win(x_wins) || valid_double_win(o_wins)
        "win"
    elseif total_wins > 1
        error("Too many wins!")
    elseif sum(b_int) == 1 && !any(x == 0 for x in b_int)
        "draw"
    else
        "ongoing"
    end
end
