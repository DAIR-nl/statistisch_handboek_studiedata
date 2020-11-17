## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 47.R  ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R code voor Student Analytics Vrije Universiteit Amsterdam
## Copyright 2020 VU
## Web Page: http://www.vu.nl
## Contact: Theo Bakker (t.c.bakker@vu.nl)
## Verspreiding buiten de VU: Nee
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
## 11-11-2020: EG: Aanmaak bestand
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# https://stats.stackexchange.com/questions/103728/simulating-multinomial-logit-data-with-r
# http://www.fedoa.unina.it/9889/1/Thesis.pdf

set.seed(12345)

# Maak studentnummer
Studentnummer <- sample(300000:400000,
                            250)

# Studiepunten
Studiepunten <- sample(c(25,30,35,40,45,50,55,60),
                   250,
                   replace = TRUE,
                   prob = c(0.05,0.05,0.1,0.1,0.1,0.25,0.25,0.1
                            )
                   )

# Geslacht
Geslacht <- c(rep("Vrouw", 
                  150),
              rep("Man", 
                  100))[sample.int(250,250)]
Geslacht_dummy <- rep(0,
                      250)
Geslacht_dummy[Geslacht == "Man"] <- 1


# Eindexamencijfer wiskunde middelbare school
Gemiddeld_cijfer <- round(rnorm(250,7,1),1)
Gemiddeld_cijfer[Gemiddeld_cijfer < 5.0] <- 5.0
Gemiddeld_cijfer[Gemiddeld_cijfer > 10.0] <- 10.0

Logit_Uitval <- exp(11  - 0.1 * Studiepunten + 0.05 * Geslacht_dummy + -1.2 * Gemiddeld_cijfer) 
Logit_Nominaal <- exp(-14  + 0.1 * Studiepunten + -0.05 * Geslacht_dummy + 1.2 * Gemiddeld_cijfer) 
#Logit_Niet_nominaal <- 17  - 1.4 * Studiepunten + -0.5 * Geslacht_dummy + 1.2 * Gemiddeld_cijfer 

p_Uitval <- Logit_Uitval / (1 + Logit_Uitval + Logit_Nominaal)
p_Nominaal <- Logit_Nominaal / (1 + Logit_Uitval + Logit_Nominaal)
p_Niet_nominaal <- 1 / (1 + Logit_Uitval + Logit_Nominaal)

mChoices = t(apply(cbind(p_Uitval, 
                         p_Nominaal, 
                         p_Niet_nominaal), 
                   1, 
                   rmultinom, 
                   n = 1, 
                   size = 1))

colSums(mChoices)

Uitstroom <- rep(NA,250)
Uitstroom[mChoices[,1] == 1] <- "Uitval"
Uitstroom[mChoices[,2] == 1] <- "Nominaal"
Uitstroom[mChoices[,3] == 1] <- "Niet-nominaal"

Fysiotherapie_Uitstroom <- cbind.data.frame(Uitstroom, 
                            Studentnummer,
                            Gemiddeld_cijfer,
                            Geslacht_dummy,
                            Geslacht,
                            Studiepunten
                            )



#dfM$y2 <- as.factor(as.character(dfM$y))
#Fysiotherapie_Uitstroom$idcase <- 1:nrow(Fysiotherapie_Uitstroom)

#library(mlogit)

#Dataset2 <- dfidx(Fysiotherapie_Uitstroom, shape = "wide", choice = "Uitstroom")
#Dataset2 <- dfidx(Fysiotherapie_Uitstroom, shape = "wide", idx = c("Studentnummer","Uitstroom"))

#bbb <- mlogit(Uitstroom ~  1 |  1 + Studiepunten + Geslacht_dummy + Gemiddeld_cijfer,
#       Dataset2)

#summary(bbb)

rm(mChoices,
   Gemiddeld_cijfer,
   Geslacht,
   Geslacht_dummy,
   Logit_Nominaal,
   Logit_Uitval,
   p_Niet_nominaal,
   p_Nominaal,
   p_Uitval,
   Studentnummer,
   Studiepunten,
   Uitstroom)
