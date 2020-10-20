## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 58.R ####
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
## Bij de masteropleiding Bioinformatics worden studenten met een bachelor 
## Biologie, Wiskunde en Informatica toegelaten. De decaan van de faculteit wil 
## deze toelatingseisen evalueren en onderzoeken of het curriculum aansluit bij 
## de studenten van deze vooropleidingen. Daarom vergelijkt zij de studenten 
## van de drie vooropleidingen wat betreft hun gemiddelde cijfers in periode 1, 
## 2 en 3. Op basis hiervan kan zij de toelaatbaarheid voor de drie 
## bacheloropleidingen heroverwegen of overwegen om een aantal verplicht te 
## volgen bachelorvakken in te stellen als ingangseis.

# Laad packages in
#library(MASS)

# seed
set.seed(1234)

# Maak cijfers voor drie opleidingen
Cijfers_wiskunde <- mvrnorm(200,
                            mu = c(7.5,7.0,6.4),
                            Sigma = matrix(c(0.2,0.1,0.1,0.1,0.2,0.1,0.1,0.1,0.2),3,3))
cov(Cijfers_wiskunde)
colMeans(Cijfers_wiskunde)

Cijfers_informatica <- mvrnorm(250,
                            mu = c(7.5,7.0,6.4),
                            Sigma = matrix(c(0.2,0.1,0.1,0.1,0.2,0.1,0.1,0.1,0.2),3,3))
cov(Cijfers_informatica)
colMeans(Cijfers_informatica)

Cijfers_biologie <- mvrnorm(300,
                            mu = c(6.7,6.4,7.8),
                            Sigma = matrix(c(0.2,0.1,0.1,0.1,0.2,0.1,0.1,0.1,0.2),3,3))
cov(Cijfers_biologie)
colMeans(Cijfers_biologie)

Cijfers <- rbind.data.frame(Cijfers_wiskunde,
                            Cijfers_informatica,
                            Cijfers_biologie)

# Maak variabele opleiding
Bacheloropleiding <- c(rep("Wiskunde",200),
                       rep("Informatica",250),
                       rep("Biologie",300)
                       )

# Maak studentnummers
Studentnummer <- sample(4000000:4500000, 750)
Studentnummer <- as.factor(Studentnummer)


Gemiddelde_cijfers_bioinformatics <- cbind.data.frame(Studentnummer,
                                                   Bacheloropleiding,
                                                   Cijfers)

colnames(Gemiddelde_cijfers_bioinformatics) <- c("Studentnummer",
                                              "Bacheloropleiding",
                                              "Cijfers_P1",
                                              "Cijfers_P2",
                                              "Cijfers_P3"
                                              )

Gemiddelde_cijfers_bioinformatics$Cijfers_P1[Gemiddelde_cijfers_bioinformatics$Cijfers_P1 >= 10] <- 9.948564
Gemiddelde_cijfers_bioinformatics$Cijfers_P1[Gemiddelde_cijfers_bioinformatics$Cijfers_P2 >= 10] <- 9.948564
Gemiddelde_cijfers_bioinformatics$Cijfers_P1[Gemiddelde_cijfers_bioinformatics$Cijfers_P3 >= 10] <- 9.948564

Gemiddelde_cijfers_bioinformatics <- Gemiddelde_cijfers_bioinformatics[sample.int(750,750),]
################################################################################


Dep <- cbind(Gemiddelde_cijfers_bioinformatics$Cijfers_P1, 
             Gemiddelde_cijfers_bioinformatics$Cijfers_P2, 
             Gemiddelde_cijfers_bioinformatics$Cijfers_P3)

MANOVA <- manova(Dep ~ Bacheloropleiding, data = Gemiddelde_cijfers_bioinformatics)
summary(MANOVA)

summary.aov(MANOVA)

rm(Dep, 
   MANOVA, 
   Cijfers, 
   Studentnummer, 
   Cijfers_biologie,
   Cijfers_informatica,
   Cijfers_wiskunde,
   Bacheloropleiding)


