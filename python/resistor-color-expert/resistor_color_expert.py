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

TOLERANCES = {
    "grey": "0.05",
    "violet": "0.1",
    "blue": "0.25",
    "green": "0.5",
    "brown": "1",
    "red": "2",
    "gold": "5",
    "silver": "10",
}

def resistor_label(colors):
    codes = [COLORS.index(c) for c in colors]
    if len(colors) == 1:
        return f"{codes[0]} ohms"

    if len(colors) == 4:
        value = (codes[0] * 10 + codes[1]) * 10 ** codes[2]
        tolerance = TOLERANCES[colors[3]]
    elif len(colors) > 4:
        value = (codes[0] * 100 + codes[1] * 10 + codes[2]) * 10 ** codes[3]
        tolerance = TOLERANCES[colors[4]]
    else:
        return "Invalid resistor"

    if value >= 1_000_000_000:
        unit = "gigaohms"
        divisor = 1_000_000_000
    elif value >= 1_000_000:
        unit = "megaohms"
        divisor = 1_000_000
    elif value >= 1_000:
        unit = "kiloohms"
        divisor = 1_000
    else:
        unit = "ohms"
        divisor = 1

    value /= divisor
    if value.is_integer():
        value = int(value)
    return f"{value} {unit} ±{tolerance}%"
