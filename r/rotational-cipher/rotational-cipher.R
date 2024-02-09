library(stringr)

rotate <- function(text, key) {
  a <- utf8ToInt("a")
  z <- utf8ToInt("z")
  A <- utf8ToInt("A")
  Z <- utf8ToInt("Z")
  
  rotate_char <- function(char) {
    plain <- utf8ToInt(char)
    if (plain %in% a:z) return(intToUtf8(a + (plain - a + key) %% 26))
    if (plain %in% A:Z) return(intToUtf8(A + (plain - A + key) %% 26))
    char
  }
  
  text |>
    str_split_1("") |>
    lapply(rotate_char) |>
    paste(collapse="")
}
 
