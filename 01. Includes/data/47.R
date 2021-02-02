## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 47.R  ####
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
## 11-11-2020: EG: Aanmaak bestand
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

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
Nominaal <- c(rep("Nominaal", 
                  200),
              rep("Niet nominaal", 
                  400))[sample.int(600,600)]
Nominaal_dummy <- rep(0,
                      600)
Nominaal_dummy[Nominaal == "Nominaal"] <- 1


# Gemiddeld cijfer
Gemiddeld_cijfer <- round(rnorm(600,7,1),1)
Gemiddeld_cijfer[Gemiddeld_cijfer < 5.0] <- 5.0
Gemiddeld_cijfer[Gemiddeld_cijfer >= 10.0] <- 9.6

Logit_WO_master <- exp(-8  + 0 * Nominaal_dummy + 1.0 * Gemiddeld_cijfer) 
Logit_hbo_master <- exp(-4  + 0.9 * Nominaal_dummy + 0.4 * Gemiddeld_cijfer) 
#Logit_werk <- 17  + -0.5 * Nominaal_dummy + 1.2 * Gemiddeld_cijfer 

p_WO_master <- Logit_WO_master / (1 + Logit_WO_master + Logit_hbo_master)
p_hbo_master <- Logit_hbo_master / (1 + Logit_WO_master + Logit_hbo_master)
p_werk <- 1 / (1 + Logit_WO_master + Logit_hbo_master)

mChoices = t(apply(cbind(p_WO_master, 
                         p_hbo_master, 
                         p_werk), 
                   1, 
                   rmultinom, 
                   n = 1, 
                   size = 1))

colSums(mChoices)

Vervolg <- rep(NA,600)
Vervolg[mChoices[,1] == 1] <- "WO master"
Vervolg[mChoices[,2] == 1] <- "hbo master"
Vervolg[mChoices[,3] == 1] <- "werk"

Vervolg <- relevel(as.factor(Vervolg), ref = "werk")

Fysiotherapie_Vervolg <- cbind.data.frame(Vervolg, 
                            Studentnummer,
                            Gemiddeld_cijfer,
                            Nominaal_dummy,
                            Nominaal
                            )

#library(mclogit)

#Regressiemodel <- mblogit(Vervolg ~  Nominaal_dummy + Gemiddeld_cijfer,
#                         Fysiotherapie_Vervolg
#                         )

#summary(Regressiemodel)
#summary(Regressiemodel, dispersion = 1.35)

#dispersion(Regressiemodel, method = "Pearson")

#library(lmtest)
#lrtest(Regressiemodel)



#Fysiotherapie_Vervolg$idcase <- 1:nrow(Fysiotherapie_Vervolg)

#library(mlogit)

#Dataset2 <- dfidx(Fysiotherapie_Vervolg, shape = "wide", choice = "Vervolg")
#Dataset2 <- dfidx(Fysiotherapie_Vervolg, shape = "wide", idx = c("Studentnummer","Vervolg"))

#bbb <- mlogit(Vervolg ~  1 |  1 + Nominaal_dummy + Gemiddeld_cijfer,
#       Dataset2,
#       reflevel = "werk")

#summary(bbb)

rm(mChoices,
   Gemiddeld_cijfer,
   Nominaal,
   Nominaal_dummy,
   Logit_WO_master,
   Logit_hbo_master,
   p_WO_master,
   p_hbo_master,
   p_werk,
   Studentnummer,
   Vervolg)

## Sla de datasets op
write.csv(Fysiotherapie_Vervolg,
          file = "05. Datasets/47_Fysiotherapie_Vervolg.csv")
