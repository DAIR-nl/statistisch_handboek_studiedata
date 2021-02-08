## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 31.R  ####
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
## 18-09-2020: EG: Aanmaak bestand
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Toets: ANCOVA

## Casus
#v De docent van het vak Methoden & Statistiek van de faculteit Sociale 
#v Wetenschappen wil ontdekken of er verschillen zijn tussen studenten van 
#v verschillende opleidingen in het eindcijfer van zijn vak. Het vak wordt 
#v gevolgd door studenten Psychologie, Onderwijskunde en Algemene Sociale 
#v Wetenschappen (Sociologie). Uit ervaring blijkt dat het aantal gevolgde hoorcolleges 
#v ook van invloed is op het eindcijfer en dat dit nogal eens verschilt tussen 
#v studenten. Om een eerlijke vergelijking te maken, wilt hij daarom controleren 
#v voor het aantal gevolgde hoorcolleges. Op basis van de data van vorig jaar 
#v onderzoekt hij of er een verschil is tussen de drie opleidingen wat betreft 
#v het eindcijfer van het vak Methoden & Statistiek rekening houdend met het 
#v aantal gevolgde hoorcolleges. 
# seed
set.seed(12345, 
         kind = "Mersenne-Twister", 
         normal.kind = "Inversion",
         sample.kind = "Rejection")

## Simuleer data

# Aantal hoorcolleges: tussen 1 en 10, zwartepunt bij twee keer en acht keer
Aantal_Hoorcolleges_Psychologie <- sample.int(10, 
                                  500, 
                                  replace = TRUE,
                                  prob = c(0.1,
                                           0.2,
                                           0.25,
                                           0.1,
                                           0.05,
                                           0.05,
                                           0.1,
                                           0.1,
                                           0.05,
                                           0.05))

Aantal_Hoorcolleges_Onderwijskunde <- sample.int(10, 
                                  200, 
                                  replace = TRUE,
                                  prob = c(0.05,
                                           0.1,
                                           0.2,
                                           0.1,
                                           0.05,
                                           0.05,
                                           0.1,
                                           0.2,
                                           0.05,
                                           0.1))

Aantal_Hoorcolleges_Sociologie <- sample.int(10, 
                                  300, 
                                  replace = TRUE,
                                  prob = c(0.05,
                                           0.1,
                                           0.2,
                                           0.1,
                                           0.05,
                                           0.05,
                                           0.1,
                                           0.2,
                                           0.05,
                                           0.1))

Aantal_Hoorcolleges <- c(Aantal_Hoorcolleges_Psychologie,
                         Aantal_Hoorcolleges_Onderwijskunde,
                         Aantal_Hoorcolleges_Sociologie)

# Eindexamencijfer
Eindexamencijfer <- ceiling(2 * rnorm(1000,
                                         7,
                                         1))/2
Eindexamencijfer[Eindexamencijfer < 5.5] <- 5.5
Eindexamencijfer[Eindexamencijfer > 9.5] <- 9.5

# Geslacht
Opleiding <- c(rep("Psychologie", 
                  500),
              rep("Onderwijskunde", 
                  200),
              rep("Sociologie",
                  300))

#[sample.int(1000,1000)]

Opleiding_Psychologie <- as.numeric(Opleiding == "Psychologie")
Opleiding_Onderwijskunde <- as.numeric(Opleiding == "Onderwijskunde")
Opleiding_Sociologie <- as.numeric(Opleiding == "Sociologie")


# Maak afhankelijke variabele eindcijfer Methoden & Statistiek
Eindcijfer_MS <- 3 + 0.4 * Aantal_Hoorcolleges + 0.36 * Opleiding_Psychologie + 0.4 * Opleiding_Onderwijskunde + 0.2 * Eindexamencijfer +  rnorm(100,0,0.8)
Eindcijfer_MS <- round(Eindcijfer_MS,
                       1)
Eindcijfer_MS[Eindcijfer_MS > 10] <- 10.0
hist(Eindcijfer_MS)


sum(Eindcijfer_MS > 5.5)

# Maak studentnummer
Studentnummer <- sample(300000:400000,
                            100)

# Maak dataframe
Studenten_Methoden_Statistiek <- data.frame(Studentnummer,
                                            Opleiding,
                                            Aantal_Hoorcolleges,
                                            Eindexamencijfer,
                                            Eindcijfer_MS)

## Sla de datasets op
#write.csv(Studenten_Methoden_Statistiek,
#          file = "05. Datasets/31_Studenten_Methoden_Statistiek.csv")


# mean(Aantal_Hoorcolleges_Psychologie)
# mean(Aantal_Hoorcolleges_Onderwijskunde)
# mean(Aantal_Hoorcolleges_Sociologie)

# with(Studenten_Methoden_Statistiek, 
#      stby(data = Eindcijfer_MS, 
#           list(Opleiding), 
#           descr, 
#           stats = c("mean", "sd", "med", "n.valid")))

# with(Studenten_Methoden_Statistiek, 
#      stby(data = Aantal_Hoorcolleges, 
#           list(Opleiding), 
#           descr, 
#           stats = c("mean", "sd", "med", "n.valid")))

#acv <- aov(Eindcijfer_MS ~ Opleiding + Aantal_Hoorcolleges,
#           Studenten_Methoden_Statistiek)
#summary(acv)

#acv <- aov(Eindcijfer_MS ~ Opleiding,
#           Studenten_Methoden_Statistiek)
#summary(acv)

#library(emmeans)

#vvv <- emmeans_test(Studenten_Methoden_Statistiek,
#    Eindcijfer_MS ~ Opleiding, covariate = Aantal_Hoorcolleges,
#    p.adjust.method = "bonferroni"
#    )

#get_emmeans(vvv)
#mean(Aantal_Hoorcolleges)

#cooks.distance(acv)




rm(Studentnummer,
   Aantal_Hoorcolleges,
   Eindcijfer_MS,
   Eindexamencijfer,
   Aantal_Hoorcolleges_Onderwijskunde,
   Aantal_Hoorcolleges_Psychologie,
   Aantal_Hoorcolleges_Sociologie,
   Opleiding,
   Opleiding_Onderwijskunde,
   Opleiding_Psychologie,
   Opleiding_Sociologie
   )

#vv <- lm(Eindcijfer_MS ~ 1, Studenten_Methoden_Statistiek )
#summary(vv)
