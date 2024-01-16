def primes(limit):
    numbers = [(0, False), (1, False)] + [(n, None) for n in range(2, limit + 1)]

    while True:
        possibles = (n for (n, status) in numbers if status is None)
        next_prime = next(possibles, None)
        if next_prime is None:
            break

        numbers[next_prime] = (next_prime, True)
        for n in range(next_prime + 1, limit + 1):
            if n % next_prime == 0:
                numbers[n] = (n, False)
    return [n for (n, status) in numbers if status == True]
