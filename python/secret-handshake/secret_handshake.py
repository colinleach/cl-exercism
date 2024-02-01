def commands(binary_str):
    value = int(binary_str, 2)
    responses = ['wink', 'double blink', 'close your eyes', 'jump']
    actions = [responses[i] for i in range(4) if 1 << i & value]
    return actions[::-1] if 1 << 4 & value else actions
