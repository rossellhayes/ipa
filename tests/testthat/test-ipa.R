test_that("single SAMPA to IPA", {
  expect_equal(sampa("\"nom.b4e"), "ˈnom.bɾe")
  expect_equal(sampa("nO~bR"), "nɔ̃bʁ")
  expect_equal(sampa('%hE"loU'), "ˌhɛˈloʊ")
  expect_equal(sampa("/%foU.naI\"if/"), "/ˌfoʊ.naɪˈif/")
})

test_that("multiple SAMPA to IPA", {
  expect_equal(sampa(c("\"nom.b4e", "nO~bR")), c("ˈnom.bɾe", "nɔ̃bʁ"))
  expect_equal(sampa(c('%hE"loU', "w3`ld")), c("ˌhɛˈloʊ", "wɝld"))
})

test_that("single IPA to SAMPA", {
  expect_equal(ipa("ˈnom.bɾe"), "\"nom.b4e")
  expect_equal(ipa("nɔ̃bʁ"), "nO~bR")
  expect_equal(ipa("ˌhɛˈloʊ"), '%hE"loU')
  expect_equal(ipa("/ˌfoʊ.naɪˈif/"), "/%foU.naI\"if/")
})

test_that("multiple IPA to SAMPA", {
  expect_equal(ipa(c("ˈnom.bɾe", "nɔ̃bʁ")), c("\"nom.b4e", "nO~bR"))
  expect_equal(ipa(c("ˌhɛˈloʊ", "wɝld")), c('%hE"loU', "w3`ld"))
})

test_that("simple ARPA to IPA", {
  expect_equal(arpa("AA R P AH"), "ɑɹpʌ")
  expect_equal(arpa("HH EH L OW"), "hɛloʊ")
})

test_that("multiple ARPA to IPA", {
  expect_equal(arpa(c('HH EH L OW', "W ER L D")), c("hɛloʊ", "wɝld"))
})

test_that("simple ARPA to SAMPA", {
  expect_equal(arpa("AA R P AH", "xsampa"), "Ar\\pV")
  expect_equal(arpa("HH EH L OW", "xsampa"), "hEloU")
})

test_that("multiple ARPA to SAMPA", {
  expect_equal(arpa(c('HH EH L OW', "W ER L D"), "xsampa"), c("hEloU", "w3`ld"))
})

test_that("simple IPA to ARPA", {
  expect_equal(ipa("ɑɹpʌ", "arpabet"), "AA R P AH")
  expect_equal(ipa("hɛloʊ", "arpabet"), "HH EH L OW")
})

test_that("multiple IPA to ARPA", {
  expect_equal(ipa(c("hɛloʊ", "wɝld"), "arpabet"), c('HH EH L OW', "W ER L D"))
})

test_that("simple SAMPA to ARPA", {
  expect_equal(sampa("Ar\\pV", "arpabet"), "AA R P AH")
  expect_equal(sampa("hEloU", "arpabet"), "HH EH L OW")
})

test_that("multiple SAMPA to ARPA", {
  expect_equal(
    sampa(c("hEloU", "w3`ld"), "arpabet"), c('HH EH L OW', "W ER L D")
  )
})

test_that("warnings for ARPA stress", {
  expect_warning(ipa("ˌhɛˈloʊ", "arpabet"))
  expect_warning(sampa('%hE"loU', "arpabet"))
  expect_warning(arpa("HH EH2 L OW1"))
  expect_warning(arpa("HH EH2 L OW1", "xsampa"))
})

test_that("alias functions work", {
  expect_equal(sampa('hEloU'), xsampa('hEloU'))
  expect_equal(arpa("HH EH L OW"), arpabet("HH EH L OW"))
  expect_equal(arpa("HH EH L OW"), cmu("HH EH L OW"))
})

test_that("alias to works", {
  expect_equal(ipa("hɛloʊ", "xsampa"), ipa("hɛloʊ", "sampa"))
  expect_equal(ipa("hɛloʊ", "arpabet"), ipa("hɛloʊ", "arpa"))
  expect_equal(ipa("hɛloʊ", "arpabet"), ipa("hɛloʊ", "cmu"))
  expect_equal(sampa('hEloU', "arpabet"), sampa('hEloU', "arpa"))
  expect_equal(sampa('hEloU', "arpabet"), sampa('hEloU', "cmu"))
  expect_equal(arpa("HH EH L OW", "xsampa"), arpa("HH EH L OW", "sampa"))
})
