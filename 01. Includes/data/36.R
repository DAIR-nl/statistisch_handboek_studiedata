## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 36.R  ####
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
## 23-02-2021: EG: Aanmaak bestand
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# seed
set.seed(1234, 
         kind = "Mersenne-Twister", 
         normal.kind = "Inversion",
         sample.kind = "Rejection")

N <- 1000

## Simuleer data

# Maak studentnummer
Studentnummer <- sample(300000:400000,
                            N)

# Gemiddeld cijfer
Gemiddeld_cijfer <- round(rnorm(N,7,1),1)
Gemiddeld_cijfer[Gemiddeld_cijfer < 5.0] <- 5.0
Gemiddeld_cijfer[Gemiddeld_cijfer >= 10.0] <- 9.6

# Mbo Frequentie
Frequentie <- c(rep("Wekelijks", 
                  600),
              rep("Maandelijks", 
                  400))[sample.int(N,N)]
Frequentie_dummy <- rep(0,
                      N)
Frequentie_dummy[Frequentie == "Wekelijks"] <- 1

# Geslacht
Geslacht <- c(rep("Man", 
                  800),
              rep("Vrouw", 
                  200))[sample.int(N,N)]
Geslacht_dummy <- rep(0,
                      N)
Geslacht_dummy[Geslacht == "Man"] <- 1

df <- cbind.data.frame(Gemiddeld_cijfer, Geslacht_dummy, Frequentie_dummy)

library(coxed)

simdata <- sim.survdata(T = 500, X = df, num.data.frames = 1, beta = c(0.2, -0.4, 0.6))

simdata$betas

vvv <- simdata$data
hist(vvv$y, breaks = 50)

model <- coxph(Surv(y, failed) ~ Gemiddeld_cijfer + Geslacht_dummy + Frequentie_dummy, data = vvv)
model$coefficients
summary(model)
test.ph <- cox.zph(model)
test.ph

?coxph
?Surv

# Eindexamencijfer wiskunde middelbare school
Eindexamencijfer <- ceiling(2 * rnorm(N,
                                         7,
                                         1))/2
Eindexamencijfer[Eindexamencijfer < 5.5] <- 5.5

# Maak afhankelijke variabele eindcijfer Methoden & Statistiek

Logit_y <- 17  - 1.1 * Leeftijd + 1.5 * Geslacht_dummy + 0 * Frequentie_dummy + 1.2 * Eindexamencijfer #+ rnorm(250,0,0.1)
Kans_y <- 1/(1 + exp( -1 * Logit_y))

hist(Kans_y)
plot(Kans_y)
Uitval <- rbinom(250,1,Kans_y)
table(Uitval)
Uitval[Uitval == 1] <- "Geen uitval" 
Uitval[Uitval == 0] <- "Uitval" 

Uitval_Elektrotechniek <- data.frame(Studentnummer, 
                                     Uitval,
                                        Leeftijd,
                                        Geslacht,
                                        Frequentie,
                                        Eindexamencijfer,
                                        Geslacht_dummy,
                                        Frequentie_dummy)

rm(Studentnummer,
   Geslacht,
   Geslacht_dummy,
   Eindexamencijfer,
   Kans_y,
   Leeftijd,
   Logit_y,
   Uitval,
   Frequentie,
   Frequentie_dummy
   )

## Sla de datasets op
#write.csv(Uitval_Elektrotechniek,
#          file = "05. Datasets/41_Uitval_Elektrotechniek.csv")
