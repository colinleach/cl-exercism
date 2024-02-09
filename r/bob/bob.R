bob <- function(input) {
  input <- trimws(input)
  question <- endsWith(input, "?")
  shout <- grepl("[A-Z]", input) && input == toupper(input)
  
  if (shout && question) return("Calm down, I know what I'm doing!")
  if (shout) return("Whoa, chill out!")
  if (question) return("Sure.")
  ifelse(input != "", "Whatever.", "Fine. Be that way!")
}
