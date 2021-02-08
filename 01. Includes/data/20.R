
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 20.R ####
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
## 29-06-2020: EG: Aanmaak bestand
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# In de bachelor Psychologie kiezen studenten aan het einde van het eerste jaar 
# een specialisatie voor jaar 2 en 3. Hierbij kunnen studenten kiezen uit de 
# richtingen Klinische Neuropsychologie, Sociale Psychologie, en Arbeids- en 
# Organisatiepsychologie. De opleidingsdirecteur wilt onderzoeken op welk moment 
# in het eerste studiejaar studenten ontdekken welke specialisatie zij willen 
# doen. Daarom start zij een experiment waarin ze aan een groep eerstejaars 
# studenten vraagt om na elke onderwijsperiode aan te geven welke specialisatie 
# ze op dat moment zouden kiezen. Met dit experiment kan zij ontdekken op welk 
# moment in het eerste studiejaar studenten de keuze maken, maar ook in welke 
# periode studenten van voorkeur veranderen. Op basis van deze analyse kan de 
# opleidingsdirecteur onderzoeken op welk moment in het jaar er behoefte is aan 
# voorlichting over de verschillende specialisaties in de bachelor Psychologie.# 

# Seed om te reproduceren
set.seed(12345, 
         kind = "Mersenne-Twister", 
         normal.kind = "Inversion",
         sample.kind = "Rejection")

## Maak studentnummers
Studentnummers_opties <- c(4000000:4500000)
Studentnummer_uniek <- sample(Studentnummers_opties, 60)
Studentnummer <- rep(Studentnummer_uniek, times = 5)
Studentnummer <- as.factor(Studentnummer)

## Maak periode
Onderwijsperiode <- c(rep("P1", 60), rep("P2", 60), rep("P3", 60),
             rep("P4", 60), rep("P5", 60))

## Maak keuze voor specialisatie

# Maak verdelingen aantal specialisaties per periode
Specialisatie_P1 <- c(rep("KNP", 20), rep("SP", 20), rep("AOP", 20))
Specialisatie_P2 <- c(rep("KNP", 30), rep("SP", 20), rep("AOP", 10))
Specialisatie_P3 <- c(rep("KNP", 40), rep("SP", 10), rep("AOP", 10))
Specialisatie_P4 <- c(rep("KNP", 40), rep("SP", 15), rep("AOP", 5))
Specialisatie_P5 <- c(rep("KNP", 45), rep("SP", 10), rep("AOP", 5))

# Hussel de Specialisatie door elkaar door indexen te simuleren van 0 tot 60
Indexen_P1 <- sample.int(60, 60) 
Indexen_P2 <- sample.int(60, 60) 
Indexen_P3 <- sample.int(60, 60) 
Indexen_P4 <- sample.int(60, 60) 
Indexen_P5 <- sample.int(60, 60) 

# Voeg Specialisatie en indexen samen in een vector
Specialisatie <- c(Specialisatie_P1[Indexen_P1], Specialisatie_P2[Indexen_P2], 
                 Specialisatie_P3[Indexen_P3], Specialisatie_P4[Indexen_P4], 
                 Specialisatie_P5[Indexen_P5])

# Maak een dataset
Data_Specialisatie <- data.frame(Studentnummer, Onderwijsperiode, Specialisatie)

rm(Studentnummers_opties, Studentnummer_uniek, Studentnummer, Onderwijsperiode,
   Specialisatie_P1, Specialisatie_P2, Specialisatie_P3, Specialisatie_P4,
   Specialisatie_P5, Indexen_P1, Indexen_P2, Indexen_P3, Indexen_P4,
    Indexen_P5, Specialisatie)

## Sla de datasets op
#write.csv(Data_Specialisatie,
#          file = "05. Datasets/20_Data_Specialisatie.csv")




#### Analyse

# library(brms)

# fit1 <- brm(formula = Specialisatie ~ (1 | Studentnummer), 
#            data = Data_Specialisatie, family = "categorical",
#            seed = 12345, save_all_pars = TRUE)

# fit1

# fit2 <- brm(formula = Specialisatie ~ Periode + (1 | Studentnummer), 
#            data = Data_Specialisatie, family = "categorical",
#            seed = 12345, save_all_pars = TRUE)

# fit2# 
# 

# WAIC(fit1)

# llfit1 <- log_lik(fit1)
# lfit1 <- exp(llfit1)
# mean_lfit1 <- colMeans(lfit1)
# log_mean_lfit <- log(mean_lfit1)
# log_mean_lfit1_tot <- sum(log_mean_lfit)


# llfit1 <- sum(log(colMeans(exp(log_lik(fit1)))))
# llfit2 <- sum(log(colMeans(exp(log_lik(fit2)))))

# chi2 <- -2 * (llfit1 - llfit2)
# 1 - pchisq(chi2, df = 8)


### Links

# https://bookdown.org/ajkurz/Statistical_Rethinking_recoded/overfitting-regularization-and-information-criteria.html


#pkgbuild::has_build_tools(debug = TRUE)

## OUD

# install.packages("mclogit")
# library(mclogit)


# data("Transport")
# summary(mclogit(
#   cbind(resp,suburb)~distance+cost,
#   data=Transport
#   ))

# data(electors)

# summary(mclogit(
#   cbind(Freq,interaction(time,class))~econ.left/class+welfare/class+auth/class,
#   random=~1|party.time,
#   data=within(electors,party.time<-interaction(party,time))))

# install.packages("multgee")
# library(multgee)
# help(multgee)

# library("multgee")
# data("arthritis")
# head(arthritis)
# intrinsic.pars(y = y, data = arthritis, id = id, repeated = time,
# rscale = "ordinal")

# ordLORgee(formula = y ~ factor(time) + factor(trt) + factor(baseline),
# link = "logit", id = id, repeated = time, data = arthritis,
# LORstr = "uniform")

# vvv <- nomLORgee(formula = Bibliotheek ~ 1, data = Data_bibliotheken,
#           id = Studentnummer)
# summary(vvv)

# vvv2 <- nomLORgee(formula = Bibliotheek ~ Periode, data = Data_bibliotheken,
#           id = Studentnummer)
# summary(vvv2)# 


