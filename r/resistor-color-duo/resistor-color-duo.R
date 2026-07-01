colors = c(
  "black",
  "brown",
  "red",
  "orange",
  "yellow",
  "green",
  "blue",
  "violet",
  "grey",
  "white"
)

band_code <- function(color) {
  match(color, colors) - 1
}

value <- function(resistor_colors) {
  10 * band_code(resistor_colors[1]) + band_code(resistor_colors[2])
}
