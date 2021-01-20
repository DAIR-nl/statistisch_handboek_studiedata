## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 32.R  ####
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
## 17-07-2020: EG: Aanmaak bestand
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Toets: Mixed ANOVA

## Casus

# De masteropleiding Sustainable Change Management is een experiment gestart 
# waarbij studenten die niet direct toelaatbaar zijn voor de opleiding een 
# premasterprogramma van een half jaar kunnen volgen om alsnog toegelaten te 
# worden. Om dit experiment te evalueren wil het afdelingshoofd onderzoeken of 
# er verschillen zijn tussen de resultaten van premasterstudenten en direct 
# toelaatbare studenten. Daarom vraagt hij te onderzoeken of er verschillen 
# zijn tussen de toelaatbare en premasterstudenten voor de kernvakken 
# Sustainable Innovation, Organizational Change Management en Organizational 
# Psychology en de masterthesis. Op basis van deze analyse kan het 
# afdelingshoofd zien of het premasterprogramma goed aansluit bij het 
# masterprogramma en waar eventuele tekortkomingen zitten.

# seed
set.seed(12, 
         kind = "Mersenne-Twister", 
         normal.kind = "Inversion",
         sample.kind = "Rejection")

# Maak studentnummers
Studentnummer <- sample(4000000:4500000, 
                        230)
Studentnummer <- as.factor(Studentnummer)
Studentnummer <- rep(Studentnummer,
                     4)

# Cijfers Premaster Sustainable Innovation
Cijfers_P_SI <- rnorm(80,
                      7.0,
                      1)

# Cijfers Master Sustainable Innovation
Cijfers_M_SI <- rnorm(150,
                      6.3,
                      1)

# Cijfers Premaster Organizational Change Management
Cijfers_P_OC <- rnorm(80,
                      6.4,
                      1)

# Cijfers Master Organizational Change Management
Cijfers_M_OC <- rnorm(150,
                      7.2,
                      1)

# Cijfers Premaster Organizational Psychology
Cijfers_P_OP <- rnorm(80,
                      6.7,
                      1)

# Cijfers Master Organizational Psychology
Cijfers_M_OP <- rnorm(150,
                      7.6,
                      1)

# Cijfers Premaster Thesis
Cijfers_P_TH <- rnorm(80,
                      7.5,
                      1)

# Cijfers Master Thesis
Cijfers_M_TH <- rnorm(150,
                      7.5,
                      1)

# Bind alle cijfervariabelen aan elkaar
Cijfer <- c(Cijfers_P_SI,
            Cijfers_M_SI,
            Cijfers_P_OC,
            Cijfers_M_OC,
            Cijfers_P_OP,
            Cijfers_M_OP,
            Cijfers_P_TH,
            Cijfers_M_TH
            )

Cijfer[Cijfer > 10] <- 10
hist(Cijfer)

# Maak een variabele die aangeeft of het een theorie of praktijk vak is
Premaster <- rep(c(rep("Premaster",
                      80),
                  rep("Geen premaster",
                      150)),
                4)

# Maak een variabele die de onderwijsperiode aangeeft
Vak <- c(rep("Sustainable Innovation",
             230),
         rep("Organizational Change Management",
             230),
         rep("Organizational Psychology",
             230),
         rep("Thesis",
             230))


# Bind alles in een dataset
Resultaten_SCM <- cbind.data.frame(Studentnummer,
                                   Premaster,
                                   Vak,
                                   Cijfer)

library(ez)

ezANOVA(Resultaten_SCM, 
        dv = Cijfer, 
        wid = Studentnummer,
        within = Vak,
        between = Premaster,
        detailed = TRUE)



#library(schoRsch)
#anova_out(bb)

rm(Cijfer,
   Vak,
   Premaster,
   Studentnummer,
   Cijfers_M_OC,
   Cijfers_P_OC,
   Cijfers_M_SI,
   Cijfers_P_SI,
   Cijfers_M_OP,
   Cijfers_P_OP,
   Cijfers_M_TH,
   Cijfers_P_TH)

