library(dplyr)
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
  mutate(xsampa = gsub(" \\(or.*", "", xsampa)) %>%
  filter(xsampa != "", ipa != "", xsampa != "~") %>%
  bind_rows(tibble(xsampa = "~", ipa = "\u0303")) %>%
  arrange(desc(nchar(xsampa)))

usethis::use_data(phonemes, internal = TRUE, overwrite = TRUE)
