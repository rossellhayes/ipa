trimws <- function(x) {
  whitespace <- "[ \t\r\n]"
  mysub <- function(re, x) sub(re, "", x, perl = TRUE)
  mysub(paste0(whitespace, "+$"), mysub(paste0("^", whitespace, "+"), x))
}
