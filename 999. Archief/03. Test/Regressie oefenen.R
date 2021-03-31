## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Regressie oefenen.R ####
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
## 16-07-2020: EG: Aanmaak bestand
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# links
# https://stats.stackexchange.com/questions/65713/if-you-run-ols-regression-on-cross-sectional-data-should-you-test-for-autocorre

library(rms)

set.seed(12345)

x1 <- rnorm(100,0,2)

x2 <- rnorm(100,3,2)

y <- 2.3 + 0.7 * x1 - 0.4 * x2 + rnorm(100,0,1)
y <- 2.3 + 0 * x1 - 0 * x2 + rnorm(100,0,1)

dat <- data.frame(y,x1,x2)

model <- lm(y ~ x1 + x2)
summary(model)
# Outliers
plot(cooks.distance(model))

mahalanobis(cbind(x1,x2),
            c(mean(x1),mean(x2)),
            cov(cbind(x1,x2)))

rstandard(model)

# mahalanbobis is leverage, cooks is ifluence, andere zijn outliers

# Influential points

# Linearity
plot(x1, y)
plot(x2, y)

# Homoskedasticity
plot(predict(model), rstandard(model))

# Normality
hist(residuals(model))

qqnorm(residuals(model), pch = 1,
       main = "Normaal Q-Q plot van tentamencijfers 2010",
       ylab = "Kwantielen in data",
       xlab = "Theoretische kwantielen")
qqline(residuals(model))

# Multicollinearity
rms::vif(model)


### Assumptie normaliteit of heteroskedasticity violated -> bootstrapping

## Parametric, niet helemaal wat we willen
## Bootstrap F-test
#library(pbkrtest)
#anova(m2,m1)
#m1 <- lm(y ~ 1, dat)
#m2 <- lm(y ~ x1 + x2, dat)
#PBmodcomp(m2, m1, nsim = 1000, seed = 12345, )
#library(lmtest)
#lrtest(m1,m2)

# Bootstrapped se and CI coefficients
library(car)
Boot(model, R = 1000)
Confint(Boot(model, R = 100), type = "bca")
anova(model)
# anova geeft test voor hele categorische variabele, niet alleen voor dummies
# handig!

Ff <- c()
lis <- list()
for (i in 1:50000) {
  bootstrap <- sample.int(100,100,replace = TRUE)
  dat_bootstrap <- cbind.data.frame(y = dat$y, x1 = dat$x1[bootstrap], x2 = dat$x2[bootstrap])
  mod <- lm(y ~ x1 + x2, dat_bootstrap)
  Ff[i] <- summary(mod)$fstatistic[1]
  lis[[i]] <- coefficients(mod)
  print(i)
}
hist(Ff)
sum(Ff >= summary(model)$fstatistic[1]) / length(Ff)




###### OUD

#Func <- function(mod){
#  output <- summary(mod)$fstatistic[1]
#  output
#}
#bb <- Boot(model, Func, R = 100)
#sum(summary(model)$fstatistic[1] >= bb$t) / 100
# Werkt niet, want F is niet op null model berekend, zie onder

# F test los uitvoeren voor lineaire regressie
#linearHypothesis.default(model, c("x1 = 0", "x2 = 0"))

# werkt niet
#Ff <- c()
#for (i in 1:1000) {
#  dat_b <- dat[sample.int(100,100,replace = TRUE),] 
#  mod <- lm(y ~ 1, dat_b)
#  Ff[i] <- summary(mod)$fstatistic[1]
#  print(i)
#}
#hist(Ff)
#sum(summary(model)$fstatistic[1] >= Ff) / length(Ff)

# je moet zelf bootstrap maken door predictors en afhankelijke variabele
# apart te sampelen zodat ze random gekoppeld zijn, dan zou er geen relatie
# moeten zijn, dus heb je null model als het ware. Dan verzamel je F verdeling
# en daarmee vergelijk je F die uit echte data komt.


###########################################################################


#library(lmPerm)

#pmodel <- lmp(y ~ x1 + x2, dat, perm = "Exact")
#pmodel <- lmp(y ~ x1 + x2, dat, perm = "")
#summary(pmodel)