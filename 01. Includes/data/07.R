
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 07.R ####
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

set.seed(1)

## Maak inkomens T1 aan
Alumni_inkomens_T1 <- c(
  replicate(0, 38),
  sample(19620:24000, 20),
  sample(24000:26400, 70),
  sample(26400:31200, 160),
  sample(31200:43200, 40),
  sample(43200:60000, 10),
  sample(60000:180000, 3)
)
Alumni_inkomens_T1 <- unlist(Alumni_inkomens_T1)
Alumni_inkomens_T1 <- sort(Alumni_inkomens_T1)

## Maak inkomens T2 op basis van opslag over T1

# Simuleer scheve verdeling toename salaris en haal 0.05 eraf om ook dalingen in
# salaris mee te nemen
Beta_verdeling <- rbeta(303,2,7) - 0.05
#hist(Beta_verdeling, breaks=40)
#sort(Beta_verdeling)

Opslag <- round(Beta_verdeling * 5000)
Alumni_inkomens_T2 <- Alumni_inkomens_T1 + Opslag

## Stel volgorde vast en hussel paargewijs
volgorde <- sample(1:length(Alumni_inkomens_T1), length(Alumni_inkomens_T1))
Alumni_inkomens_T1 <- Alumni_inkomens_T1[volgorde]
Alumni_inkomens_T2 <- Alumni_inkomens_T2[volgorde]

## link studentnummer aan vastgestelde volgorde en maak dataframe
Studentnummer <- sample(3000000:4000000, length(Alumni_inkomens_T1))
Studentnummer <- c(Studentnummer,Studentnummer)
Inkomen<- c(Alumni_inkomens_T1, Alumni_inkomens_T2)
Meetmoment <- c(replicate(length(Alumni_inkomens_T1), "T1"), (replicate(length(Alumni_inkomens_T2), "T2")))
Alumni_jaarinkomens <- data.frame(Studentnummer, Meetmoment, Inkomen)

# Verwijder alles behalve dataset

rm(Alumni_inkomens_T1, Alumni_inkomens_T2, Inkomen, Meetmoment, Beta_verdeling, Opslag, 
        Studentnummer, volgorde)

