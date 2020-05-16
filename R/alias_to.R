alias_encoding <- function(encoding) {
  if (length(encoding) == 1) {
    encoding <- switch(
      encoding, sampa = "xsampa", arpa  = "arpabet", cmu = "arpabet", encoding
    )
  }

  encoding
}
