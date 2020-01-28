## Maak dummydata aan
RNGkind(sample.kind = "Rounding")
set.seed(1)

Decimalen_wiskunde <- rnorm(160, 7.1, 2.6)
Wiskunde_eindcijfer <- round(Decimalen_wiskunde, 1)[Decimalen_wiskunde <= 10 & Decimalen_wiskunde >= 4.5]

Decimalen_scheikunde <- rnorm(160, 6.8, 2.2)
Scheikunde_eindcijfer <- round(Decimalen_scheikunde, 1)[Decimalen_scheikunde <= 10 & Decimalen_scheikunde >= 4.5]

Decimalen_natuurkunde <- rnorm(160, 7.0, 2.4)
Natuurkunde_eindcijfer <- round(Decimalen_natuurkunde, 1)[Decimalen_natuurkunde <= 10 & Decimalen_natuurkunde >= 4.5]

WNS_eindcijfers <- cbind(Wiskunde_eindcijfer, Scheikunde_eindcijfer, Natuurkunde_eindcijfer)

Gemiddeld_cijfer_WNS <- apply(WNS_eindcijfers, 1, mean)

Gemiddeld_cijfer_WNS_n30 <- sample(Gemiddeld_cijfer_WNS, 30)