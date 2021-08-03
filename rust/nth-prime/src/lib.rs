pub fn nth(n: u32) -> u32 {
    let mut primes = vec![2, 3, 5, 7, 11, 13, 17];
    while primes.len() <= n as usize {
        primes.push(next_prime(&primes));
    }
    primes[n as usize]
}

fn next_prime(prev: &Vec<u32>) -> u32 {
    let mut next_try = prev.last().unwrap() + 2;
    while !is_prime(&next_try, &prev) {
        next_try += 2;
    }
    next_try
}

fn is_prime(num: &u32, prev: &Vec<u32>) -> bool {
    for i in prev {
        if num % i == 0 {
            return false;
        }
    }
    true
}
