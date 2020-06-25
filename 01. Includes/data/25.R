## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 25.R ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R code voor Student Analytics Vrije Universiteit Amsterdam
## Copyright 2020 VU
## Web Page: http://www.vu.nl
## Contact: Theo Bakker (t.c.bakker@vu.nl)
## Verspreiding buiten de VU: Ja
##
## Doel: Data genereren voor script 25 Kruskal Wallis toets II R.Rmd
##
## Afhankelijkheden: Geen
##
## Datasets: Geen
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
## 25-06-2020: EG: Aanmaak bestand
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# Bij het interdisciplinaire vak ‘Presentatievaardigheden’ van de faculteit 
# Economie en Bedrijfswetenschappen leren studenten om een overtuigende 
# presentatie te geven over een product. Het vak wordt afgesloten met een 
# individuele presentatie die beoordeeld wordt als onvoldoende, voldoende, goed 
# of uitstekend. Het vak wordt gevolgd door studenten van de masters Economics, 
# Finance, Entrepeneurship en Marketing. De hoofddocent wil graag onderzoeken of 
# er verschillen zijn tussen de beoordelingen van studenten van deze vier 
# masters. Wanneer er verschillen zijn, kan hij in gesprek gaan met studenten 
# van een master die minder goed scoort om te onderzoeken wat de oorzaak hiervan 
# zou kunnen zijn.

# set seed
set.seed(12345)

## Maak 120 studentnummers
Studentnummer <- sample(3000000:4000000, 120)
Studentnummer <- c(Studentnummer,Studentnummer)

## Maak variabele voor opleiding
Opleiding <- c(rep("Economics", 20),
               rep("Finance", 25),
               rep("Entrepeneurship", 40),
               rep("Marketing", 35))

## Maak beoordelingen

# Per opleiding
Beoordeling_Economics <- c(rep(1, 2), rep(2, 10), rep(3, 6), rep(4, 2))
Beoordeling_Finance <- c(rep(1, 4), rep(2, 15), rep(3, 2), rep(4, 4))
Beoordeling_Entrepeneurship <- c(rep(1, 3), rep(2, 10), rep(3, 15), rep(4, 12))
Beoordeling_Marketing <- c(rep(1, 2), rep(2, 8), rep(3, 10), rep(4, 15))

# Bind ze aan elkaar
Beoordeling <- c(Beoordeling_Economics,
                 Beoordeling_Finance,
                 Beoordeling_Entrepeneurship,
                 Beoordeling_Marketing)

# Verander variabele in factor met levels onvoldoende, voldoende, goed en 
# uitstekend
Beoordeling[Beoordeling == 1] <- "Onvoldoende"
Beoordeling[Beoordeling == 2] <- "Voldoende"
Beoordeling[Beoordeling == 3] <- "Goed"
Beoordeling[Beoordeling == 4] <- "Uitstekend"
Beoordeling <- as.character(Beoordeling)



# Maak dataset
Beoordelingen_presentatievaardigheden <- data.frame(Studentnummer,
                                             Opleiding,
                                             Beoordeling,
                                             stringsAsFactors = FALSE)

# Hussel dataset door elkaar
Beoordelingen_presentatievaardigheden <- Beoordelingen_presentatievaardigheden[sample.int(120, 120),]


rm(Beoordeling, 
   Beoordeling_Economics,    
   Beoordeling_Entrepeneurship,    
   Beoordeling_Finance,
   Beoordeling_Marketing,
   Opleiding,
   Studentnummer)

