## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 16.R ####
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

## De opleidingsdirecteur van de Bachelor Antropologie vraagt zich af wat de invloed is van de instroom van internationale studenten. Krijgen studenten uit bepaalde landen vaker een positief BSA dan studenten uit andere landen?

# Nieuw
set.seed(1, 
         kind = "Mersenne-Twister", 
         normal.kind = "Inversion",
         sample.kind = "Rejection")

######### Chi-kwadraat #############

# Simuleer studentnummers
Studentnummers_opties <- c(4000000:4500000)
Studentnummer <- sample(Studentnummers_opties, 2200)
#Studentnummer <- Studentnummer[order(Studentnummer)]
Studentnummer <- as.factor(Studentnummer)

# Maak een variabele met de landen erin
Landen_vooropleiding <- c(rep("NL", 1287), rep("GE", 242), rep("IT", 81),
                          rep("UK", 123), rep("ES", 49), rep("BE", 98),
                          rep("US", 320))

# Maak variabele voor positief of negatief BSA

## Maak vector met proporties studenten dat BSA haalt per land
proporties <- c(0.9, 0.85, 0.64, 0.95, 0.88, 0.78, 0.75)

## Neem sample van nullen en enen voor elk land met binomiale verdeling
NL <- rbinom(1287, 1, proporties[1])
GE <- rbinom(242, 1, proporties[2])
IT <- rbinom(81, 1, proporties[3])
UK <- rbinom(123, 1, proporties[4])
ES <- rbinom(49, 1, proporties[5])
BE <- rbinom(98, 1, proporties[6])
US <- rbinom(320, 1, proporties[7])

## Verbind alle landen
BSA_numeriek <- c(NL, GE, IT, UK, ES, BE, US)

## Zet 1 om in positief en 0 om in negatief, dan heb je BSA variabele
BSA <- BSA_numeriek
BSA[BSA == 1] <- "Positief"
BSA[BSA == 0] <- "Negatief"


# Maak dataset
BSA_antropologie <- data.frame(Studentnummer, Landen_vooropleiding, BSA)
# Sorteer dataset
BSA_antropologie <- BSA_antropologie[order(BSA_antropologie$Studentnummer),]

# Maak een tabel
Tabel_BSA_antropologie <- table(BSA_antropologie$BSA, 
                                BSA_antropologie$Landen_vooropleiding)
# Verander volgorde tabel
BSA_kruistabel <- Tabel_BSA_antropologie[, c("NL", "GE", "IT", "UK", "ES", "BE", "US")]



######### Fisher Freeman Halton #############

# Simuleer studentnummers
Studentnummers_opties <- c(4000000:4500000)
Studentnummer <- sample(Studentnummers_opties, 390)
#Studentnummer <- Studentnummer[order(Studentnummer)]
Studentnummer <- as.factor(Studentnummer)

# Maak een variabele met de landen erin
Landen_vooropleiding <- c(rep("NL", 41), rep("GE", 29), rep("IT", 55),
                          rep("UK", 61), rep("BE", 68), rep("ES", 69),
                          rep("US", 67))

# Maak variabele voor positief of negatief BSA

## Neem sample van nullen en enen voor elk land met binomiale verdeling
Pos <- c(39, 27, 52, 57, 63, 60, 59)
Neg <- c(2, 2, 3, 4, 5, 9, 8)

## Zet nul en een neer per land
NL <- c(rep(1, Pos[1]), rep(0, Neg[1]))
GE <- c(rep(1, Pos[2]), rep(0, Neg[2]))
IT <- c(rep(1, Pos[3]), rep(0, Neg[3]))
UK <- c(rep(1, Pos[4]), rep(0, Neg[4]))
BE <- c(rep(1, Pos[5]), rep(0, Neg[5]))
ES <- c(rep(1, Pos[6]), rep(0, Neg[6]))
US <- c(rep(1, Pos[7]), rep(0, Neg[7]))

## Verbind alle landen
BSA_numeriek <- c(NL, GE, IT, UK, BE, ES, US)

## Zet 1 om in positief en 0 om in negatief, dan heb je BSA variabele
BSA <- BSA_numeriek
BSA[BSA == 1] <- "Positief"
BSA[BSA == 0] <- "Negatief"


# Maak dataset
Fisher_BSA_antropologie <- data.frame(Studentnummer, Landen_vooropleiding, BSA)
# Sorteer dataset
Fisher_BSA_antropologie <- Fisher_BSA_antropologie[order(Fisher_BSA_antropologie$Studentnummer),]

# Maak een tabel
Fisher_Tabel_BSA_antropologie <- table(BSA_antropologie$BSA, 
                                BSA_antropologie$Landen_vooropleiding)
# Verander volgorde tabel
Fisher_BSA_kruistabel <- Fisher_Tabel_BSA_antropologie[, c("NL", "GE", "IT", "UK", "BE", "ES", "US")]

## Sla de datasets op
#write.csv(BSA_antropologie,
#          file = "05. Datasets/16_BSA_antropologie.csv")

#write.csv(Fisher_BSA_antropologie,
#          file = "05. Datasets/16_Fisher_BSA_antropologie.csv")


rm(Studentnummers_opties, 
Studentnummer, 
Landen_vooropleiding, 
proporties, 
NL, 
GE, 
IT, 
UK, 
ES, 
BE, 
US, 
BSA_numeriek, 
BSA, 
Tabel_BSA_antropologie, 
Pos, 
Neg, 
Fisher_Tabel_BSA_antropologie
)
