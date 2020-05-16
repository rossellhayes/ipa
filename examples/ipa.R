# `ipa()` supports raw Unicode input or escaped Unicode sequences (\uxxxx),
# but raw Unicode is not supported in R package documentation,
# hence the ugly examples
ipa("\\u02cch\\u025b\\'lo\\u028a")
ipa(c("\\u02cch\\u025b\\'lo\\u028a", "w\\u025dld"))

ipa("\\u02cch\\u025b\\'lo\\u028a", to = "arpabet")
ipa(c("\\u02cch\\u025b\\'lo\\u028a", "w\\u025dld"), to = "arpabet")
