library(stringr)

parse_phone_number <- function(number_string) {
  cleaned <- number_string |>
    str_remove_all("[+\\-\\(\\)\\.\\s]")
  if (!str_detect(cleaned, "^1?[2-9][:digit:]{2}[2-9][:digit:]{6}$")) 
    return(NULL)
  ifelse(str_detect(cleaned, "^1[:digit:]{10}$"),
         str_sub(cleaned, 2), 
         cleaned)
}
