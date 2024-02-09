library(stringr)

anagram <- function(subject, candidates) {
  subject <- str_to_lower(subject)
  subj_sort <- sorted_word(subject)
  results <- candidates[str_to_lower(candidates) != subject & 
                          sapply(candidates, sorted_word) == subj_sort]
  if (length(results) == 0) c() else results
}

sorted_word <- function(s) {
  s |>
    str_to_lower() |>
    str_split("") |>
    unlist() |>
    sort() |>
    paste(collapse="")
}


