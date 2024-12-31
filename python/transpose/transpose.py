def transpose(text):
    if not text:
        return ""
    lines = text.splitlines()
    width = max([len(line) for line in lines])
    output_array = []
    for n in range(width):
        raw_line = [(line[n] if len(line) > n else None) for line in lines]
        while raw_line[-1] is None:
            raw_line.pop()
        output_array.append(''.join([" " if elem is None else elem for elem in raw_line]))
    return '\n'.join(output_array)
