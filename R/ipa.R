#' Convert between IPA, X-SAMPA and ARPABET (CMU)
#'
#' - `ipa()` converts from IPA.
#' - `sampa()` and `xsampa()` convert from X-SAMPA.
#' - `arpa()`, `arpabet()` and `cmu()` convert from ARPABET (used by the CMU
#'   Pronouncing Dictionary).
#'
#' @param x A phonetic character vector in IPA (for `ipa()`),
#'     X-SAMPA (for `sampa()`) or ARPABET (for `arpa()`).
#' @param to The phonetic alphabet to convert to.
#'     Defaults to `"ipa"` for `sampa()` and `arpa()` and `"xsampa"` for `ipa()`.
#'     `"sampa"` is an accepted alias for `"xsampa"`.
#'     `"arpa"` and `"cmu"` are accepted aliases for `"arpabet"`.
#'
#' @return A character vector the same length as `x`
#' @export
#'
#' @encoding UTF-8
#'
#' @example examples/ipa.R

ipa <- function(x, to = c("xsampa", "arpabet")) {
  if (length(to) == 1) {
    to <- switch(to, sampa = "xsampa", arpa  = "arpabet", cmu = "arpabet", to)
  }
  to <- match.arg(to)

  phonemes <- phonemes[!is.na(phonemes[[to]]) & !is.na(phonemes$ipa), ]
  phonemes <- phonemes[
    order(nchar(phonemes[[to]]), nchar(phonemes$ipa), decreasing = TRUE),
  ]

  if (to == "arpabet") {
    if (any(grepl("\u02c8|\u02cc", x))) {
      warning("Stress is not supported for ARPABET, so stresses were removed.")
    }
  }

  x <- trimws(
    stringr::str_replace_all(x, `names<-`(phonemes[[to]], phonemes$ipa))
  )

  if (match.arg(to) == "xsampa") x <- gsub("'", '"', x)

  x
}

#' @rdname ipa
#' @export

sampa <- function(x, to = c("ipa", "arpabet")) {
  if (length(to) == 1) to <- switch(to, arpa = "arpabet", cmu = "arpabet", to)
  to <- match.arg(to)

  phonemes <- phonemes[!is.na(phonemes[[to]]) & !is.na(phonemes$xsampa), ]
  phonemes <- phonemes[
    order(nchar(phonemes$xsampa), nchar(phonemes[[to]]), decreasing = TRUE),
  ]
  phonemes$xsampa           <- paste0(phonemes$xsampa, "(?![^\\(]*[\\)])")
  phonemes[[match.arg(to)]] <- paste0("(", phonemes[[to]], ")")

  if (to == "arpabet") {
    if (any(grepl("%|\"", x))) {
      warning("Stress is not supported for ARPABET, so stresses were removed.")
    }
  }

  trimws(
    gsub(
      "\\(|\\)",
      "",
      stringr::str_replace_all(x, `names<-`(phonemes[[to]], phonemes$xsampa))
    )
  )
}

#' @rdname ipa
#' @export

xsampa <- sampa

#' @rdname ipa
#' @export

arpa <- function(x, to = c("ipa", "xsampa")) {
  if (length(to) == 1) to <- switch(to, sampa = "xsampa", to)
  to <- match.arg(to)

  phonemes <- phonemes[
    !is.na(phonemes[[to]]) & !is.na(phonemes$arpabet) & phonemes$arpabet != "",
  ]
  phonemes <- phonemes[
    order(
      phonemes[[to]] == " ",
      nchar(phonemes$arpabet),
      nchar(phonemes[[to]]),
      decreasing = TRUE
    ),
  ]
  phonemes$arpabet          <- paste0(phonemes$arpabet, "(?![^\\(]*[\\)])")
  phonemes[[match.arg(to)]] <- paste0("(", phonemes[[to]], ")")
  phonemes                  <- rbind(
    data.frame(arpabet = "\\d", ipa = " ", xsampa = " "),
    phonemes,
    stringsAsFactors = FALSE
  )


  x <- paste0(" ", x, " ")

  if (any(grepl("\\d", x))) {
    warning("Stress is not supported for ARPABET, so stresses were removed.")
  }

  trimws(
    gsub(
      "\\(|\\)| ",
      "",
      stringr::str_replace_all(
        x, c(`names<-`(phonemes[[to]], phonemes$arpabet))
      )
    )
  )
}

#' @rdname ipa
#' @export

arpabet <- arpa

#' @rdname ipa
#' @export

cmu <- arpa
