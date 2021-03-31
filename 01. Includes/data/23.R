## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 23.R ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R code voor Student Analytics Vrije Universiteit Amsterdam
## Copyright 2020 VU
## Web Page: http://www.vu.nl
## Contact: Theo Bakker (t.c.bakker@vu.nl)
## Verspreiding buiten de VU: Nee
##
## Doel: Data genereren voor script 23 Mann Whitney U toets II R.Rmd
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
## 24-06-2020: EG: Aanmaak bestand
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# Bij de hbo lerarenopleiding Frans leren studenten bij het vak 
# Gesprekstechnieken om gesprekken te voeren in een praktijksetting. Aan het 
# einde van het vak worden zij beoordeeld op basis van een mentorgesprek met 
# een acteur waarin zij de aangeleerde vaardigheden in de praktijk kunnen 
# toepassen. In vakevaluaties wordt vaak door mannen aangegeven dat ze het vak 
# als erg moeilijk ervaren. Daarom wil de hoofddocent graag uitzoeken of er 
# verschillen zijn tussen manen en vrouwen wat betreft de beoordeling van de 
# gesprekstechnieken.

# set seed
set.seed(12345, 
         kind = "Mersenne-Twister", 
         normal.kind = "Inversion",
         sample.kind = "Rejection")

## Maak 80 studentnummers
Studentnummer <- sample(3000000:4000000, 80)

## Maak variabele voor geslacht
Geslacht <- c(rep("Man", 30), rep("Vrouw", 50))

## Maak beoordelingen van studenten
# Eerst numeriek van 1 tot 4
Beoordeling_man <- c(rep(1, 5), rep(2, 10), rep(3, 15))
Beoordeling_man <- Beoordeling_man[sample.int(30, 30)]
Beoordeling_vrouw <- c(rep(1, 5), rep(2, 17), rep(3, 28))
Beoordeling_vrouw <- Beoordeling_vrouw[sample.int(50, 50)]

# Bind begin en eind in een variabele
Beoordeling <- c(Beoordeling_man, Beoordeling_vrouw)

# Verander variabele in factor met levels onvoldoende, voldoende, goed en 
# uitstekend
Beoordeling[Beoordeling == 1] <- "Onvoldoende"
Beoordeling[Beoordeling == 2] <- "Voldoende"
Beoordeling[Beoordeling == 3] <- "Goed"
Beoordeling <- as.character(Beoordeling)

# Maak dataset
Beoordelingen_gesprekstechnieken <- data.frame(Studentnummer,
                                             Geslacht,
                                             Beoordeling,
                                             stringsAsFactors = FALSE)


rm(Beoordeling, 
   Beoordeling_man,    
   Beoordeling_vrouw,    
   Geslacht,
   Studentnummer)

## Sla de datasets op
#write.csv(Beoordelingen_gesprekstechnieken,
#          file = "05. Datasets/23_Beoordelingen_gesprekstechnieken.csv")

