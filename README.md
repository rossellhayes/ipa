
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ipa <img src="man/figures/logo.png?raw=TRUE" align="right" height="138" />

<!-- badges: start -->

[![](https://www.r-pkg.org/badges/version/ipa?color=brightgreen)](https://cran.r-project.org/package=ipa)
[![](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![License:
MIT](https://img.shields.io/badge/license-MIT-blueviolet.svg)](https://cran.r-project.org/web/licenses/MIT)
[![R build
status](https://github.com/rossellhayes/ipa/workflows/R-CMD-check/badge.svg)](https://github.com/rossellhayes/ipa/actions)
[![](https://codecov.io/gh/rossellhayes/ipa/branch/master/graph/badge.svg)](https://codecov.io/gh/rossellhayes/ipa)
[![Dependencies](https://tinyverse.netlify.com/badge/ipa)](https://cran.r-project.org/package=ipa)
<!-- badges: end -->

Convert character vectors between phonetic representations. Supports
[IPA](https://en.wikipedia.org/wiki/International_Phonetic_Alphabet),
[X-SAMPA](https://en.wikipedia.org/wiki/X-SAMPA) and
[ARPABET](https://en.wikipedia.org/wiki/ARPABET) (used by the [CMU
Pronouncing
Dictionary](https://en.wikipedia.org/wiki/CMU_Pronouncing_Dictionary)).

## Installation

You can install the released version of **ipa** from
[CRAN](https://cran.r-project.org/) with:

``` r
install.packages("ipa")
```

Or the development version from GitHub with:

``` r
install_github("rossellhayes/ipa")
```

## Usage

My main use case for **ipa** is including phonetic representations in R
markdown files. You can enter phonetic information as plain-text X-SAMPA
and have it rendered as IPA.

``` r
`r sampa('/aI pi: "eI/')`
```

/aɪ piː ˈeɪ/

``` r
`r sampa(c('/"nom.b4e/', '/nO~bR/'))`
```

/ˈnom.bɾe/, /nɔ̃bʁ/

You can also get the X-SAMPA representation of IPA strings.

``` r
ipa("/aɪ piː ˈeɪ/")
```

`/aI pi: "eI/`

``` r
ipa(c("/ˈnom.bɾe/", "/nɔ̃bʁ/"))
```

`/nom.b4e/`, `/nO~bR/`

<!-- `ipa()` does not work in Rmarkdown, but does work in the console -->

ARPABET support allows **ipa** to automatically convert results from the
[**phon**](https://github.com/coolbutuseless/phon) package.

``` r
# remotes::install_github("coolbutuseless/phon")
arpa(phon::phonemes("pronounce"))
```

pɹʌnaʊns

## Credits

Hex sticker fonts are [Source Code
Pro](https://github.com/adobe-fonts/source-code-pro) and [Source Serif
Pro](https://github.com/adobe-fonts/source-serif-pro) by
[Adobe](https://adobe.com).

-----

Please note that **ipa** is released with a [Contributor Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
