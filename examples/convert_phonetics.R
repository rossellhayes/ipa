convert_phonetics('%hE"loU', from = "xsampa", to = "ipa")
convert_phonetics(c('%hE"loU', "w3`ld"), from = "xsampa", to = "ipa")
convert_phonetics('%hE"loU', from = "xsampa", to = "arpabet")
convert_phonetics(c('%hE"loU', "w3`ld"), from = "xsampa", to = "arpabet")

convert_phonetics('HH EH L OW', from = "arpabet", to = "ipa")
convert_phonetics(c('HH EH L OW', "W ER L D"), from = "arpabet", to = "ipa")
convert_phonetics('HH EH L OW', from = "arpabet", to = "xsampa")
convert_phonetics(c('HH EH L OW', "W ER L D"), from = "arpabet", to = "xsampa")

# `convert_phonetics()` supports raw Unicode input or escaped Unicode sequences
# (\uxxxx), but raw Unicode is not supported in R package documentation,
# hence the ugly examples
convert_phonetics("\\u02cch\\u025b\\'lo\\u028a", from = "ipa", to = "xsampa")
convert_phonetics(
  c("\\u02cch\\u025b\\'lo\\u028a", "w\\u025dld"), from = "ipa", to = "xsampa"
)
convert_phonetics("\\u02cch\\u025b\\'lo\\u028a", from = "ipa", to = "arpabet")
convert_phonetics(
  c("\\u02cch\\u025b\\'lo\\u028a", "w\\u025dld"), from = "ipa", to = "arpabet"
)
