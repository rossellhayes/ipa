#' Convert phonetic representation from IPA
#'
#' Converts to X-SAMPA or ARPABET (used by the CMU Pronouncing Dictionary)
#'
#' @param x A phonetic character vector in IPA
#' @param to The phonetic alphabet to convert to.
#'     Defaults to `"xsampa"`.
#'     `"sampa"` is an accepted alias for `"xsampa"`.
#'     `"arpa"` and `"cmu"` are accepted aliases for `"arpabet"`.
#'
#' @return A character vector the same length as `x`
#' @export
#'
#' @seealso [convert_phonetics()] to convert between any phonetic
#'     representations
#'
#' [sampa()] and [xsampa()] to convert from X-SAMPA
#'
#' [arpa()], [arpabet()] and [cmu()] to convert from ARPABET (CMU)
#'
#' @example examples/ipa.R

ipa <- function(x, to = c("xsampa", "arpabet")) {
  to <- alias_encoding(to)
  to <- match.arg(to)
  convert_phonetics(x, from = "ipa", to = to)
}
