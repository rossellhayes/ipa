library(dplyr)
library(readr)
library(rvest)
library(tibble)

wiki <- read_html("https://en.wikipedia.org/wiki/X-SAMPA")

xsampa <- wiki %>%
  html_nodes("#mw-content-text > div > table:nth-child(n + 11):nth-child(-n + 17) > tbody > tr > td:nth_child(1)") %>%
  html_text()

ipa <- wiki %>%
  html_nodes("#mw-content-text > div > table:nth-child(n + 11):nth-child(-n + 17) > tbody > tr > td:nth-child(2)") %>%
  html_text()

description <- wiki %>%
  html_nodes("#mw-content-text > div > table:nth-child(n + 11):nth-child(-n + 17) > tbody > tr > td:nth-child(4)") %>%
  html_text()

phonemes <- tibble(xsampa = xsampa, ipa = ipa) %>%
  mutate(
    xsampa = gsub(" \\(or.*", "", xsampa),
    ipa    = stringi::stri_escape_unicode(ipa) %>%
      stringr::str_replace_all(c("\\\\u00a0" = "", " " = ""))
  )

write_csv(phonemes, "data-raw/wiki_phonemes.csv")

phonemes <- read_csv("data-raw/phonemes.csv") %>%
  mutate(
    ipa     = stringi::stri_unescape_unicode(ipa),
    arpabet = if_else(is.na(arpabet), NA_character_, paste0(arpabet, " "))
  ) %>%
  mutate_all(~ gsub("([.|()\\^{}+$*?]|\\[|\\])", "\\\\\\1", .)) %>%
  mutate(arpabet = if_else(ipa == "'", "", arpabet)) %>%
  bind_rows(tibble(arpabet = "\\d", ipa = " ", xsampa = " "))

usethis::use_data(phonemes, internal = TRUE, overwrite = TRUE)
