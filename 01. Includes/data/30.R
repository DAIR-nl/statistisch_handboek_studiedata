## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 30.R  ####
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

## Toets: Factoriele repeated measures ANOVA

## Casus
# De opleidingsdirecteur van de bachelor Leisure Management van een hogeschool 
# wil onderzoeken of de manier van toetsing invloed heeft op de resultaten van 
# studenten in het eerste studiejaar. In het eerste studiejaar volgen de 
# studenten in elke onderwijsperiode een theoretisch vak dat wordt afgesloten 
# met een tentamen en een praktijkvak dat wordt afgesloten met een casus. Om 
# het onderwijs te verbeteren wil de opleidingsdirecteur uitzoeken of er 
# verschillen zijn tussen de vier onderwijsperiodes qua gemiddelde cijfers. 
# Daarnaast is zij nieuwsgierig of er een verschil is tussen de becijfering van 
# de theoretische en praktische vakken, en of deze verschillen afhangen van de 
# onderwijsperiode.


# seed
set.seed(12345, 
         kind = "Mersenne-Twister", 
         normal.kind = "Inversion",
         sample.kind = "Rejection")

# Maak studentnummers
Studentnummer <- sample(4000000:4500000, 
                        120)
Studentnummer <- as.factor(Studentnummer)
Studentnummer <- rep(Studentnummer,
                     8)
# Cijfers Theorie Periode 1
Cijfers_T1 <- rnorm(120,
                    6.4,
                    1)

# Cijfers Praktijk Periode 1
Cijfers_P1 <- rnorm(120,
                    7.2,
                    1)

# Cijfers Theorie Periode 2
Cijfers_T2 <- rnorm(120,
                    6.3,
                    1)

# Cijfers Praktijk Periode 2
Cijfers_P2 <- rnorm(120,
                    7.3,
                    1)

# Cijfers Theorie Periode 3
Cijfers_T3 <- rnorm(120,
                    7.4,
                    1)

# Cijfers Praktijk Periode 3
Cijfers_P3 <- rnorm(120,
                    7.4,
                    1)

# Cijfers Theorie Periode 4
Cijfers_T4 <- rnorm(120,
                    7.5,
                    1)

# Cijfers Praktijk Periode 4
Cijfers_P4 <- rnorm(120,
                    7.5,
                    1)

# Bind alle cijfervariabelen aan elkaar
Cijfers <- c(Cijfers_T1,
                                                   Cijfers_P1,
                                                   Cijfers_T2,
                                                   Cijfers_P2,
                                                   Cijfers_T3,
                                                   Cijfers_P3,
                                                   Cijfers_T4,
                                                   Cijfers_P4)
Cijfers[Cijfers > 10] <- 10

# Maak een variabele die aangeeft of het een theorie of praktijk vak is
Vaksoort <- rep(c(rep("Theorie",
                      120),
                  rep("Praktijk",
                      120)),
                4)

# Maak een variabele die de onderwijsperiode aangeeft
Periode <- c(rep(1,
                 240),
             rep(2,
                 240),
             rep(3,
                 240),
             rep(4,
                 240))

Periode <- as.factor(Periode)

# Bind alles in een dataset
Resultaten_Leisure_Management <- cbind.data.frame(Studentnummer,
                                                  Periode,
                                                  Vaksoort,
                                                  Cijfers)



#library(ez)
#ezANOVA(Resultaten_Leisure_Management, 
#        dv = Cijfers, 
#        wid = Studentnummer,
#        within = list(Vaksoort, Periode))

rm(Cijfers,
   Vaksoort,
   Periode,
   Studentnummer,
   Cijfers_T1,
   Cijfers_T2,
   Cijfers_T3,
   Cijfers_T4,
   Cijfers_P1,
   Cijfers_P2,
   Cijfers_P3,
   Cijfers_P4)

################################################################################

# geen interactie-effect

# seed
set.seed(12345)

# Maak studentnummers
Studentnummer <- sample(4000000:4500000, 
                        120)
