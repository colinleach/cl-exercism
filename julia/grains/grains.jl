"""Calculate the number of grains on square `square`."""
function on_square(square)
    if !(1 ≤ square ≤ 64)
        throw(DomainError(square, "Invalid square"))
    end
    
    big(2) ^ (square - 1)
end

"""Calculate the total number of grains after square `square`."""
function total_after(square)
    if !(1 ≤ square ≤ 64)
        throw(DomainError(square, "Invalid square"))
    end
    
    sum(on_square(n) for n in 1:square)
end
