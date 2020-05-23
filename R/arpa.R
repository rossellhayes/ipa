#' Convert phonetic representation from ARPABET (CMU)
#'
#' Converts to IPA or X-SAMPA
#'
#' @param x A phonetic character vector in ARPABET
#' @param to The phonetic alphabet to convert to.
#'     Defaults to `"ipa"`.
#'     `"sampa"` is an accepted alias for `"xsampa"`.
#'
#' @return A character vector the same length as `x`
#' @export
#'
#' @seealso [convert_phonetics()] to convert between any phonetic
#'     representations
#'
#' [ipa()] to convert from IPA
#'
#' [sampa()] and [xsampa()] to convert from X-SAMPA
#'
#' @example examples/arpa.R

arpa <- function(x, to = c("ipa", "xsampa")) {
  to <- alias_encoding(to)
  to <- match.arg(to)
  convert_phonetics(x, from = "arpabet", to = to)
}

#' @rdname arpa
#' @export

arpabet <- arpa

#' @rdname arpa
#' @export

cmu <- arpa
