def rows(row_count):
    if row_count < 0:
        raise ValueError("number of rows is negative")

    return row_recurse([[1]], row_count) if row_count > 0 else []


def row_recurse(so_far, row_count):
    prev = so_far[-1]
    if len(prev) == row_count:
        return so_far
    so_far.append(make_row([1], prev))
    return row_recurse(so_far, row_count)


def make_row(accum, rest):
    if rest == [1]:
        accum.append(1)
        return accum
    else:
        accum.append(rest[0] + rest[1])
        return make_row(accum, rest[1:])