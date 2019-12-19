## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R Data naar SPSS.R
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R code voor Student Analytics Vrije Universiteit Amsterdam
## Copyright `r format(Sys.time(), "%Y")` VU
## Web Page: http://www.vu.nl
## Contact: Theo Bakker (t.c.bakker@vu.nl)
## Project: Versnellingsagenda - Statistisch Handboek HO
##
## Doel: Voor het statistisch handboek moet de aangemaakte dummy data omgezet worden naar een .sav
## bestand
##
## Afhankelijkheden: 
##
## Datasets: 
##
## Opmerkingen: 
## 1) Geen
##
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Geschiedenis:
## 3-12-2019: JD: Aanmaak bestand
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Gebruik het package haven
library(haven)

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## TOETS 1: ONE SAMPLE T-TOETS
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 

## Maak dummydata aan
RNGkind(sample.kind = "Rounding")
set.seed(1)

Decimalen_wiskunde <- rnorm(160, 7.1, 2.6)
Wiskunde_eindcijfer <- round(Decimalen_wiskunde, 1)[Decimalen_wiskunde <= 10 & Decimalen_wiskunde >= 4.5]

Decimalen_scheikunde <- rnorm(160, 6.8, 2.2)
Scheikunde_eindcijfer <- round(Decimalen_scheikunde, 1)[Decimalen_scheikunde <= 10 & Decimalen_scheikunde >= 4.5]

Decimalen_natuurkunde <- rnorm(160, 7.0, 2.4)
Natuurkunde_eindcijfer <- round(Decimalen_natuurkunde, 1)[Decimalen_natuurkunde <= 10 & Decimalen_natuurkunde >= 4.5]

WNS_eindcijfers <- cbind(Wiskunde_eindcijfer, Scheikunde_eindcijfer, Natuurkunde_eindcijfer)

Gemiddeld_cijfer_WNS <- apply(WNS_eindcijfers, 1, mean)

Gemiddeld_cijfer_WNS_n30 <- sample(Gemiddeld_cijfer_WNS, 30)

## Sla dataframes op als .sav
write_sav(as.data.frame(Gemiddeld_cijfer_WNS), 
          "SPSS/Data/Gemiddeld_cijfer_WNS.sav")
write_sav(as.data.frame(Gemiddeld_cijfer_WNS_n30), 
          "SPSS/Data/Gemiddeld_cijfer_WNS_n30.sav")

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## TOETS 2: GEPAARDE T-TOETS
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 

## Maak dummydata aan
RNGkind(sample.kind = "Rounding")
set.seed(2)
library(dplyr)

## Maak ruwe data aan op meerdere decimalen
mu <- 7.2
sigma <- 1.5
Tentamencijfer_na_tutorgesprek <- rnorm(250, mu, sigma)

Tentamencijfer_na_tutorgesprek <- 
  Tentamencijfer_na_tutorgesprek[Tentamencijfer_na_tutorgesprek <= 10
                                 & Tentamencijfer_na_tutorgesprek >= 1]

mu <- 6.8
sigma <- 1.8
Tentamencijfer_voor_tutorgesprek <- rnorm(260, mu, sigma)

Tentamencijfer_voor_tutorgesprek <- 
  Tentamencijfer_voor_tutorgesprek[Tentamencijfer_voor_tutorgesprek <= 10
                                   & Tentamencijfer_voor_tutorgesprek >= 1]  ##dit maakt de steekproef met hogere mu langer (n) dan de (n van) steekproef met lage mu

## Rond evaluatiecijfers af op 3 decimalen
Tentamencijfer_na_tutorgesprek <- sapply(Tentamencijfer_na_tutorgesprek, round, 3)
Tentamencijfer_voor_tutorgesprek <- sapply(Tentamencijfer_voor_tutorgesprek, round, 3)

## Stel volgorde en lengte van steekproef vast
volgorde <- sample(1:length(Tentamencijfer_na_tutorgesprek), length(Tentamencijfer_na_tutorgesprek))
volgorde_n30 <- sample(1:30, 30)
Verschil_grootte <- length(Tentamencijfer_voor_tutorgesprek) - length(Tentamencijfer_na_tutorgesprek)

## Definieer steekproeven in lengte en volgorde met gehusselde paren
Tentamencijfer_na_tutorgesprek <- sort(Tentamencijfer_na_tutorgesprek)
Tentamencijfer_na_tutorgesprek <- Tentamencijfer_na_tutorgesprek[volgorde]
Tentamencijfer_voor_tutorgesprek <- sort(Tentamencijfer_voor_tutorgesprek)
Tentamencijfer_voor_tutorgesprek <- 
  Tentamencijfer_voor_tutorgesprek[sample(-283:-1, Verschil_grootte)] ##verwijder aantal verschil n op random index
Tentamencijfer_voor_tutorgesprek <- Tentamencijfer_voor_tutorgesprek[volgorde] 

## Definieer groeperingsvecto en studentnr
Voor_of_na_tutorgesprek <- c(
  replicate(length(Tentamencijfer_voor_tutorgesprek), "voor"), 
  replicate(length(Tentamencijfer_na_tutorgesprek), "na"))
