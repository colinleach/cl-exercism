from std/sequtils import deduplicate
from math import sum

proc sum*(limit: int, nums: seq[int]): int =
    var valid_multiples: seq[int]
    for number in nums:
        if number <= 0: continue
        var mult: int = number
        while mult < limit:
            valid_multiples.add(mult)
            mult += number
    sum(deduplicate(valid_multiples))
