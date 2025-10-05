# starter set of small primes
primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47]

def prime(number):
    if number < 1:
        raise ValueError("there is no zeroth prime")

    if number <= len(primes):
        return primes[number - 1]

    i = primes[-1] + 2
    while len(primes) < number:
        if is_prime(i):
            primes.append(i)
        i += 2
    return primes[-1]

def is_prime(n):
    return not any(n % i == 0 for i in primes)
