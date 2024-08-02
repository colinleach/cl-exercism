function twobucket(bucket1, bucket2, goal, start)
    if goal % gcd(bucket1, bucket2) != 0 || goal > max(bucket1, bucket2)
        throw(DomainError("Impossible")) 
    end

    steps = 1
    found = nothing
    seen = Set([(0, 0), (bucket1, 0), (0, bucket2)])
    status = start == 1 ? s = Set([(bucket1, 0), ]) : Set([(0, bucket2), ])

    # have we already found a solution?
    for (v1, v2) in status
        if v1 == goal || v2 == goal
            found = (v1, v2)
        end
    end

    # step
    while found == nothing
        prev_status = status
        status = Set()
        steps += 1
        for (vol1, vol2) in prev_status
            # empty/fill one bucket:
            next_steps = Set([(vol1, 0), (0, vol2), (vol1, bucket2), (bucket1, vol2)])

            # transfers:
            transfer_1to2 = min(vol1, bucket2 - vol2)
            push!(next_steps, (vol1 - transfer_1to2, vol2 + transfer_1to2))

            transfer_2to1 = min(vol2, bucket1 - vol1)
            push!(next_steps, (vol1 + transfer_2to1, vol2 - transfer_2to1))

            # update sets
            for n in setdiff(next_steps, seen)
                push!(status, n)
                push!(seen, n)
            end
        end

        # have we found a solution?
        for (v1, v2) in status
            if v1 == goal || v2 == goal
                found = (v1, v2)
                break
            end
        end
    end

    # Finish
    return found[1] == goal ? (steps, 1, found[2]) : (steps, 2, found[1])
end
