library(tidyverse)

schedule_appointment <- function(appointment) {
  mdy_hms(appointment)
}

has_passed <- function(appointment) {
  appointment < now("UTC")
}

is_afternoon_appointment <- function(appointment) {
  hour(appointment) >= 12 && hour(appointment) < 18
}

day_of_week <- function(appointment) {
  wday(appointment, week_start = 1)
}

reschedule <- function(appointment) {
  appt <- schedule_appointment(appointment)
  dow <- day_of_week(appt)
  if_else(dow >= 5, appt + days(12 - dow), appt + days(5 - dow))
}
