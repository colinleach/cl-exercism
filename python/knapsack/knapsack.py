def maximum_value(maximum_weight, items):
    if len(items) == 0:
        return 0

    maxes = [[0] * (maximum_weight + 1)]
    for item_count in range(len(items)):
        row = [0,]
        for weight in range(1, maximum_weight + 1):
            prev_row = maxes[-1][weight]
            curr_weight = items[item_count]["weight"]
            if curr_weight > weight:
                row.append(prev_row)
            else:
                replace_last = maxes[-1][weight - curr_weight] + items[item_count]["value"]
                row.append(max([prev_row, replace_last]))
        maxes.append(row)
    return maxes[-1][-1]
