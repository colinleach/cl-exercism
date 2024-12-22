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

def label(colors):
    codes = [color_code(c) for c in colors]
    value = (codes[0] * 10 + codes[1]) * 10**codes[2]
    if value >= 1_000_000_000:
        return f"{value // 1_000_000_000} gigaohms"
    if value >= 1_000_000:
        return f"{value // 1_000_000} megaohms"
    if value >= 1_000:
        return f"{value // 1_000} kiloohms"
    return f"{value} ohms"

def color_code(color):
    return COLORS.index(color)
