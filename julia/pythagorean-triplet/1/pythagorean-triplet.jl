function pythagorean_triplets(N)
    triplets = Tuple{Int, Int, Int}[]
    for big in (N ÷ 2 - 1):-1:(round(Int, (√2 - 1) * N))
        D_sq = big^2 - N^2 + 2N * big
        D_sq > 0 || break
        D = √D_sq
        if isinteger(D)
            small = round(Int, ((N - big - D) / 2))
            mid = round(Int, ((N - big + D) / 2))
            push!(triplets, (small, mid, big))
        end
    end
    triplets
end
