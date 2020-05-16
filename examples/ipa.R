sampa("aI pi: \"eI")
sampa(c("\"nom.b4e", "nO~bR"))
sampa("Ar\\pV", "arpa")

arpa("AA R P AH")
arpa("AA R P AH", "xsampa")

# `ipa()` supports raw Unicode input or escaped Unicode sequences (\uxxxx),
# but raw Unicode is not supported in R package documentation,
# hence the ugly examples

ipa("a\u026a pi\u02d0 \'e\u026a")
ipa(c("\'nom.b\u027ee", "n\u0254\u0303b\u0281"))
ipa("\u0251\u0279p\u028c", "arpa")
