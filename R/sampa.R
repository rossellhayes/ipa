#' Convert phonetic representation from X-SAMPA
#'
#' Converts to IPA or ARPABET (used by the CMU Pronouncing Dictionary)
#'
#' @param x A phonetic character vector in X-SAMPA
#' @param to The phonetic alphabet to convert to.
#'     Defaults to `"ipa"`.
#'     `"arpa"` and `"cmu"` are accepted aliases for `"arpabet"`.
#'
#' @return A character vector the same length as `x`
#' @export
#'
#' @seealso [convert_phonetics()] to convert between any phonetic
#'     representations
#'
#' [ipa()] to convert from IPA
#'
#' [arpa()], [arpabet()] and [cmu()] to convert from ARPABET (CMU)
#'
#' @example examples/sampa.R

sampa <- function(x, to = c("ipa", "arpabet")) {
  to <- alias_encoding(to)
  to <- match.arg(to)
  convert_phonetics(x, from = "xsampa", to = to)
}

#' @rdname sampa
#' @export

xsampa <- sampa
