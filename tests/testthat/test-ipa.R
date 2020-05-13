test_that("single SAMPA to IPA", {
  expect_equal(sampa("\"nom.b4e"), "ˈnom.bɾe")
  expect_equal(sampa("nO~bR"), "nɔ̃bʁ")
})

test_that("multiple SAMPA to IPA", {
  expect_equal(sampa(c("\"nom.b4e", "nO~bR")), c("ˈnom.bɾe", "nɔ̃bʁ"))
})

test_that("single IPA to SAMPA", {
  expect_equal(ipa("ˈnom.bɾe"), "\"nom.b4e")
  expect_equal(ipa("nɔ̃bʁ"), "nO~bR")
})

test_that("multiple SAMPA to IPA", {
  expect_equal(ipa(c("ˈnom.bɾe", "nɔ̃bʁ")), c("\"nom.b4e", "nO~bR"))
})

test_that("simple ARPA to IPA", {
  expect_equal(arpa("AA R P AH"), "ɑɹpʌ")
})

test_that("simple ARPA to SAMPA", {
  expect_equal(arpa("AA R P AH", "xsampa"), "Ar\\pV")
})

test_that("simple IPA to ARPA", {
  expect_equal(ipa("ɑɹpʌ", "arpabet"), "AA R P AH")
})

test_that("simple SAMPA to ARPA", {
  expect_equal(sampa("Ar\\pV", "arpabet"), "AA R P AH")
})
