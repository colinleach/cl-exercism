library(stringr)

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

valshow <- function(value, suffix) {
  cleaned <- str_remove(str_glue("{value}"), "\\.0")
  str_glue("{cleaned} {suffix}")
}

label <- function(resistor_colors) {
  codes <- sapply(resistor_colors, band_code)
  value <- (10 * codes[1] + codes[2]) * 10^codes[3]
  if (value >= 1e9) return(valshow(value / 1e9, "gigaohms"))
  if (value >= 1e6) return(valshow(value / 1e6, "megaohms"))
  if (value >= 1e3) return(valshow(value / 1e3, "kiloohms"))
  str_glue("{value} ohms")
}
