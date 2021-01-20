## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 18.R ####
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
## 09-11-2020: EG: Aanmaak bestand
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## De studieadviseur van de bachelor Leisure & Events Management geeft halverwege het eerste studiejaar een voorlopig BSA-advies aan alle eerstejaars studenten. Studenten ontvangen een positief, negatief of uitgesteld BSA.  Daarnaast voert zij met alle studenten persoonlijke gesprekken om het advies toe te lichten en een plan voor de rest van het studiejaar te maken. De studieadviseur wil graag onderzoeken of er verschillen zijn tussen het voorlopige BSA-advies halverwege het jaar en het definitieve advies aan het einde van het jaar zodat ze de effectiviteit van de persoonlijke gesprekken kan beoordelen.

set.seed(12345, 
         kind = "Mersenne-Twister", 
         normal.kind = "Inversion",
         sample.kind = "Rejection")

Studentnummer <- sample(4000000:5000000, 
                        150)
Studentnummer <- rep(Studentnummer,
                     2)

BSA_adviezen <- c("Positief",
                  "Negatief",
                  "Uitgesteld")

BSA_advies_voorlopig <- sample(BSA_adviezen,
                     150,
                     prob = c(0.64,
                              0.25,
                              0.11),
                     replace = TRUE)

BSA_advies_definitief <- sample(BSA_adviezen,
                     150,
                     prob = c(0.78,
                              0.14,
                              0.08),
                     replace = TRUE)

BSA_advies <- c(BSA_advies_voorlopig,
                BSA_advies_definitief)

Soort_BSA <- c(rep("Voorlopig",
                 150),
               rep("Definitief",
                   150))

BSA_LEM <- data.frame(Studentnummer,
                      Soort_BSA,
                      BSA_advies)

rm(
  Studentnummer,
  BSA_advies,
  BSA_advies_definitief,
  BSA_advies_voorlopig,
  Soort_BSA,
  BSA_adviezen
)

