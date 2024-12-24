COLORS = [
        "black",
        "brown",
        "red",
        "orange",
        "yellow",
        "green",
        "blue",
        "violet",
        "grey",
        "white",
        ]

def value(colors):
    codes = [color_code(c) for c in colors[:2]]
    return codes[0] * 10 + codes[1]

def color_code(color):
    return COLORS.index(color)
