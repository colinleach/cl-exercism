library("stringr")

is_paired <- function(input) {
  chars <- str_split(input, "") |> unlist()
  brackets <- chars[chars %in% c('[', ']', '{', '}', '(', ')')] |>
    str_flatten()
  pairs <- r"(\(\)|\{\}|\[\])"
  while (str_detect(brackets, pairs))
  {
    brackets <- str_remove(brackets, pairs)
  }
  brackets == ""
}
