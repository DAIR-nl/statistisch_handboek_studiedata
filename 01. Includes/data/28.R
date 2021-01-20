## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 28.R  ####
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
## 17-07-2020: EG: Aanmaak bestand
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Toets: multipele lineaire regressie

## Casus
# De docent van het van Methoden & Statistiek van de bachelor Onderwijskunde wil 
# zijn studenten ervan overtuigen dat het nuttig is om naar zijn colleges te 
# komen. Hij wil daarom onderzoeken of er een relatie is tussen het aantal 
# colleges dat studenten volgen en het eindcijfer voor zijn vak. Daarnaast 
# vermoedt hij dat het eindexamencijfer voor wiskunde ook gerelateerd is aan het 
# eindcijfer voor het vak en dat er man-vrouw verschillen zouden kunnen zijn. Op 
# basis van de data van vorig jaar onderzoekt hij of er een relatie is tussen het 
# aantal hoorcolleges dat studenten volgen, waarbij hij rekening houdt met het 
# eindexamencijfer wiskunde en man-vrouw verschillen. Met de resultaten hiervan 
# hoopt hij zijn studenten ervan te overtuigen om de hoorcolleges van het vak 
# bij te wonen.

# seed
set.seed(1234, kind = "Mersenne-Twister", 
         normal.kind = "Inversion",
         sample.kind = "Rejection")

## Simuleer data

# Aantal hoorcolleges: tussen 1 en 10, zwartepunt bij twee keer en acht keer
Aantal_Hoorcolleges <- sample.int(10, 
                                  100, 
                                  replace = TRUE,
                                  prob = c(0.05,
                                           0.1,
                                           0.2,
                                           0.1,
                                           0.05,
                                           0.05,
                                           0.1,
                                           0.2,
                                           0.05,
                                           0.1))

# Geslacht
Geslacht <- c(rep("Man", 
                  40),
              rep("Vrouw", 
                  60))[sample.int(100,100)]
Geslacht_dummy <- rep(1,
                      100)
Geslacht_dummy[Geslacht == "Man"] <- 0

# Eindexamencijfer wiskunde middelbare school
Eindexamencijfer_Wiskunde <- ceiling(2 * rnorm(100,
                                         7,
                                         1))/2
Eindexamencijfer_Wiskunde[Eindexamencijfer_Wiskunde < 5.5] <- 5.5
Eindexamencijfer_Wiskunde[Eindexamencijfer_Wiskunde > 10] <- 10.0

# Maak afhankelijke variabele eindcijfer Methoden & Statistiek
Eindcijfer_MS <- 2 + 0.4 * Aantal_Hoorcolleges + 0 * Geslacht_dummy + 0.25 * Eindexamencijfer_Wiskunde + rnorm(100,0,1)
Eindcijfer_MS <- round(Eindcijfer_MS,
                       1)
Eindcijfer_MS[Eindcijfer_MS > 10] <- 10.0
hist(Eindcijfer_MS)


sum(Eindcijfer_MS > 5.5)

# Maak studentnummer
Studentnummer <- sample(300000:400000,
                            100)

# Maak dataframe
Studenten_Methoden_Statistiek <- data.frame(Studentnummer,
                                            Geslacht,
                                            Eindexamencijfer_Wiskunde,
                                            Aantal_Hoorcolleges,
                                            Eindcijfer_MS)

# lm
#model <- lm(Eindcijfer_MS ~ Geslacht + Eindexamencijfer_Wiskunde + Aantal_Hoorcolleges,
#   Studenten_Methoden_Statistiek)
#summary(model)

# Bootstrap
#library(car)
#Regressiemodel <- lm(Eindcijfer_MS ~ Geslacht + Eindexamencijfer_Wiskunde + Aantal_Hoorcolleges, Studenten_Methoden_Statistiek)
#Bootstrap_resultaat <- Boot(Regressiemodel, R = 10000)
#summary(Bootstrap_resultaat)
#confint(Bootstrap_resultaat, type = "bca")

rm(Studentnummer,
   Geslacht,
   Geslacht_dummy,
   Eindexamencijfer_Wiskunde,
   Aantal_Hoorcolleges,
   Eindcijfer_MS
   )

#vv <- lm(Eindcijfer_MS ~ 1, Studenten_Methoden_Statistiek )
#summary(vv)
