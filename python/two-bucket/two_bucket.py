from math import gcd


def measure(bucket_one, bucket_two, goal, start_bucket):
    if goal % gcd(bucket_one, bucket_two) != 0 or goal > max(bucket_one, bucket_two):
        raise ValueError("Solution is impossible")

    steps = 1
    found = None
    seen = {(0, 0), (bucket_one, 0), (0, bucket_two)}
    status = set([(bucket_one, 0), ] if start_bucket == "one" else [(0, bucket_two), ])

    # have we already found a solution?
    for (v1, v2) in status:
        if v1 == goal or v2 == goal:
            found = (v1, v2)

    while found is None:
        prev_status = status
        status = set()
        steps += 1
        for (vol1, vol2) in prev_status:
            # empty/fill one bucket:
            next_steps = {(vol1, 0), (0, vol2), (vol1, bucket_two), (bucket_one, vol2)}

            # transfers:
            transfer_1to2 = min(vol1, bucket_two - vol2)
            next_steps.add((vol1 - transfer_1to2, vol2 + transfer_1to2))

            transfer_2to1 = min(vol2, bucket_one - vol1)
            next_steps.add((vol1 + transfer_2to1, vol2 - transfer_2to1))

            for n in (next_steps - seen):
                status.add(n)
                seen.add(n)

        # have we found a solution?
        for (v1, v2) in status:
            if v1 == goal or v2 == goal:
                found = (v1, v2)
                break

    if found[0] == goal:
        return steps, "one", found[1]
    else:
        return steps, "two", found[0]
