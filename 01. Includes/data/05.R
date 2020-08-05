
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 05.R ####
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
## Het hoofd communicatie wil in verband met wervingsactiviteiten weten wat de reistijd is van studenten aan verschillende opleidingen.

## Doel: tidy data met een kolom reistijd (value) en een kolom opleiding (factor)
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

Studentnummers_opties <- c(4000000:4500000)
Studentnummer <- sample(Studentnummers_opties, 257)
Studentnummer <- as.factor(Studentnummer)

Reistijd_per_opleiding <- data.frame(Studentnummer, Opleiding, Reistijd)
colnames(Reistijd_per_opleiding) <- c("Studentnummer","Opleiding", "Reistijd")

Reistijd_per_opleiding$Reistijd[Reistijd_per_opleiding$Reistijd < 0] <- Reistijd_per_opleiding$Reistijd * -1

rm(namenlijst_atc, namenlijst_fil, namenlijst_gsc, Opleiding, Reistijd,
   Reistijd_ATC, Reistijd_FIL, Reistijd_GSC, reistijd_gem, sd_gem,
   Studentnummer, Studentnummers_opties, Studiegrootte)