#' Convert between IPA and X-SAMPA
#'
#' - `ipa()` converts from IPA.
#' - `sampa()` converts from X-SAMPA.
#' - `arpa()` converts from ARPABET (used by the CMU Pronouncing Dictionary).
#'
#' @param x A phonetic character vector in IPA (for `ipa()`),
#'     X-SAMPA (for `sampa()`) or ARPABET (for `arpa()`).
#' @param to The phonetic alphabet to convert to.
#'     Defaults to `"ipa"` for `sampa()` and `arpa()` and `"xsampa"` for `ipa()`.
#'
#' @return A character vector the same length as `x`
#' @export
#'
#' @example examples/ipa.R

ipa <- function(x, to = c("xsampa", "arpabet")) {
  phonemes <- phonemes[
    !is.na(phonemes[[match.arg(to)]]) & !is.na(phonemes$ipa),
  ]
  phonemes <- phonemes[
    order(
      nchar(phonemes[[match.arg(to)]]), nchar(phonemes$ipa), decreasing = TRUE
    ),
  ]

  x <- trimws(
    stringr::str_replace_all(
      x, `names<-`(phonemes[[match.arg(to)]], phonemes$ipa)
    )
  )

  if (match.arg(to) == "xsampa") x <- gsub("'", '"', x)

  x
}

#' @rdname ipa
#' @export

sampa <- function(x, to = c("ipa", "arpabet")) {
  phonemes <- phonemes[
    !is.na(phonemes[[match.arg(to)]]) & !is.na(phonemes$xsampa),
  ]
  phonemes <- phonemes[
    order(
      nchar(phonemes[[match.arg(to)]]),
      nchar(phonemes$xsampa),
      decreasing = TRUE
    ),
  ]
  phonemes$xsampa           <- paste0(phonemes$xsampa, "(?![^\\(]*[\\)])")
  phonemes[[match.arg(to)]] <- paste0("(", phonemes[[match.arg(to)]], ")")

  trimws(
    gsub(
      "\\(|\\)",
      "",
      stringr::str_replace_all(
        x, `names<-`(phonemes[[match.arg(to)]], phonemes$xsampa)
      )
    )
  )
}

#' @rdname ipa
#' @export

arpa <- function(x, to = c("ipa", "xsampa")) {
  phonemes <- phonemes[
    !is.na(phonemes[[match.arg(to)]]) & !is.na(phonemes$arpabet),
  ]
  phonemes <- phonemes[
    order(
      nchar(phonemes[[match.arg(to)]]),
      nchar(phonemes$arpabet),
      decreasing = TRUE
    ),
  ]
  phonemes$arpabet          <- paste0(phonemes$arpabet, "(?![^\\(]*[\\)])")
  phonemes[[match.arg(to)]] <- paste0("(", phonemes[[match.arg(to)]], ")")

  x <- paste0(" ", x, " ")

  trimws(
    gsub(
      "\\(|\\)",
      "",
      stringr::str_replace_all(
        x, `names<-`(phonemes[[match.arg(to)]], phonemes$arpabet)
      )
    )
  )
}
