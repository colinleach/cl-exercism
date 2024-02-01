def is_paired(input_string):
    opening = {'[', '{', '('}
    closing = {']', '}', ')'}
    pairs = {('[', ']'), ('{', '}'), ('(', ')')}
    stack = list()

    for char in input_string:
        if char in opening:
            stack.append(char)
        elif char in closing:
            if not stack or (stack.pop(), char) not in pairs:
                return False
    return stack == []



