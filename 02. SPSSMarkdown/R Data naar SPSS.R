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

## Maak van in te lezen data een dataframe
Gemiddeld_cijfer_WNS <- as.data.frame(Gemiddeld_cijfer_WNS)
Gemiddeld_cijfer_WNS_n30 <- as.data.frame(Gemiddeld_cijfer_WNS_n30)

## Sla dataframes op als .sav
write_sav(Gemiddeld_cijfer_WNS, 
          "02. SPSSMarkdown/Data/Gemiddeld_cijfer_WNS.sav")
write_sav(Gemiddeld_cijfer_WNS_n30, 
          "02. SPSSMarkdown/Data/Gemiddeld_cijfer_WNS_n30.sav")

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## TOETS 2: GEPAARDE T-TOETS
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 

## Maak dummydata aan
RNGkind(sample.kind = "Rounding")
set.seed(2)
library(dplyr)

## Maak ruwe data aan
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
                                   & Tentamencijfer_voor_tutorgesprek >= 1]

## Stel volgorde en lengte van steekproef vast
volgorde <- sample(1:length(Tentamencijfer_na_tutorgesprek), length(Tentamencijfer_na_tutorgesprek))
volgorde_n30 <- sample(1:30, 30)
Verschil_grootte <- length(Tentamencijfer_voor_tutorgesprek) - length(Tentamencijfer_na_tutorgesprek)

## Rond evaluatiecijfers af
Tentamencijfer_na_tutorgesprek <- sapply(Tentamencijfer_na_tutorgesprek, round, 3)
Tentamencijfer_voor_tutorgesprek <- sapply(Tentamencijfer_voor_tutorgesprek, round, 3)

## Definiëer lengte in steekproef en hussel paren
Tentamencijfer_na_tutorgesprek <- sort(Tentamencijfer_na_tutorgesprek)
Tentamencijfer_na_tutorgesprek <- Tentamencijfer_na_tutorgesprek[volgorde]
Tentamencijfer_voor_tutorgesprek <- sort(Tentamencijfer_voor_tutorgesprek)
Tentamencijfer_voor_tutorgesprek <- Tentamencijfer_voor_tutorgesprek[sample(-283:-1, Verschil_grootte)]
Tentamencijfer_voor_tutorgesprek <- Tentamencijfer_voor_tutorgesprek[volgorde]

Voor_of_na_tutorgesprek <- c(
  replicate(length(Tentamencijfer_voor_tutorgesprek), "voor"), 
  replicate(length(Tentamencijfer_na_tutorgesprek), "na"))
studentnr <- c(replicate(2, sample(300000:400000, (length(Voor_of_na_tutorgesprek)/2))))
Cijfer <- c(Tentamencijfer_voor_tutorgesprek, Tentamencijfer_na_tutorgesprek)

Tentamencijfers <- data.frame(studentnr, Cijfer, Voor_of_na_tutorgesprek)

## Stel de volgorde van de factor vast
Tentamencijfers <- 
  mutate(Tentamencijfers, 
         Voor_of_na_tutorgesprek =
           factor(Voor_of_na_tutorgesprek, levels = c("voor", "na")))

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
          "02. SPSSMarkdown/Data/Tentamencijfers.sav")

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
          "02. SPSSMarkdown/Data/Cijfers_gem.sav")

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## TOETS 5: ONE WAY ANOVA
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
          "02. SPSSMarkdown/Data/Cijfers_gem.sav")