################################################################################

# geen interactie-effect
# Maak studentnummers
Studentnummer <- sample(4000000:4500000, 
                        230)
Studentnummer <- as.factor(Studentnummer)
Studentnummer <- rep(Studentnummer,
                     4)

# Cijfers Premaster Sustainable Innovation
Cijfers_P_SI <- rnorm(80,
                      6.0,
                      1)

# Cijfers Master Sustainable Innovation
Cijfers_M_SI <- rnorm(150,
                      6.5,
                      1)

# Cijfers Premaster Organizational Change Management
Cijfers_P_OC <- rnorm(80,
                      6.4,
                      1)

# Cijfers Master Organizational Change Management
Cijfers_M_OC <- rnorm(150,
                      6.9,
                      1)

# Cijfers Premaster Organizational Psychology
Cijfers_P_OP <- rnorm(80,
                      6.7,
                      1)

# Cijfers Master Organizational Psychology
Cijfers_M_OP <- rnorm(150,
                      7.2,
                      1)

# Cijfers Premaster Thesis
Cijfers_P_TH <- rnorm(80,
                      7.5,
                      1)

# Cijfers Master Thesis
Cijfers_M_TH <- rnorm(150,
                      8.0,
                      1)

# Bind alle cijfervariabelen aan elkaar
Cijfer <- c(Cijfers_P_SI,
            Cijfers_M_SI,
            Cijfers_P_OC,
            Cijfers_M_OC,
            Cijfers_P_OP,
            Cijfers_M_OP,
            Cijfers_P_TH,
            Cijfers_M_TH
            )

Cijfer[Cijfer > 10] <- 10
hist(Cijfer)

# Maak een variabele die aangeeft of het een theorie of praktijk vak is
Premaster <- rep(c(rep("Premaster",
                      80),
                  rep("Geen premaster",
                      150)),
                4)

# Maak een variabele die de onderwijsperiode aangeeft
Vak <- c(rep("Sustainable Innovation",
             230),
         rep("Organizational Change Management",
             230),
         rep("Organizational Psychology",
             230),
         rep("Thesis",
             230))


# Bind alles in een dataset
Hoofdeffecten_Resultaten_SCM <- cbind.data.frame(Studentnummer,
                                   Premaster,
                                   Vak,
                                   Cijfer)

library(ez)
ezANOVA(Resultaten_SCM, 
        dv = Cijfer, 
        wid = Studentnummer,
        within = Vak,
        between = Premaster,
        detailed = TRUE)

rm(Cijfer,
   Vak,
   Premaster,
   Studentnummer,
   Cijfers_M_OC,
   Cijfers_P_OC,
   Cijfers_M_SI,
   Cijfers_P_SI,
   Cijfers_M_OP,
   Cijfers_P_OP,
   Cijfers_M_TH,
   Cijfers_P_TH)


#vvv <- aov(Gemiddeld_cijfer ~ Geslacht + Vooropleiding + Geslacht:Vooropleiding,
#    data = Gemiddelde_cijfers_psychologie)
#mod <- "Gemiddeld_cijfer ~ Geslacht + Vooropleiding + Geslacht:Vooropleiding"

#summary(vvv)
#vvv$terms
#library(effects)
#allEffects(vvv)


#by(Gemiddelde_cijfers_psychologie$Gemiddeld_cijfer,
#   list(Gemiddelde_cijfers_psychologie$Geslacht,
#        Gemiddelde_cijfers_psychologie$Vooropleiding),
#   summary)


#install.packages("summarytools")
#library(summarytools)

#with(Gemiddelde_cijfers_psychologie, stby(data = Gemiddeld_cijfer,
#   list(Geslacht,
#        Vooropleiding),
#   descr,
#   stats = c("mean","sd","med","n.valid")))