## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 10.R ####
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

set.seed(8, 
         kind = "Mersenne-Twister", 
         normal.kind = "Inversion",
         sample.kind = "Rejection")
# 3
## 300 waarnemingen voor Vooropleiding
Seed <- sample(c(1, 2, 3, 4), 300, replace = TRUE)
Vooropleiding <-  ifelse(Seed == 1, "Rechtsgeleerdheid", 
                         ifelse(Seed == 2, "Notarieel Recht",
                                ifelse(Seed == 3, "Fiscaal Recht",
                                       ifelse(Seed == 4, "Premaster",
                                              NA))))

## 300 waarnemingen voor puntenaantallen, random gesampled uit een lijst mogelijkheden
Punten_mogelijkheden <- c(6, 12, 18, 24, 30, 36, 36, 42, 42, 42, 48, 48, 48, 48, 54, 54, 54, 60, 60, 60, 60, 60, 60)
EC_Jaar1 <- sample(Punten_mogelijkheden, 300, replace = TRUE)

Studentnummer <- sample(3000000:4000000, 300)
Resultaten_Arbeidsrecht <- data.frame(Studentnummer, Vooropleiding, EC_Jaar1)

## puntencorrectie om Fiscaal en Notarieel +6 punten te geven en Rechtsgeleerdheid -6 punten
Resultaten_Arbeidsrecht$EC_Jaar1[Vooropleiding == "Fiscaal Recht" | Vooropleiding == "Notarieel Recht"] <-
  Resultaten_Arbeidsrecht$EC_Jaar1[Vooropleiding == "Fiscaal Recht" | Vooropleiding == "Notarieel Recht"] + 6
Resultaten_Arbeidsrecht$EC_Jaar1[Vooropleiding == "Rechtsgeleerdheid"] <-
  Resultaten_Arbeidsrecht$EC_Jaar1[Vooropleiding == "Rechtsgeleerdheid"] - 6

# Verwijder niet benodigde objecten
rm(
Seed, 
Vooropleiding, 
Punten_mogelijkheden, 
EC_Jaar1, 
Studentnummer
)