scores_list <- function(scores) {
  scores
}

latest <- function(scores) {
  tail(scores, 1)
}

personal_best <- function(scores) {
  max(scores)
}

personal_top_three <- function(scores) {
  sorted_scores <- sort(scores, decreasing = TRUE)
  if (length(sorted_scores) >= 3) {
    sorted_scores[1:3]
  } else {
    sorted_scores
  }
}
