function spiral_matrix(n)
    if n == 0
        return Matrix{Int}(undef,0,0)
    end
    output = zeros(Int, n, n)
    output[1, 1] = 1
    counter = 2
    row, col, direction = 1, 1, 1
    directions = ("right", "down", "left", "up")

    while counter <= n^2
        if directions[direction] == "right"
            while col < n && output[row, col + 1] == 0
                col += 1
                output[row, col] = counter
                counter += 1
            end
        elseif directions[direction] == "down"
            while row < n && output[row + 1, col] == 0
                row += 1
                output[row, col] = counter
                counter += 1
            end
        elseif directions[direction] == "left"
            while col > 1 && output[row, col - 1] == 0
                col -= 1
                output[row, col] = counter
                counter += 1
            end
        elseif directions[direction] == "up"
            while row > 1 && output[row - 1, col] == 0
                row -= 1
                output[row, col] = counter
                counter += 1
            end
        else
            return output
        end
        direction = direction == 4 ? 1 : direction + 1
    end
    output
end
