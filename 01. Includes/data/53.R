## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 53.R  ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R code voor Student Analytics Vrije Universiteit Amsterdam
## Copyright 2021 VU
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
## 13-01-2021: EG: Aanmaak bestand
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# De bacheloropleiding Industrieel Ontwerpen van een technische universiteit 
# wordt afgesloten met een eindproject waarin studenten opgedane kennis gebruiken 
# voor een praktijkopdracht. Deze praktijkopdracht wordt beoordeeld als 
# onvoldoende, voldoende, goed of uitstekend. De coördinator van het eindproject 
# is benieuwd of er verschillen zijn tussen studenten die voor de bachelor zijn 
# toegelaten op basis van een vwo-vooropleiding of een propedeuse in het hbo. Zij 
# wil tegelijkertijd rekening houden met de leeftijd en het gemiddelde cijfer in 
# het eerste jaar, omdat ze verwacht dat deze factoren ook invloed hebben op de 
# beoordeling van het eindproject. Als er een verschil tussen studenten met een 
# hbo-p en vwo-vooropleiding blijkt te zijn, wil de coördinator uitzoeken wat dit 
# verschil veroorzaakt en indien nodig het eindproject aanpassen.

# https://stats.stackexchange.com/questions/103728/simulating-multinomial-logit-data-with-r
# http://www.fedoa.unina.it/9889/1/Thesis.pdf

set.seed(12345, 
         kind = "Mersenne-Twister", 
         normal.kind = "Inversion",
         sample.kind = "Rejection")

# Maak studentnummer
Studentnummer <- sample(300000:400000,
                            600)

# Nominaal
Vooropleiding <- c(rep("hbo-p", 
                  200),
              rep("vwo", 
                  400))[sample.int(600,600)]
Vooropleiding_dummy <- rep(0,
                      600)
Vooropleiding_dummy[Vooropleiding == "vwo"] <- 1

# Leeftijd: tussen 1 en 10, zwartepunt bij twee keer en acht keer
Leeftijd <- sample(18:27, 
                                  600, 
                                  replace = TRUE,
                                  prob = c(0.05,
                                           0.1,
                                           0.05,
                                           0.1,
                                           0.2,
                                           0.05,
                                           0.05,
                                           0.1,
                                           0.025,
                                           0.025))

# Gemiddeld cijfer
Gemiddeld_cijfer <- round(rnorm(600,7,1),1)
Gemiddeld_cijfer[Gemiddeld_cijfer < 5.0] <- 5.0
Gemiddeld_cijfer[Gemiddeld_cijfer >= 10.0] <- 9.6

Log_odds_1 <- 4 - 0.5 * Vooropleiding_dummy + 0 * Leeftijd - 0.9 * Gemiddeld_cijfer
Log_odds_2 <- 6 - 0.5 * Vooropleiding_dummy + 0 * Leeftijd - 0.9 * Gemiddeld_cijfer
Log_odds_3 <- 9 - 0.5 * Vooropleiding_dummy + 0 * Leeftijd - 0.9 * Gemiddeld_cijfer
#Log_odds_4 <- -1.5 - 0.5 * Vooropleiding_dummy + 0 * Leeftijd + 0.8 * Gemiddeld_cijfer

p_c1 <- exp(Log_odds_1) / (1 + exp(Log_odds_1))
p_c2 <- exp(Log_odds_2) / (1 + exp(Log_odds_2))
p_c3 <- exp(Log_odds_3) / (1 + exp(Log_odds_3))
#p_c4 <- exp(Log_odds_4) / (1 + exp(Log_odds_4))

p_1 <- p_c1
p_2 <- p_c2 - p_c1
p_3 <- p_c3 - p_c2
p_4 <- 1 - p_3 - p_2 - p_1

mChoices = t(apply(cbind(p_1, p_2, p_3, p_4), 
                   1, 
                   rmultinom, 
                   n = 1, 
                   size = 1))

colSums(mChoices)

Beoordeling <- rep(NA,600)
Beoordeling[mChoices[,1] == 1] <- "Onvoldoende"
Beoordeling[mChoices[,2] == 1] <- "Voldoende"
Beoordeling[mChoices[,3] == 1] <- "Goed"
Beoordeling[mChoices[,4] == 1] <- "Uitstekend"

Beoordeling <- factor(Beoordeling, 
                      levels = c("Onvoldoende", "Voldoende", "Goed", "Uitstekend"),
                      ordered = TRUE)

Beoordelingen_eindproject <- cbind.data.frame(Beoordeling, 
                            Studentnummer,
                            Gemiddeld_cijfer,
                            Leeftijd,
                            Vooropleiding_dummy,
                            Vooropleiding
                            )

rm(mChoices,
   Beoordeling,
   Leeftijd,
   Log_odds_1,
   Log_odds_2,
   Log_odds_3,
   p_1,
   p_2,
   p_3,
   p_4,
   p_c1,
   p_c2,
   p_c3,
   Vooropleiding,
   Vooropleiding_dummy,
   Studentnummer,
   Gemiddeld_cijfer)

## Sla de datasets op
write.csv(Beoordelingen_eindproject,
          file = "05. Datasets/53_Beoordelingen_eindproject.csv")


#library(VGAM)

#vvv3 <- vglm(Beoordeling ~ Vooropleiding + Leeftijd + Gemiddeld_cijfer, 
#             family = cumulative(link = "logitlink", parallel = TRUE, reverse = FALSE),
#             data = Beoordelingen_eindproject)
#vvv4 <- vglm(Beoordeling ~ Vooropleiding + Leeftijd + Gemiddeld_cijfer, 
#             family = cumulative(link = "logitlink", parallel = FALSE, reverse = FALSE),
#             data = Beoordelingen_eindproject)
#summary(vvv3)
#summary(vvv3, dispersion = 1.2)
#lrtest(vvv3)
#lrtest(vvv3,vvv4)
#eviance(vvv3)
#summary(vvv3, dispersion = 1.2)
