def transform(legacy_data):
    output = dict()
    for k, v in legacy_data.items():
        for letter in v:
            output[letter.lower()] = k
    return output