new_clock <- function(hours, minutes) {
  clean_clock(hours * 60L + minutes)
}

clean_clock <- function(mins_since_midnight) {
  mins_in_day <- 24L * 60L
  while (mins_since_midnight < 0) {
    mins_since_midnight = mins_since_midnight + mins_in_day
  }
  mins_since_midnight %% mins_in_day
}

display <- function(clock) {
  sprintf("%02d:%02d", clock %/% 60L, clock %% 60L)
}

add <- function(clock, minutes) {
  clean_clock(clock + minutes)
}

subtract <- function(clock, minutes) {
  add(clock, -minutes)
}
