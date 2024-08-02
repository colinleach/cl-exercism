function score(dice, category)
    freqs = [length([x for x in dice if x == d]) for d in 1:6]
    maxfreq = maximum(freqs)
    numbers = ("ones", "twos", "threes", "fours", "fives", "sixes")

    if category == "yacht"
        score = (maxfreq == 5) ? 50 : 0
    elseif category in numbers
        digit = findfirst(x -> x == category, numbers)
        score = digit * freqs[digit]
    elseif category == "full house"
        score = (sort!(freqs) == [0, 0, 0, 0, 2, 3]) ? sum(dice) : 0
    elseif category == "four of a kind"
        kind = findfirst(x -> x == maxfreq, freqs)
        score = (maxfreq >= 4) ? 4 * kind : 0
    elseif category == "little straight"
        score = (sort!(dice) == [1, 2, 3, 4, 5]) ? 30 : 0
    elseif category == "big straight"
        score = (sort!(dice) == [2, 3, 4, 5, 6]) ? 30 : 0
    elseif category == "choice"
        score = sum(dice)
    else
        score = 0
    end
    return score
end