studentnr <-sample(300000:400000, (length(Tentamencijfer_voor_tutorgesprek)))
studentnr <- c(studentnr, studentnr)

## Voeg cijfers samen en in data.frame
Cijfer <- c(Tentamencijfer_voor_tutorgesprek, Tentamencijfer_na_tutorgesprek)
Tentamencijfers <- data.frame(studentnr, Cijfer, Voor_of_na_tutorgesprek)
Tentamencijfers <- Tentamencijfers[order(Tentamencijfers$studentnr),]

## verander de de vector in een factor
Tentamencijfers <- 
  mutate(Tentamencijfers, 
         Voor_of_na_tutorgesprek =
           factor(Voor_of_na_tutorgesprek, levels = c("voor", "na")))


## maak korte (n=30) datasets
mu <- 7.2
sigma <- 1.2
Tentamencijfer_voor_tutorgesprek_n30 <- rnorm(30, mu, sigma)

Tentamencijfer_voor_tutorgesprek_n30 <- Tentamencijfer_voor_tutorgesprek_n30[Tentamencijfer_voor_tutorgesprek_n30 <= 10 
                                                                             & Tentamencijfer_voor_tutorgesprek_n30 >= 1]
Tentamencijfer_voor_tutorgesprek_n30 <- sapply(Tentamencijfer_voor_tutorgesprek_n30, round, 3)
Tentamencijfer_voor_tutorgesprek_n30 <- sort(Tentamencijfer_voor_tutorgesprek_n30)
Tentamencijfer_voor_tutorgesprek_n30 <- Tentamencijfer_voor_tutorgesprek_n30[volgorde_n30]

mu <- 7.0
sigma <- 0.8
Tentamencijfer_na_tutorgesprek_n30 <- rnorm(30, mu, sigma)

Tentamencijfer_na_tutorgesprek_n30 <-
  Tentamencijfer_na_tutorgesprek_n30[Tentamencijfer_na_tutorgesprek_n30 <= 10 &
                                       Tentamencijfer_na_tutorgesprek_n30 >= 1]
Tentamencijfer_na_tutorgesprek_n30 <- sapply(Tentamencijfer_na_tutorgesprek_n30, round, 3)
Tentamencijfer_na_tutorgesprek_n30 <- sort(Tentamencijfer_na_tutorgesprek_n30)
Tentamencijfer_na_tutorgesprek_n30 <- Tentamencijfer_na_tutorgesprek_n30[volgorde_n30]

## Sla dataframes op als .sav
write_sav(Tentamencijfers, 
          "SPSS/Data/Tentamencijfers.sav")
write_sav(as.data.frame(Tentamencijfer_voor_tutorgesprek_n30), 
          "SPSS/Data/Tentamencijfer_voor_tutorgesprek_n30.sav")
write_sav(as.data.frame(Tentamencijfer_na_tutorgesprek_n30), 
          "SPSS/Data/Tentamencijfer_na_tutorgesprek_n30.sav")

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## TOETS 3: ONGEPAARDE T-TOETS
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 

## Maak dummydata aan
RNGkind(sample.kind = "Rounding")
set.seed(1)

mu <- 6.3
sigma <- 1.2
Cijfers_2010 <- rnorm(180, mu, sigma)
Cijfers_2010 <- Cijfers_2010[Cijfers_2010 <= 10 & Cijfers_2010 >= 1]
Cijfers_2010 <- sapply(Cijfers_2010, round, 3)

mu <- 6.3
sigma <- 1.2
Cijfers_2010_n30 <- rnorm(30, mu, sigma)
Cijfers_2010_n30 <- Cijfers_2010_n30[Cijfers_2010_n30 <= 10 & Cijfers_2010_n30 >= 1]
Cijfers_2010_n30 <- sapply(Cijfers_2010_n30, round, 3)

mu <- 6.45
sigma <- 1.2
Cijfers_2011 <- rnorm(160, mu, sigma)
Cijfers_2011 <- Cijfers_2011[Cijfers_2011 <= 10 & Cijfers_2011 >= 1]
Cijfers_2011 <- sapply(Cijfers_2011, round, 3)

mu <- 6.45
sigma <- 1.2
Cijfers_2011_n30 <- rnorm(30, mu, sigma)
Cijfers_2011_n30 <- Cijfers_2011_n30[Cijfers_2011_n30 <= 10 & Cijfers_2011_n30 >= 1]
Cijfers_2011_n30 <- sapply(Cijfers_2011, round, 3)

Cijfers <- c(Cijfers_2010, Cijfers_2011)
Cohort <- c(replicate(180, 2010), replicate(160, 2011))
Cijfers_gem <- data.frame(Cijfers, Cohort)

## Sla dataframes op als .sav
write_sav(Cijfers_gem, 
          "SPSS/Data/Cijfers_gem.sav")
write_sav(as.data.frame(Cijfers_2010_n30), 
          "SPSS/Data/Cijfers_2010_n30.sav")
