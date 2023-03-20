def is_valid(matrix):
    lens = [len(r) for r in matrix]
    return min(lens) == max(lens)


def saddle_points(matrix):
    if matrix == []:
        return []

    if not is_valid(matrix):
        raise ValueError("irregular matrix")

    cols = list(zip(*matrix))
    rowmax = [max(r) for r in matrix]
    colmin = [min(c) for c in cols]

    result = []
    for i, row in enumerate(matrix):
        for j, col in enumerate(cols):
            if row[j] == rowmax[i] and col[i] == colmin[j]:
                result.append({"row": i + 1, "column": j + 1})
    return result