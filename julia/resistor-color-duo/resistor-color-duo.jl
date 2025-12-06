colorcode(colors) = 10 * bandcode(colors[1]) + bandcode(colors[2])

colors_vec = [
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

bandcode(color) = findfirst(x -> x == color, colors_vec) - 1