write_sav(as.data.frame(Cijfers_2011_n30), 
          "SPSS/Data/Cijfers_2011_n30.sav")

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## TOETS 5: ONE WAY ANOVA
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 

## Maak dummydata aan
library(dplyr)
RNGkind(sample.kind = "Rounding")
set.seed(3)

Studiegrootte <- 29
reistijd_gem <- 35
sd_gem <- 12
Reistijd_FIL <- round(rnorm(2.1*Studiegrootte, reistijd_gem, sd_gem), 2)
namenlijst_fil <- replicate(2.1*Studiegrootte, "Filosofie")

Studiegrootte <- 23
reistijd_gem <- 45
sd_gem <- 13
Reistijd_ATC <- round(rnorm(2.1*Studiegrootte, reistijd_gem, sd_gem), 2)
namenlijst_atc <- replicate(2.1*Studiegrootte, "Arabische Taal en Cultuur")

Studiegrootte <- 71
reistijd_gem <- 36
sd_gem <- 11
Reistijd_GSC <- round(rnorm(2.1*Studiegrootte, reistijd_gem, sd_gem), 2)
namenlijst_gsc <- replicate(2.1*Studiegrootte, "Geschiedenis")

Reistijd <- c(Reistijd_ATC, Reistijd_GSC, Reistijd_FIL)
Opleiding <- c(namenlijst_atc, namenlijst_gsc, namenlijst_fil)

Opleiding <- Opleiding[order(Reistijd)]
Reistijd <- sort(Reistijd)

Reistijd_per_opleiding <- data.frame(Reistijd, Opleiding)
colnames(Reistijd_per_opleiding) <- c("Reistijd", "Opleiding")


Reistijd_per_opleiding <- Reistijd_per_opleiding %>%
  mutate(Reistijd = if_else(Reistijd < 0, Reistijd*-1, Reistijd))

write_sav(Reistijd_per_opleiding, 
          "SPSS/Data/Reistijd_per_opleiding.sav")

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## TOETS 10: KRUSKAL-WALLIS TOETS
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 

## Maak dummydata aan
RNGkind(sample.kind = "Rounding")
set.seed(8)
# 3
## 300 waarnemingen voor Vooropleiding
Seed <- sample(c(1, 2, 3, 4), 300, replace = TRUE)
Vooropleiding <-  ifelse(Seed == 1, "Rechtsgeleerdheid", 
                         ifelse(Seed == 2, "Notarieel recht",
                                ifelse(Seed == 3, "Fiscaal recht",
                                       ifelse(Seed == 4, "Schakelprogramma",
                                              NA))))

## 300 waarnemingen voor puntenaantallen, random gesampled uit een lijst mogelijkheden
Punten_mogelijkheden <- c(6, 12, 18, 24, 30, 36, 36, 42, 42, 42, 48, 48, 48, 48, 54, 54, 54, 60, 60, 60, 60, 60, 60)
Ec_jaar1 <- sample(Punten_mogelijkheden, 300, replace = TRUE)

Studentnr <- sample(3000000:4000000, 300)
Resultaten_arbeidsrecht <- data.frame(Studentnr, Vooropleiding, Ec_jaar1)

## puntencorrectie om Fiscaal en Notarieel +6 punten te geven en Rechtsgeleerdheid -6 punten
Resultaten_arbeidsrecht$Ec_jaar1[Vooropleiding == "Fiscaal recht" | Vooropleiding == "Notarieel recht"] <-
  Resultaten_arbeidsrecht$Ec_jaar1[Vooropleiding == "Fiscaal recht" | Vooropleiding == "Notarieel recht"] + 6
Resultaten_arbeidsrecht$Ec_jaar1[Vooropleiding == "Rechtsgeleerdheid"] <-
  Resultaten_arbeidsrecht$Ec_jaar1[Vooropleiding == "Rechtsgeleerdheid"] - 6

## Sla dataframes op als .sav
write_sav(Resultaten_arbeidsrecht, 
          "SPSS/Data/Resultaten_arbeidsrecht.sav")


## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## TOETS 13: CHI-KWADRAAT TOETS
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 

## Maak dummydata aan
Geen_leenstelsel <- c(375, 496)
Wel_leenstelsel <- c(369, 394)
Uitval_functiebeperking <- t(data.frame(Geen_leenstelsel, Wel_leenstelsel))
colnames(Uitval_functiebeperking) <- c("Wel_uitval", "Geen_uitval")

Geen_leenstelsel_n43 <- c(8, 14)
Wel_leenstelsel_n43 <- c(5, 16)
Uitval_functiebeperking_n43 <- t(data.frame(Geen_leenstelsel_n43, Wel_leenstelsel_n43))
colnames(Uitval_functiebeperking_n43) <- c("Wel_uitval", "Geen_uitval")

## Sla dataframes op als .sav
write_sav(as.data.frame(Uitval_functiebeperking), 
          "SPSS/Data/Uitval_functiebeperking.sav")
write_sav(as.data.frame(Uitval_functiebeperking_n43), 
          "SPSS/Data/Uitval_functiebeperking_n43.sav")

