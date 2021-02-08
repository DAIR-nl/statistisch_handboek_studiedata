## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 29.R ####
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
## 25-08-2020: EG: Aanmaak bestand
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Bij de bacheloropleiding Psychologie van een universiteit is besloten om naast studenten met een vwo opleiding studenten met een propedeuse voor de hbo-opleiding Psychologie ook toe te laten. De opleidingsdirecteur van de bachelor wil graag evalueren of deze hbo-p studenten het niveau aankunnen, maar is ook benieuwd of man-vrouw verschillen hierbij een rol spelen. Daarom vergelijkt zij de verschillen in gemiddeld cijfer van het eerste studiejaar voor hbo-p en vwo studenten en of dit verschillend is voor mannen en vrouwen.

# seed
set.seed(12345, kind = "Mersenne-Twister", 
         normal.kind = "Inversion",
         sample.kind = "Rejection")

# Maak studentnummers
Studentnummer <- sample(4000000:4500000, 620)
Studentnummer <- as.factor(Studentnummer)

# Mannen met hbo vooropleiding
Cijfers <- rnorm(50,
      6.5,
      1)
Mannen_hbo <- cbind(rep("Man",
                        50),
                    rep("hbo",
                        50),
                    Cijfers)

# Mannen met vwo vooropleiding
Cijfers <- rnorm(100,
      7.2,
      1)
Mannen_vwo <- cbind(rep("Man",
                        100),
                    rep("vwo",
                        100),
                    Cijfers)

# Mannen met overige vooropleiding
Cijfers <- rnorm(40,
      7.0,
      1)
Mannen_overig <- cbind(rep("Man",
                        40),
                    rep("overig",
                        40),
                    Cijfers)


# Vrouwen met hbo vooropleiding
Cijfers <- rnorm(100,
      7.5,
      1)
Vrouwen_hbo <- cbind(rep("Vrouw",
                        100),
                    rep("hbo",
                        100),
                    Cijfers)

# vrouwen met vwo vooropleiding
Cijfers <- rnorm(250,
      7.5,
      1)
Vrouwen_vwo <- cbind(rep("Vrouw",
                        250),
                    rep("vwo",
                        250),
                    Cijfers)

# Vrouwen met overige vooropleiding
Cijfers <- rnorm(80,
      7.4,
      1)
Vrouwen_overig <- cbind(rep("Vrouw",
                        80),
                    rep("overig",
                        80),
                    Cijfers)

# Bind alle cijfervariabelen aan elkaar
Gemiddelde_cijfers_psychologie <- rbind.data.frame(Mannen_hbo,
                                                   Mannen_vwo,
                                                   Mannen_overig,
                                                   Vrouwen_hbo,
                                                   Vrouwen_vwo,
                                                   Vrouwen_overig)

Gemiddelde_cijfers_psychologie <- cbind.data.frame(Studentnummer,
                                                   Gemiddelde_cijfers_psychologie)
colnames(Gemiddelde_cijfers_psychologie) <- c("Studentnummer",
                                              "Geslacht",
                                              "Vooropleiding",
                                              "Gemiddeld_cijfer")

Gemiddelde_cijfers_psychologie$Gemiddeld_cijfer <- as.numeric(as.character(Gemiddelde_cijfers_psychologie$Gemiddeld_cijfer))

Gemiddelde_cijfers_psychologie$Gemiddeld_cijfer[Gemiddelde_cijfers_psychologie$Gemiddeld_cijfer >= 10] <- 9.948564

Gemiddelde_cijfers_psychologie <- Gemiddelde_cijfers_psychologie[sample.int(620,620),]
################################################################################

# geen interactie-effect

set.seed(1234)
# Maak studentnummers
Studentnummer <- sample(4000000:4500000, 620)
Studentnummer <- as.factor(Studentnummer)

# Mannen met hbo vooropleiding
Cijfers <- rnorm(50,
      6.7,
      1)
Mannen_hbo <- cbind(rep("Man",
                        50),
                    rep("hbo",
                        50),
                    Cijfers)

# Mannen met vwo vooropleiding
Cijfers <- rnorm(100,
      7.1,
      1)
Mannen_vwo <- cbind(rep("Man",
                        100),
                    rep("vwo",
                        100),
                    Cijfers)

# Mannen met overige vooropleiding
Cijfers <- rnorm(40,
      7.0,
      1)
Mannen_overig <- cbind(rep("Man",
                        40),
                    rep("overig",
                        40),
                    Cijfers)


# Vrouwen met hbo vooropleiding
Cijfers <- rnorm(100,
      6.9,
      1)
Vrouwen_hbo <- cbind(rep("Vrouw",
                        100),
                    rep("hbo",
                        100),
                    Cijfers)

# vrouwen met vwo vooropleiding
Cijfers <- rnorm(250,
      7.3,
      1)
Vrouwen_vwo <- cbind(rep("Vrouw",
                        250),
                    rep("vwo",
                        250),
                    Cijfers)

# Vrouwen met overige vooropleiding
Cijfers <- rnorm(80,
      7.2,
      1)
Vrouwen_overig <- cbind(rep("Vrouw",
                        80),
                    rep("overig",
                        80),
                    Cijfers)

# Bind alle cijfervariabelen aan elkaar
Hoofdeffecten_Gemiddelde_cijfers_psychologie <- rbind.data.frame(Mannen_hbo,
                                                   Mannen_vwo,
                                                   Mannen_overig,
                                                   Vrouwen_hbo,
                                                   Vrouwen_vwo,
                                                   Vrouwen_overig)

Hoofdeffecten_Gemiddelde_cijfers_psychologie <- cbind.data.frame(Studentnummer,
                                                   Hoofdeffecten_Gemiddelde_cijfers_psychologie)
colnames(Hoofdeffecten_Gemiddelde_cijfers_psychologie) <- c("Studentnummer",
                                              "Geslacht",
                                              "Vooropleiding",
                                              "Gemiddeld_cijfer")

Hoofdeffecten_Gemiddelde_cijfers_psychologie$Gemiddeld_cijfer <- as.numeric(as.character(Hoofdeffecten_Gemiddelde_cijfers_psychologie$Gemiddeld_cijfer))

Hoofdeffecten_Gemiddelde_cijfers_psychologie$Gemiddeld_cijfer[Hoofdeffecten_Gemiddelde_cijfers_psychologie$Gemiddeld_cijfer >= 10] <- 9.948564

Hoofdeffecten_Gemiddelde_cijfers_psychologie <- Hoofdeffecten_Gemiddelde_cijfers_psychologie[sample.int(620,620),]


rm(Mannen_hbo,
   Mannen_overig,
   Mannen_vwo,
   Vrouwen_hbo,
   Vrouwen_overig,
   Vrouwen_vwo,
   Cijfers,
   Studentnummer)

## Sla de datasets op
#write.csv(Gemiddelde_cijfers_psychologie,
#          file = "05. Datasets/29_Gemiddelde_cijfers_psychologie.csv")

#write.csv(Hoofdeffecten_Gemiddelde_cijfers_psychologie,
#          file = "05. Datasets/29_Hoofdeffecten_Gemiddelde_cijfers_psychologie.csv")


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

