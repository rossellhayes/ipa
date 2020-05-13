test_that("single SAMPA to IPA", {
  expect_equal(xsampa("\"nom.b4e"), "ˈnom.bɾe")
  expect_equal(xsampa("nO~bR"), "nɔ̃bʁ")
})

test_that("multiple SAMPA to IPA", {
  expect_equal(xsampa(c("\"nom.b4e", "nO~bR")), c("ˈnom.bɾe", "nɔ̃bʁ"))
})

test_that("single IPA to SAMPA", {
  expect_equal(ipa("ˈnom.bɾe"), "\"nom.b4e")
  expect_equal(ipa("nɔ̃bʁ"), "nO~bR")
})

test_that("multiple SAMPA to IPA", {
  expect_equal(ipa(c("ˈnom.bɾe", "nɔ̃bʁ")), c("\"nom.b4e", "nO~bR"))
})
