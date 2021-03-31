## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 04.R ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R code voor Student Analytics Vrije Universiteit Amsterdam
## Copyright 2020 VU
## Web Page: http://www.vu.nl
## Contact: Theo Bakker (t.c.bakker@vu.nl)
## Verspreiding buiten de VU: Nee
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

# De opleidingsdirecteur van de bachelor Technische Natuurkunde hoort vanuit de 
# opleidingscommissie dat de eerstejaarsstudenten de studielast van de eerste 
# onderwijsperiode als erg hoog ervaren. Om te onderzoeken hoe deze ervaren 
# studielast verminderd kan worden, wil hij onderzoeken hoeveel tijd deze 
# studenten per week besteden aan hun vakken. Uit vakevaluaties verzamelt hij 
# gegevens van het aantal uur per week dat eerstejaars studenten besteden aan 
# de vakken in periode 1: lineaire algebra, relativiteitstheorie en kosmologie. 
# Op deze manier kan hij onderzoeken of er verschillen in de tijdsbesteding aan 
# de verschillende vakken zijn en om te bepalen van welke vakken de studielast 
# aangepast moeten worden.


# Dataset heeft drie kolommen: Studentnummer, Vak en Aantal uren per week. We
# nemen 80 eerstejaars studenten

# set seed
set.seed(12345, 
         kind = "Mersenne-Twister", 
         normal.kind = "Inversion",
         sample.kind = "Rejection")

# Simuleer studentnummers
Studentnummers_opties <- c(4000000:4500000)
Studentnummer_uniek <- sample(Studentnummers_opties, 80)
Studentnummer <- rep(Studentnummer_uniek, times = 3)
Studentnummer <- as.factor(Studentnummer)
# Maak vakken
Vak <- rep(c("Lineaire Algebra", "Relativiteitstheorie", "Kosmologie"), 
           each = 80)

# Simuleer aantal uur studeren per vak
Uren_Lineaire_Algebra <- round(rnorm(80, 10, 2), 1)
hist(Uren_Lineaire_Algebra)

Uren_Relativiteitstheorie <- round(rnorm(80, 20, 4), 1)
hist(Uren_Relativiteitstheorie)

Uren_Kosmologie <- round(rnorm(80, 11, 3), 1)
hist(Uren_Kosmologie)

Studieuren <- c(Uren_Lineaire_Algebra, Uren_Relativiteitstheorie, 
                Uren_Kosmologie)

# Maak dataset
Studieuren_technische_natuurkunde <- cbind.data.frame(Studentnummer, Vak, Studieuren)

# Sorteer data
Studieuren_technische_natuurkunde <- Studieuren_technische_natuurkunde[order(Studieuren_technische_natuurkunde$Studentnummer),]

rm(
  Studentnummers_opties, 
Studentnummer_uniek, 
Studentnummer, 
Vak, 
Uren_Lineaire_Algebra, 
Uren_Relativiteitstheorie, 
Uren_Kosmologie, 
Studieuren
)

## Sla de datasets op
#write.csv(Studieuren_technische_natuurkunde,
#          file = "05. Datasets/04_Studieuren_technische_natuurkunde.csv")
