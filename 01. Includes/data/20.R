# Case: meerdere studenten worden vijf periodes gevolgd. Hierin geven ze aan in
# welke van drie bibliotheken zij het meest geweest zijn. Hieruit krijg je een
# kruistabel met het in de rijen de drie bibliotheken en in de kolommen de vijf
# perioden. In elke cel wordt het aantal observaties geteld. De onderzoeksvraag is
# of er een afhankelijkheid is tussen de bibliotheken en de perioden.# 

# Seed om te reproduceren
set.seed(12345)

## Maak studentnummers
Studentnummers_opties <- c(4000000:4500000)
Studentnummer_uniek <- sample(Studentnummers_opties, 60)
Studentnummer <- rep(Studentnummer_uniek, times = 5)
Studentnummer <- as.factor(Studentnummer)

## Maak periode
Periode <- c(rep("P1", 60), rep("P2", 60), rep("P3", 60),
             rep("P4", 60), rep("P5", 60))

## Maak keuze voor bibliotheken

# Maak verdelingen aantal bibliotheken per periode
Bibliotheken_P1 <- c(rep("Bieb1", 20), rep("Bieb2", 20), rep("Bieb3", 20))
Bibliotheken_P2 <- c(rep("Bieb1", 30), rep("Bieb2", 20), rep("Bieb3", 10))
Bibliotheken_P3 <- c(rep("Bieb1", 40), rep("Bieb2", 10), rep("Bieb3", 10))
Bibliotheken_P4 <- c(rep("Bieb1", 40), rep("Bieb2", 15), rep("Bieb3", 5))
Bibliotheken_P5 <- c(rep("Bieb1", 45), rep("Bieb2", 10), rep("Bieb3", 5))

# Hussel de bibliotheken door elkaar door indexen te simuleren van 0 tot 60
Indexen_P1 <- sample.int(60, 60) 
Indexen_P2 <- sample.int(60, 60) 
Indexen_P3 <- sample.int(60, 60) 
Indexen_P4 <- sample.int(60, 60) 
Indexen_P5 <- sample.int(60, 60) 

# Voeg bibliotheken en indexen samen in een vector
Bibliotheek <- c(Bibliotheken_P1[Indexen_P1], Bibliotheken_P2[Indexen_P2], 
                 Bibliotheken_P3[Indexen_P3], Bibliotheken_P4[Indexen_P4], 
                 Bibliotheken_P5[Indexen_P5])

# Maak een dataset
Data_bibliotheken <- data.frame(Studentnummer, Periode, Bibliotheek)


#### Analyse

library(brms)
library(MCMCglmm)

fit <- brm(formula = Bibliotheek ~ (1 | Studentnummer), 
           data = Data_bibliotheken, family = "categorical",
           seed = 12345)

fit <- MCMCglmm(fixed = Bibliotheek ~ 1, random = ~Studentnummer, data = Data_bibliotheken,
                                     family = "categorical")



pkgbuild::has_build_tools(debug = TRUE)

## CMH test

mantelhaen.test(Data_bibliotheken$Bibliotheek, Data_bibliotheken$Periode,
                Data_bibliotheken$Studentnummer, exact = TRUE, correct = TRUE)

?mantelhaen.test

### post hoc

library(rcompanion)

pairwiseMcnemar(Bibliotheek ~ Periode | Studentnummer, data = Data_bibliotheken,
                test = "mcnemar", correct = FALSE)

# niks significant

# test los paar

subset <- Data_bibliotheken[Data_bibliotheken$Periode %in% c("P1", "P5"),]
mcnemar.test(Data_bibliotheken$Bibliotheek[Data_bibliotheken$Periode == "P1"],
             Data_bibliotheken$Bibliotheek[Data_bibliotheken$Periode == "P5"],
             correct = TRUE)

table(Data_bibliotheken$Bibliotheek[Data_bibliotheken$Periode == "P1"],
             Data_bibliotheken$Bibliotheek[Data_bibliotheken$Periode == "P5"])
table(subset$Bibliotheek, subset$Periode)


table(Data_bibliotheken$Bibliotheek, Data_bibliotheken$Periode)



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


