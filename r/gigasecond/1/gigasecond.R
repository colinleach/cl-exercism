library(lubridate)

add_gigasecond <- function(moment) {
  moment + seconds(1e9)
}
