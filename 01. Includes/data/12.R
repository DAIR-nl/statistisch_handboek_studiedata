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
Datum_vooraf <- replicate(length(Vooraf), "December")
Datum_achteraf <- replicate(length(Achteraf), "Juni")

## Hussel met behoudt logische paren
Studentnr <- sample(4000000:5000000, length(Vooraf))
Vooraf <- Vooraf[order(Studentnr)]
Achteraf <- Achteraf[order(Studentnr)]

## Data.frame
FOS_studenten <- data.frame(c(Studentnr, Studentnr),
                            c(Vooraf, Achteraf),
                            c(Datum_vooraf, Datum_achteraf))
colnames(FOS_studenten)<-c("Studentnr", "FOS?", "Datum")

FOS_studenten <- FOS_studenten[order(FOS_studenten$Studentnr),]
