tick <- function(cells) {

}


# function gameoflife(cells)
#     isempty(cells) && return reshape([], 0,2)
# 
#     rows, cols = size(cells)
#     cells = Dict((i,j) => cells[i,j] for i ∈ 1:rows, j ∈ 1:cols)
# 
#     for i ∈ 1:rows, j ∈ 1:cols
#         alive = cells[i, j] == 1
#         neighbors = sum(get(cells, (n,m), 0) for n ∈ i-1:i+1, m ∈ j-1:j+1) - cells[i, j]
#         cells[i, j] = (alive && neighbors ∈ 2:3) || (!alive && neighbors == 3) ? 1 : 0
#     end
#     cells
# end