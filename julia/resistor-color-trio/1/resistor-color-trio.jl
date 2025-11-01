function label(colors)
    codes = [bandcode(c) for c in colors]
    value = (10 * codes[1] + codes[2]) * 10^codes[3]
    value ≥ 1e9 && return valshow(value / 1e9, "gigaohms")
    value ≥ 1e6 && return valshow(value / 1e6, "megaohms")
    value ≥ 1e3 && return valshow(value / 1e3, "kiloohms")
    "$value ohms"
end

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

function valshow(value, suffix)
    cleaned = replace("$value", ".0" => "")
    "$cleaned $suffix"
end
