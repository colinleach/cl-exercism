def sum_of_multiples(limit, multiples):
    uniques = set()
    for num in [m for m in multiples if m > 0]:
        mult = num
        while mult < limit:
            uniques.add(mult)
            mult += num
    return sum(uniques)
