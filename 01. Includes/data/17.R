
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 17.R ####
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

## Beoordelen studenten een opleiding anders net na het afstuderen en 5 jaar na dato? Studenten worden gevraagd antwoord te geven op de vraag: 
## Hoe goed heeft deze studie je voorbereid op de arbeidsmarkt (erg goed, goed, neutraal, slecht, erg slecht)
RNGkind(sample.kind = "Rounding")
set.seed(0)

st_nr <- sample(600000:700000, 378)

teller_2014 <- c(140, 120, 60, 25, 33)

erg_goed <-   rep("erg goed",        teller_2014[1])
goed <-       rep("goed",            teller_2014[2])
neutraal <-   rep("neutraal",        teller_2014[3])
slecht <-     rep("slecht",          teller_2014[4])
erg_slecht <- rep("erg slecht",      teller_2014[5])

eval_2014 <- c(erg_goed, goed, neutraal, slecht, erg_slecht)
jaar_2014 <- rep(2014, length(eval_2014))

erg_goed <- c(rep("erg goed", teller_2014[1] - 23), rep("goed", 18), rep("neutraal", 3), rep("slecht", 1), rep("erg slecht", 1))
goed <- c(rep("erg goed", 31), rep("goed", teller_2014[2] - 43), rep("neutraal", 6), rep("slecht", 4), rep("erg slecht", 2))
neutraal <- c(rep("erg goed", 9), rep("goed", 16), rep("neutraal", teller_2014[3]-28), rep("slecht", 2), rep("erg slecht", 1))
slecht <- c(rep("erg goed", 3), rep("goed", 4), rep("neutraal", 3), rep("slecht", teller_2014[4]-11), rep("erg slecht", 1))
erg_slecht <- c(rep("erg goed", 3), rep("goed", 1), rep("neutraal", 8), rep("slecht", 3), rep("erg slecht", teller_2014[5]-15))


eval_2019 <- c(erg_goed, goed, neutraal, slecht, erg_slecht)
jaar_2019 <- rep(2019, length(eval_2019))



## Hussel beide vervolgens op de geordende volgorde van het st_nr
eval_2019 <- eval_2019[order(st_nr)]
eval_2014 <- eval_2014[order(st_nr)]


Eval_curriculum <- data.frame(c(st_nr, st_nr),
                              c(jaar_2014, jaar_2019),
                              c(eval_2014, eval_2019))

colnames(Eval_curriculum) <- c("Studentnr", "Jaar", "Waardering")
