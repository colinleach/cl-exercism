def is_prime(n):
    return not any(n % i == 0 for i in range(2, n // 2 + 1))

def factors(value):
    if value == 1:
        return []
    if value == 2:
        return [2]
    if is_prime(value):
        return [value]

    factor = []
    remaining = value

    while remaining % 2 == 0:
        factor.append(2)
        remaining //= 2

    for i in range(3, remaining // 2 + 3, 2):
        while remaining % i == 0:
            factor.append(i)
            remaining //= i
        if remaining == 1:
            break
    return factor