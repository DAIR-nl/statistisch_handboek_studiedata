## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 41.R  ####
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
## 03-09-2020: EG: Aanmaak bestand
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Toets: multipele lineaire regressie

## Casus
# Vanuit het tutoraat van de opleiding Elektrotechniek van een hogeschool wil de 
# studieloopbaanbegeleider meer persoonsgerichte begeleiding aanbieden om 
# studenten te helpen nominaal af te studeren. Op basis van achtergrondkenmerken 
# van de student en resultaten in het eerste studiejaar wil hij een inschatting 
# maken van de kans dat iemand uitvalt in het eerste studiejaar. De variabelen 
# waarvan hij vermoedt dat er een relatie is met uitval zijn geslacht, 
# gemiddeld eindexamencijfer middelbare school, wel of geen vooropleiding in 
# het mbo en de leeftijd van een student aan het begin van het eerste 
# studiejaar. De studieloopbaanbegeleider zou graag op basis van data uit 
# willen uitzoeken welke van deze variabelen echt gerelateerd zijn aan uitval. 
# Deze informatie kan hij gebruiken om studenten waar de kans op uitval groter 
# is al vroeg in het vizier te krijgen en de juiste begeleiding aan te bieden.

# seed
set.seed(123, 
         kind = "Mersenne-Twister", 
         normal.kind = "Inversion",
         sample.kind = "Rejection")

## Simuleer data

# Maak studentnummer
Studentnummer <- sample(300000:400000,
                            250)

# Aantal hoorcolleges: tussen 1 en 10, zwartepunt bij twee keer en acht keer
Leeftijd <- sample(16:27, 
                                  250, 
                                  replace = TRUE,
                                  prob = c(0.05,
                                           0.2,
                                           0.1,
                                           0.1,
                                           0.05,
                                           0.05,
                                           0.1,
                                           0.2,
                                           0.05,
                                           0.1,
                                           0.025,
                                           0.025))

# Mbo vooropleiding
Vooropleiding <- c(rep("havo", 
                  180),
              rep("mbo", 
                  70))[sample.int(250,250)]
Vooropleiding_dummy <- rep(0,
                      250)
Vooropleiding_dummy[Vooropleiding == "havo"] <- 1

# Geslacht
Geslacht <- c(rep("Man", 
                  200),
              rep("Vrouw", 
                  50))[sample.int(250,250)]
Geslacht_dummy <- rep(0,
                      250)
Geslacht_dummy[Geslacht == "Man"] <- 1


# Eindexamencijfer wiskunde middelbare school
Eindexamencijfer <- ceiling(2 * rnorm(250,
                                         7,
                                         1))/2
Eindexamencijfer[Eindexamencijfer < 5.5] <- 5.5

# Maak afhankelijke variabele eindcijfer Methoden & Statistiek

Logit_y <- 17  - 1.1 * Leeftijd + 1.5 * Geslacht_dummy + 0 * Vooropleiding_dummy + 1.2 * Eindexamencijfer #+ rnorm(250,0,0.1)
Kans_y <- 1/(1 + exp( -1 * Logit_y))

hist(Kans_y)
plot(Kans_y)
Uitval <- rbinom(250,1,Kans_y)
table(Uitval)
UitvalTekst <- rep(0,
                   250)
UitvalTekst[Uitval == 1] <- "Geen uitval"
UitvalTekst[Uitval == 0] <- "Uitval"

Uitval_Elektrotechniek <- data.frame(Studentnummer, 
                                     Uitval,
                                     UitvalTekst,
                                        Leeftijd,
                                        Geslacht,
                                        Vooropleiding,
                                        Eindexamencijfer,
                                        Geslacht_dummy,
                                        Vooropleiding_dummy)

rm(Studentnummer,
   Geslacht,
   Geslacht_dummy,
   Eindexamencijfer,
   Kans_y,
   Leeftijd,
   Logit_y,
   Uitval,
   Vooropleiding,
   Vooropleiding_dummy
   )

## Sla de datasets op
#write.csv(Uitval_Elektrotechniek,
#          file = "05. Datasets/41_Uitval_Elektrotechniek.csv")
