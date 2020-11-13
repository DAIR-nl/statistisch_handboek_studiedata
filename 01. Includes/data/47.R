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

# covariate matrix
mX = matrix(rnorm(1000), 200, 5)

# coefficients for each choice
vCoef1 = rep(0, 5)
vCoef2 = rnorm(5)
vCoef3 = rnorm(5)

# vector of probabilities
vProb = cbind(exp(mX %*% vCoef1), exp(mX %*% vCoef2), exp(mX %*% vCoef3))

# multinomial draws
mChoices = t(apply(vProb, 1, rmultinom, n = 1, size = 1))
dfM = cbind.data.frame(y = apply(mChoices, 1, function(x) which(x == 1)), mX)
colnames(dfM) <- c("y","x1","x2","x3","x4","x5")
dfM$y2 <- as.factor(as.character(dfM$y))
dfM$idcase <- 1:nrow(dfM)


install.packages("mlogit")
library(mlogit)

dfM2 <- dfidx(dfM, shape = "wide", choice = "y")

bbb <- mlogit(y ~  1 |  1 + x1 + x2,
       dfM2)

summary(bbb)




##################### OUD ####################

data("Fishing", package = "mlogit")
Fish <- dfidx(Fishing, varying = 2:9, shape = "wide", choice = "mode")
?dfidx
Fish$mode

mlogit(mode ~ price + catch | income, Fishing, varying = 2:9,
              rpar = c(price = 'n', catch = 'n'), correlation = TRUE,
              alton = NA, R = 50)

Fishing3 <- Fishing[,c(1,10)]

ggg <- mlogit(mode ~ 0  |  1 + income , Fishing, varying = 2:9)

summary(ggg)

?glm



library("mlogit")
data("ModeCanada", package = "mlogit")
MC <- dfidx(ModeCanada, subset = noalt == 4)
ml.MC1 <- mlogit(choice ~ cost + freq + ovt | income | ivt, MC)
ml.MC2 <- mlogit(choice ~  + freq + ovt |   income | ivt + cost, ModeCanada)
summary(ml.MC2)

bb <- ModeCanada$choice


MC$choice
?dfidx

install.packages("AER")
data("TravelMode", package = "AER")

# the first two columns contain the index

TM1 <- dfidx(TravelMode)

# explicitely indicate the two indexes using either a vector or a
# list of two characters

TM2 <- dfidx(TravelMode, idx = c("individual", "mode"))

TM3 <- dfidx(TravelMode, idx = list("individual", "mode"))

######################################################

library("mlogit")
data("Heating", package = "mlogit")

Heating2 <- Heating[,-c(3:12)]
H2 <- dfidx(Heating2, idx = c("idcase","depvar"))
m <- mlogit(depvar ~   1 + income, H2)

H <- dfidx(Heating, choice = "depvar", varying = c(3:12))
m <- mlogit(depvar ~ ic + oc | 0, H)
summary(m)

