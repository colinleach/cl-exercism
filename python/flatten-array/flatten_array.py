def flatten(iterable):
    output = []
    for item in iterable:
        if item is None:
            continue
        if isinstance(item, list):
            output.extend(flatten(item))
        else:
            output.append(item)
    return output
