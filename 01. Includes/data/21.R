
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 21.R ####
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
## De controller van een Universiteit is geïnteresseerd in de instroom van tweedekansstudenten. Zij vraagt zich af: Heeft onze Universiteit relatief veel tweedekansstudenten in vergelijking met het landelijke gemiddelde?

set.seed(12345, 
         kind = "Mersenne-Twister", 
         normal.kind = "Inversion",
         sample.kind = "Rejection")
Studentnummer <- sample(4000000:5000000, 432)

BSA_adviezen <- c("Positief",
                  "Negatief",
                  "Uitgesteld")

BSA_advies <- sample(BSA_adviezen,
                     432,
                     prob = c(0.64,
                              0.25,
                              0.11),
                     replace = TRUE)

BSA_Maritieme_techniek <- data.frame(Studentnummer,
                                     BSA_advies)

set.seed(12345)
Studentnummer <- sample(4000000:5000000, 40)

BSA_adviezen <- c("Positief",
                  "Negatief",
                  "Uitgesteld")

BSA_advies <- sample(BSA_adviezen,
                     40,
                     prob = c(0.82,
                              0.10,
                              0.08),
                     replace = TRUE)

BSA_Maritieme_techniek_steekproef <- data.frame(Studentnummer,
                                     BSA_advies)


rm(
  Studentnummer,
  BSA_advies,
  BSA_adviezen
)

## Sla de datasets op
#write.csv(BSA_Maritieme_techniek,
#          file = "05. Datasets/21_BSA_Maritieme_techniek.csv")

#write.csv(BSA_Maritieme_techniek_steekproef,
#          file = "05. Datasets/21_BSA_Maritieme_techniek_steekproef.csv")