Studentnummer <- as.factor(Studentnummer)
Studentnummer <- rep(Studentnummer,
                     8)
# Cijfers Theorie Periode 1
Cijfers_T1 <- rnorm(120,
                    6.4,
                    1)

# Cijfers Praktijk Periode 1
Cijfers_P1 <- rnorm(120,
                    7.2,
                    1)

# Cijfers Theorie Periode 2
Cijfers_T2 <- rnorm(120,
                    6.3,
                    1)

# Cijfers Praktijk Periode 2
Cijfers_P2 <- rnorm(120,
                    7.1,
                    1)

# Cijfers Theorie Periode 3
Cijfers_T3 <- rnorm(120,
                    6.8,
                    1)

# Cijfers Praktijk Periode 3
Cijfers_P3 <- rnorm(120,
                    7.6,
                    1)

# Cijfers Theorie Periode 4
Cijfers_T4 <- rnorm(120,
                    7.2,
                    1)

# Cijfers Praktijk Periode 4
Cijfers_P4 <- rnorm(120,
                    8.0,
                    1)

# Bind alle cijfervariabelen aan elkaar
Cijfers <- c(Cijfers_T1,
                                                   Cijfers_P1,
                                                   Cijfers_T2,
                                                   Cijfers_P2,
                                                   Cijfers_T3,
                                                   Cijfers_P3,
                                                   Cijfers_T4,
                                                   Cijfers_P4)
Cijfers[Cijfers > 10] <- 10

# Maak een variabele die aangeeft of het een theorie of praktijk vak is
Vaksoort <- rep(c(rep("Theorie",
                      120),
                  rep("Praktijk",
                      120)),
                4)

# Maak een variabele die de onderwijsperiode aangeeft
Periode <- c(rep(1,
                 240),
             rep(2,
                 240),
             rep(3,
                 240),
             rep(4,
                 240))

Periode <- as.factor(Periode)

# Bind alles in een dataset
Hoofdeffecten_Resultaten_Leisure_Management <- cbind.data.frame(Studentnummer,
                                                  Periode,
                                                  Vaksoort,
                                                  Cijfers)

#library(ez)
#ezANOVA(Hoofdeffecten_Resultaten_Leisure_Management, 
#        dv = Cijfers, 
#        wid = Studentnummer,
#        within = list(Vaksoort, Periode))

rm(Cijfers,
   Vaksoort,
   Periode,
   Studentnummer,
   Cijfers_T1,
   Cijfers_T2,
   Cijfers_T3,
   Cijfers_T4,
   Cijfers_P1,
   Cijfers_P2,
   Cijfers_P3,
   Cijfers_P4)

## Sla de datasets op
write.csv(Resultaten_Leisure_Management,
          file = "05. Datasets/30_Resultaten_Leisure_Management.csv")

write.csv(Hoofdeffecten_Resultaten_Leisure_Management,
          file = "05. Datasets/30_Hoofdeffecten_Resultaten_Leisure_Management.csv")


#vvv <- aov(Gemiddeld_cijfer ~ Geslacht + Vooropleiding + Geslacht:Vooropleiding,
#    data = Gemiddelde_cijfers_psychologie)
#mod <- "Gemiddeld_cijfer ~ Geslacht + Vooropleiding + Geslacht:Vooropleiding"

#summary(vvv)
#vvv$terms
#library(effects)
#allEffects(vvv)


#by(Gemiddelde_cijfers_psychologie$Gemiddeld_cijfer,
#   list(Gemiddelde_cijfers_psychologie$Geslacht,
#        Gemiddelde_cijfers_psychologie$Vooropleiding),
#   summary)


#install.packages("summarytools")
#library(summarytools)

#with(Gemiddelde_cijfers_psychologie, stby(data = Gemiddeld_cijfer,
#   list(Geslacht,
#        Vooropleiding),
#   descr,
#   stats = c("mean","sd","med","n.valid")))