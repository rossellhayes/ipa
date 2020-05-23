#' Convert between phonetic representations
#'
#' Converts between IPA, X-SAMPA and ARPABET (used by the CMU Pronouncing
#' Dictionary)
#'
#' @param x A phonetic character vector in IPA, X-SAMPA, or ARPABET
#' @param from The phonetic alphabet to convert from
#' @param to The phonetic alphabet to convert to.
#'     `"sampa"` is an accepted alias for `"xsampa"`.
#'     `"arpa"` and `"cmu"` are accepted aliases for `"arpabet"`.
#'
#' @return A character vector the same length as `x`
#' @export
#'
#' @seealso [ipa()] to convert from IPA
#'
#' [sampa()] and [xsampa()] to convert from X-SAMPA
#'
#' [arpa()], [arpabet()] and [cmu()] to convert from ARPABET (CMU)
#'
#' @example examples/convert_phonetics.R

convert_phonetics <- function(
  x, from = c("ipa", "xsampa", "arpabet"), to = c("ipa", "xsampa", "arpabet")
) {
  op <- options(stringsAsFactors = FALSE)
  on.exit(options(op), add = TRUE)

  from <- alias_encoding(from)
  from <- match.arg(from)
  to   <- alias_encoding(to)
  to   <- match.arg(to)

  phonemes <- phonemes[
    !is.na(phonemes[[to]]) & !is.na(phonemes[[from]]) & phonemes[[from]] != "",
  ]
  phonemes <- phonemes[
    order(
      phonemes[[to]] == " ",
      nchar(phonemes[[from]]),
      nchar(phonemes[[to]]),
      decreasing = TRUE
    ),
  ]
  phonemes[[from]] <- paste0(phonemes[[from]], "(?![^\\(]*[\\)])")
  phonemes[[to]]   <- paste0("(", phonemes[[to]], ")")
  phonemes         <- rbind(
    if (from == "arpabet") data.frame(arpabet = "\\d", ipa = " ", xsampa = " "),
    phonemes,
    if (from == "arpabet") data.frame(arpabet = " ", ipa = "", xsampa = ""),
    data.frame(arpabet = "", ipa = "", xsampa = ""),
    stringsAsFactors = FALSE
  )
  phonemes[[nrow(phonemes), from]] <- "\\(|\\)"

  if (from == "arpabet" & any(grepl("\\d", x))) {
    warning("Stress is not supported for ARPABET, so stresses were removed.")
  } else if (
    to == "arpabet" & (
      (from == "ipa" & any(grepl("\u02c8|\u02cc", x))) |
      (from == "xsampa" & any(grepl("%|\"", x)))
    )
  ) {
    warning("Stress is not supported for ARPABET, so stresses were removed.")
  }

  trimws(
    stringi::stri_replace_all_regex(
      str           = paste0(" ", x, " "),
      pattern       = phonemes[[from]],
      replacement   = phonemes[[to]],
      vectorize_all = FALSE
    )
  )
}
