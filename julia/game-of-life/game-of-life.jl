function gameoflife(matrix)
    isempty(matrix) && return reshape([], 0,2)

    rows, cols = size(matrix)
    cells = Dict((i,j) => matrix[i,j] for i ∈ 1:rows, j ∈ 1:cols)

    for i ∈ 1:rows, j ∈ 1:cols
        alive = matrix[i, j] == 1
        neighbors = sum(get(cells, (n,m), 0) for n ∈ i-1:i+1, m ∈ j-1:j+1) - matrix[i, j]
        matrix[i, j] = (alive && neighbors ∈ 2:3) || (!alive && neighbors == 3) ? 1 : 0
    end
    matrix
end
