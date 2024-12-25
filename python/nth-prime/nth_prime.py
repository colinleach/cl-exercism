def prime(number):
    if number < 1:
        raise ValueError("there is no zeroth prime")

    small_primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47]
    if number <= len(small_primes):
        return small_primes[number - 1]

    found = len(small_primes)
    i = small_primes[-1] + 2
    while found < number:
        if is_prime(i):
            last = i
            found += 1
        i += 2
    return last

def is_prime(n):
    return not any(n % i == 0 for i in range(2, n // 2 + 1))
