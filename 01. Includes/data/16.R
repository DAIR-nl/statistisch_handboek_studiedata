## De opleidingsdirecteur van de Bachelor Antropologie vraagt zich af wat de invloed is van de instroom van internationale studenten. Krijgen studenten uit bepaalde landen vaker een positief BSA dan studenten uit andere landen?

# Nieuw
set.seed(1)

######### Chi-kwadraat #############

# Simuleer studentnummers
Studentnummers_opties <- c(4000000:4500000)
Studentnummer <- sample(Studentnummers_opties, 2200)
#Studentnummer <- Studentnummer[order(Studentnummer)]
Studentnummer <- as.factor(Studentnummer)

# Maak een variabele met de landen erin
Landen_vooropleiding <- c(rep("NL", 1287), rep("GE", 242), rep("IT", 81),
                          rep("UK", 123), rep("BE", 49), rep("ES", 98),
                          rep("US", 320))

# Maak variabele voor positief of negatief BSA

## Maak vector met proporties studenten dat BSA haalt per land
proporties <- c(0.9, 0.85, 0.64, 0.95, 0.88, 0.78, 0.75)

## Neem sample van nullen en enen voor elk land met binomiale verdeling
NL <- rbinom(1287, 1, proporties[1])
GE <- rbinom(242, 1, proporties[2])
IT <- rbinom(81, 1, proporties[3])
UK <- rbinom(123, 1, proporties[4])
BE <- rbinom(49, 1, proporties[5])
ES <- rbinom(98, 1, proporties[6])
US <- rbinom(320, 1, proporties[7])

## Verbind alle landen
BSA_numeriek <- c(NL, GE, IT, UK, BE, ES, US)

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
BSA_kruistabel <- Tabel_BSA_antropologie[, c("NL", "GE", "IT", "UK", "BE", "ES", "US")]



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
Fisher_BSA_antropologie <- Fisher_BSA_antropologie[order(BSA_antropologie$Studentnummer),]

# Maak een tabel
Fisher_Tabel_BSA_antropologie <- table(BSA_antropologie$BSA, 
                                BSA_antropologie$Landen_vooropleiding)
# Verander volgorde tabel
Fisher_BSA_kruistabel <- Fisher_Tabel_BSA_antropologie[, c("NL", "GE", "IT", "UK", "BE", "ES", "US")]


# OUD
#RNGkind(sample.kind = "Rounding")
#set.seed(1) #noodzakelijk omdat we simulate.p.values gebruiken bij de fisher.test
#Landen_vooropleiding <- c("NL", "GE", "IT", "UK", "BE", "ES", "US")  ##ISO-codes
#Pos_bsa <- c(1171, 213,  60, 119,  45,  81, 270)
#Verhouding <- c(0.1, 0.14, 0.36, 0.04, 0.12, 0.22, 0.19)
#Neg_bsa <- round(Pos_bsa * Verhouding)
#SA_kruistabel <- data.frame(Pos_bsa, Neg_bsa)
#SA_kruistabel <- t(BSA_kruistabel)
#colnames(BSA_kruistabel) <- Landen_vooropleiding

#Pos_bsa_n10 <- c(49, 37, 62, 67, 73, 70, 69)
#Neg_bsa_n10 <- c(10, 7, 13, 14, 15, 19, 18)
#BSA_kruistabel_n10 <- data.frame(Pos_bsa_n10, Neg_bsa_n10)
#BSA_kruistabel_n10 <- t(BSA_kruistabel_n10)
#colnames (BSA_kruistabel_n10) <- Landen_vooropleiding