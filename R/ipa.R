#' Convert between IPA and X-SAMPA
#'
#' `sampa()` converts (X-)SAMPA to IPA. `ipa()` converts IPA to X-SAMPA.
#'
#' @param x A phonetic character vector in (X-)SAMPA (for `sampa()`) or IPA (for
#'     `ipa()`)
#' @param to The phonetic alphabet to convert to.
#'     Defaults to IPA for `sampa()` and X-SAMPA for `ipa()`.
#'
#' @return A character vector the same langth as `x`
#' @export
#'
#' @example examples/ipa.R

ipa <- function(x, to = c("xsampa", "ipa")) {
  stringr::str_replace_all(
    x, stringr::fixed(`names<-`(phonemes[[match.arg(to)]], phonemes$ipa))
  ) %>%
    stringr::str_replace("'", "\\\"")
}

#' @rdname ipa
#' @export

sampa <- function(x, to = c("ipa", "xsampa")) {
  stringr::str_replace_all(
    x, stringr::fixed(`names<-`(phonemes[[match.arg(to)]], phonemes$xsampa))
  )
}

#' @rdname ipa
#' @export

xsampa <- sampa
