
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 02.R ####
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

set.seed(2)

# OUD
## stel parameters data vast
#MUt0 <- 29
#MUt1 <- 29.2
#SD <- 9

# parameters verschil groepen
MU_verschil <- 3.5
SD_verschil <- 2.5

# genereer verschillen met normale verdeling
Uren_studeren_verschillen <- rnorm(134,MU_verschil,SD_verschil)

## maak uren studeren aan op basis van een normale verdeling
Uren_studeren_t0 <- runif(134, 8, 20)
Uren_studeren_t1 <- Uren_studeren_t0 + Uren_studeren_verschillen

## Rond uren studeren af naar 1 decimaal
Uren_studeren_t0 <- sapply(Uren_studeren_t0, round, 1)
Uren_studeren_t1 <- sapply(Uren_studeren_t1, round, 1)
Uren_studeren <- c(Uren_studeren_t0, Uren_studeren_t1)

# OUD
## stel volgorde vast en rangschik op grootte, voeg daarna samen
#volgorde <- order(Uren_studeren_t0)
#Uren_studeren_t0 <- sort(Uren_studeren_t0)
#Uren_studeren_t1 <- sort(Uren_studeren_t1)
#Uren_studeren_t0 <- Uren_studeren_t0[volgorde]
#Uren_studeren_t1 <- Uren_studeren_t1[volgorde]
#Uren_studeren <- c(Uren_studeren_t0, Uren_studeren_t1)

## Maak studentnummer aan en verdubbel
Studentnummer <-sample(300000:400000, (length(Uren_studeren_t0)))
Studentnummer <- c(Studentnummer, Studentnummer)

## Maak meetmoment aan en voeg samen als factor
Meetmoment_t0 <- replicate(length(Uren_studeren_t0), "T0")
Meetmoment_t1 <- replicate(length(Uren_studeren_t1), "T1")
Meetmoment <- as.factor(c(Meetmoment_t0, Meetmoment_t1))

## Voeg samen in data.frame
Studielogboek <- data.frame(Studentnummer, Uren_studeren, Meetmoment)

## MAAK N30 SAMPLE, let op klopt niet helemaal
indices <- sample.int(nrow(Studielogboek)/2,30)
Uren_studeren_verschil_n30 <- Studielogboek$Uren_studeren[indices + nrow(Studielogboek)/2] - Studielogboek$Uren_studeren[indices]

# Verwijder alles behalve dataset
rm(MU_verschil, SD_verschil, Uren_studeren_verschillen, Uren_studeren_t0,
   Uren_studeren_t1, Uren_studeren, Studentnummer, Meetmoment_t0, Meetmoment_t1,
   Meetmoment, indices)