def triplets_with_sum(N):
    triplets = []
    for big in range(int(N / 2.0) - 1, int((2**0.5 - 1) * N), -1):
        D = (big**2 - N**2 + 2 * N * big)**0.5
        if D == int(D):
            small = int((N - big - D) / 2)
            mid = int((N - big + D) / 2)
            triplets.append([small, mid, big])
    return triplets
