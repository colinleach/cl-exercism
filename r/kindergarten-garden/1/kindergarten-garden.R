library(tidyverse)

students <- c("Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny",
               "Harriet", "Ileana", "Joseph", "Kincaid", "Larry")

species <- function(code) {
  switch(code,
         G = "Grass",
         C = "Clover",
         R = "Radish",
         V = "Violet")
}

plants <- function(garden, child) {
  rows <- garden |> str_split_1("\\n") |> str_split("")
  start_col <- 2 * match(child, students) - 1
  owns <- c(rows[[1]][start_col:(start_col + 1)], 
            rows[[2]][start_col:(start_col + 1)])
  owns |> sapply(species) |> unname()
}
