import math

def triplets_with_sum(N):
    squares = [x * x for x in range((N // 2) + 1)]
    result = []
    for c in range(5, N // 2):
        c_sq = squares[c]
        for a in range(3, (N - c + 1)//2):
            b = N - a - c
            if b <= a or a + b <= c:
                break
            if b < c and squares[a] + squares[b] == c_sq:
                result.append([a, b, c])
    return result