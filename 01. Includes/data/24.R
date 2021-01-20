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
set.seed(12345, 
         kind = "Mersenne-Twister", 
         normal.kind = "Inversion",
         sample.kind = "Rejection")

## Maak 120 studentnummers
Studentnummer <- sample(3000000:4000000, 200)
Studentnummer <- rep(Studentnummer, 4)

## Maak variabele voor periode
Periode <- c(rep(1, 200),
             rep(2, 200),
             rep(3, 200),
             rep(4, 200))
Periode <- as.factor(Periode)

## Maak variabele voor aantal voldoendes

# Per opleiding
Voldoendes_Periode_1 <- c(rep(0,10),
                          rep(1,40),
                          rep(2,50),
                          rep(3,100))[sample.int(200)]
Voldoendes_Periode_2 <- c(rep(0,20),
                          rep(1,20),
                          rep(2,30),
                          rep(3,130))[sample.int(200)]
Voldoendes_Periode_3 <- c(rep(0,10),
                          rep(1,30),
                          rep(2,100),
                          rep(3,60))[sample.int(200)]
Voldoendes_Periode_4 <- c(rep(0,10),
                          rep(1,20),
                          rep(2,20),
                          rep(3,150))[sample.int(200)]

# Bind ze aan elkaar
Voldoendes <- c(Voldoendes_Periode_1,
                Voldoendes_Periode_2,
                Voldoendes_Periode_3,
                Voldoendes_Periode_4)


# Maak dataset
Voldoendes_Geschiedenis <- data.frame(Studentnummer,
                                      Periode,
                                      Voldoendes)

rm(Voldoendes,
   Voldoendes_Periode_1,
   Voldoendes_Periode_2,
   Voldoendes_Periode_3,
   Voldoendes_Periode_4,
   Periode,
   Studentnummer)

