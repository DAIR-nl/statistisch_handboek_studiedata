## De decaan van een Hogeschool merkt dat weinig studenten met een functiebeperking een beroep doen op de Financiële Ondersteuning Studenten (FOS).
## Ze besluit daarom in December al deze studenten een e-mail te sturen over de FOS.
## Een half jaar later maakt ze de balans op: doen studenten met een functiebeperking vaker een beroep op de FOS na een ingreep van de studentendecaan?

## Stel RNG seed vast
RNGkind(sample.kind = "Rounding")
set.seed (1)

## Vooraf
Wel_vooraf <- replicate(1388, "ja")
Niet_vooraf <- replicate(1455, "nee")
Vooraf <- c(Wel_vooraf, Niet_vooraf)

## Achteraf
Wel_achteraf <- replicate(1475, "ja")
Niet_achteraf <- replicate(1368, "nee")
Achteraf <- c(Wel_achteraf, Niet_achteraf)

## Datum
Maand_vooraf <- replicate(length(Vooraf), "december")
Maand_achteraf <- replicate(length(Achteraf), "juni")

## Hussel met behoudt logische paren
Studentnummer <- sample(4000000:5000000, length(Vooraf))
Vooraf <- Vooraf[order(Studentnummer)]
Achteraf <- Achteraf[order(Studentnummer)]
## Data.frame
FOS_studenten <- data.frame(c(Studentnummer, Studentnummer),
                            c(Vooraf, Achteraf),
                            c(Maand_vooraf, Maand_achteraf))
colnames(FOS_studenten)<-c("Studentnummer", "FOS", "Maand")

FOS_studenten <- FOS_studenten[order(FOS_studenten$Studentnummer),]

### Exact McNemar toets
EMN_confusiematrix <- as.table(matrix(c(20,3,4,25),2,2,byrow=TRUE))
rownames(EMN_confusiematrix) <- c("December_ja","December_nee")
colnames(EMN_confusiematrix) <- c("Juni_ja","Juni_nee")

EMN_kruistabel <- matrix(NA,2,2)
EMN_kruistabel[1:2,1] <- rowSums(EMN_confusiematrix)
EMN_kruistabel[1:2,2] <- colSums(EMN_confusiematrix)
EMN_kruistabel <- as.table(EMN_kruistabel)
rownames(EMN_kruistabel) <- c("FOS","geen FOS")
colnames(EMN_kruistabel) <- c("December","Juni")