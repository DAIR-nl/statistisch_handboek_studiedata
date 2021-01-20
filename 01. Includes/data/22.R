## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 22.R ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R code voor Student Analytics Vrije Universiteit Amsterdam
## Copyright 2020 VU
## Web Page: http://www.vu.nl
## Contact: Theo Bakker (t.c.bakker@vu.nl)
## Verspreiding buiten de VU: Ja
##
## Doel: Data genereren voor script 22 Wilcoxon signed rank toets II R.Rmd
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
## 12-06-2020: EG: Aanmaak bestand
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# De hoofddocent van het vak ‘Speech schrijven’ van de bachelor Politicologie is 
# benieuwd naar de effectiviteit van zijn eigen vak. Daarom laat hij studenten 
# bij de eerste bijeenkomst van het vak een speech schrijven die zij beoordeeld 
# als onvoldoende, voldoende, goed of uitstekend. Gedurende het vak leren 
# studenten het schrijven van speeches vanuit verschillende perspectieven. Aan 
# het einde van het vak schrijven studenten wederom een speech die op dezelfde 
# wijze door de hoofddocent beoordeeld wordt. Op deze manier kan hij onderzoeken 
# of zijn lessen ervoor zorgen dat studenten beter worden in het schrijven van 
# speeches.

# set seed
set.seed(12345, 
         kind = "Mersenne-Twister", 
         normal.kind = "Inversion",
         sample.kind = "Rejection")

## Maak 80 studentnummers
Studentnummer <- sample(3000000:4000000, 80)
Studentnummer <- c(Studentnummer,Studentnummer)

## Maak variabele voor meetmoment
Meetmoment <- c(rep("Begin", 80), rep("Eind", 80))

## Maak beoordelingen van studenten
# Eerst numeriek van 1 tot 4
Beoordeling_begin <- c(rep(1, 12), rep(2, 35), rep(3, 25), rep(4, 8))
Beoordeling_begin <- Beoordeling_begin[sample.int(80, 80)]
Beoordeling_verschil <- c(rep(-1, 6), rep(0, 20), rep(1, 40), rep(2, 14))
Beoordeling_verschil <- Beoordeling_verschil[sample.int(80, 80)]

# Bereken eindscores
Beoordeling_eind <- Beoordeling_begin + Beoordeling_verschil
# Verander 0 in 1 en groter dan 4 in 4
Beoordeling_eind[Beoordeling_eind == 0] <- 1
Beoordeling_eind[Beoordeling_eind > 4] <- 4

# Check verdeling
#table(Beoordeling_eind)
#table(Beoordeling_begin)

# Bind begin en eind in een variabele
Beoordeling <- c(Beoordeling_begin, Beoordeling_eind)

# Verander variabele in factor met levels onvoldoende, voldoende, goed en 
# uitstekend
Beoordeling[Beoordeling == 1] <- "Onvoldoende"
Beoordeling[Beoordeling == 2] <- "Voldoende"
Beoordeling[Beoordeling == 3] <- "Goed"
Beoordeling[Beoordeling == 4] <- "Uitstekend"
Beoordeling <- as.character(Beoordeling)

# Maak dataset
Beoordelingen_speech_schrijven <- data.frame(Studentnummer,
                                             Meetmoment,
                                             Beoordeling,
                                             stringsAsFactors=FALSE)


rm(Beoordeling, 
   Beoordeling_begin,    
   Beoordeling_eind,    
   Beoordeling_verschil, 
   Meetmoment,
   Studentnummer)
