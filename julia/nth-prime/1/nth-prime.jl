function prime(num)
    num > 0 || error("No such prime!")

    # this function is much faster than having the test in the if statement
    is_prime(n) = all([n % p > 0 for p in primes])

    primes = [2, 3]

    n = 3
    while length(primes) < num
        n += 2
        if is_prime(n)
            push!(primes, n)
        end
    end
    primes[num]
end
