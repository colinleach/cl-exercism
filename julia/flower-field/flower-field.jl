function annotate(flowerfield)
    function process_square(row, col)
        value = flowerfield[row][col]
        if value == '*'
            return "*"
        end
        if value == ' '
            count = count_adjacent(row, col)
            return  count > 0 ? string(count) : " "
        end
    end

    function count_adjacent(row, col)
        offsets = [(r + c * 1im) for r = -1:1 for c = -1:1]
        adj_squares = [row + col * 1im + offset for offset in offsets]
        neighbors = [flowerfield[real(sq)][imag(sq)] for sq in adj_squares
                     if 1 <= real(sq) <= rows && 1 <= imag(sq) <= cols]
        return length([adj for adj in neighbors if adj == '*'])
    end

    rows = length(flowerfield)
    if rows > 0
        cols = length(flowerfield[1])
    else
        return []
    end

    [join([process_square(row, col) for col in 1:cols]) for row in 1:rows]
end
