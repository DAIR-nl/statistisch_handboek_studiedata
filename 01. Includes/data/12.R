## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 12.R ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R code voor Student Analytics Vrije Universiteit Amsterdam
## Copyright 2020 VU
## Web Page: http://www.vu.nl
## Contact: Theo Bakker (t.c.bakker@vu.nl)
## Verspreiding buiten de VU: Ja
##
## Doel: Doel
##
## Afhankelijkheden: Afhankelijkheid
##
## Datasets: Datasets
##
## Opmerkingen:
## 1) Geen.
## 2) ___
##
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## TODO:
## 1) ___.
##
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Geschiedenis:
## 29-06-2020: EG: Aanmaak bestand
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## De decaan van een Hogeschool merkt dat weinig studenten met een functiebeperking een beroep doen op de Financiële Ondersteuning Studenten (FOS).
## Ze besluit daarom in December al deze studenten een e-mail te sturen over de FOS.
## Een half jaar later maakt ze de balans op: doen studenten met een functiebeperking vaker een beroep op de FOS na een ingreep van de studentendecaan?

## Stel RNG seed vast
#RNGkind(sample.kind = "Rounding")
set.seed(1, 
         kind = "Mersenne-Twister", 
         normal.kind = "Inversion",
         sample.kind = "Rejection")

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
colnames(FOS_studenten) <- c("Studentnummer", "FOS", "Maand")

FOS_studenten <- FOS_studenten[order(FOS_studenten$Studentnummer),]

#https://aaronschlegel.me/mcnemars-test-paired-data-python.html

rm(
Wel_vooraf, 
Niet_vooraf, 
Vooraf, 
Wel_achteraf, 
Niet_achteraf, 
Achteraf, 
Maand_vooraf, 
Maand_achteraf, 
Studentnummer
)

## Sla de datasets op
write.csv(FOS_studenten,
          file = "05. Datasets/12_FOS_studenten.csv")
