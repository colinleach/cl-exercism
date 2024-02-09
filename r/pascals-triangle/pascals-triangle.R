pascals_triangle <- function(row_count) {
  stopifnot(!is.null(row_count) && row_count >= 0)
  if (row_count == 0) return(list())
  lapply(0:(row_count - 1), function(n) choose(n, 0:n))
}
