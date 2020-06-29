
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 15.R ####
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
# De opleidingsdirecteur van de bacheloropleiding Kunstmatige Intelligentie 
# merkt dat er tijdens het eerste studiejaar veel studenten zijn die niet alle 
# vakken voldoende afsluiten. Hij wilt uitvinden in welke onderwijsperiode dit 
# vooral plaatsvindt om te onderzoeken waardoor de studievertraging veroorzaakt 
# wordt. Daarom vraagt hij studieresultaten op van eerstejaars studenten in het 
# vorige collegejaar die niet zijn uitgevallen gedurende dat jaar. Met deze 
# resultaten wilt hij onderzoeken of het percentage eerstejaars studenten dat 
# alle vakken voldoende afsluit verschilt tussen de vier onderwijsperiodes.

# Dataset heeft drie kolommen: Studentnummer, Periode en Herkansingen

# set seed
set.seed(1234)

# Simuleer studentnummers
Studentnummers_opties <- c(4000000:4500000)
Studentnummer_uniek <- sample(Studentnummers_opties, 50)
Studentnummer <- rep(Studentnummer_uniek, times = 4)
Studentnummer <- as.factor(Studentnummer)

# Maak variabele Periode
Onderwijsperiode <- rep(c(1, 2, 3, 4), 
           each = 50)
Onderwijsperiode <- as.factor(Onderwijsperiode)

# Proportie herkansingen; periode
Proportie_periode_1 <- 0.1
Proportie_periode_2 <- 0.6
Proportie_periode_3 <- 0.3
Proportie_periode_4 <- 0.4


# Simuleer herkansingen periode 1
Herkansingen_periode_1 <- rbinom(50,1,Proportie_periode_1)
Herkansingen_periode_2 <- rbinom(50,1,Proportie_periode_2)
Herkansingen_periode_3 <- rbinom(50,1,Proportie_periode_3)
Herkansingen_periode_4 <- rbinom(50,1,Proportie_periode_4)


# Bind alle herkansingsvariabelen in de variabele Herkansing
Herkansingen <- c(Herkansingen_periode_1, Herkansingen_periode_2,
                  Herkansingen_periode_3, Herkansingen_periode_4)
# Verander 0 in nee en 1 in ja
Herkansingen[Herkansingen == 0] <- "nee"
Herkansingen[Herkansingen == 1] <- "ja"

# Check proporties
table(Herkansingen,Onderwijsperiode)

# Maak dataset
Herkansingen_kunstmatige_intelligentie <- cbind.data.frame(Studentnummer, 
                                                           Onderwijsperiode, 
                                                           Herkansingen)

# Sorteer data
Herkansingen_kunstmatige_intelligentie <- Herkansingen_kunstmatige_intelligentie[order(Herkansingen_kunstmatige_intelligentie$Studentnummer),]

# Verwijder overige variabelen
rm(Studentnummers_opties, Studentnummer_uniek, Studentnummer,
   Onderwijsperiode, Proportie_periode_1, Proportie_periode_2, Proportie_periode_3,
   Proportie_periode_4, Herkansingen_periode_1, Herkansingen_periode_2,
   Herkansingen_periode_3, Herkansingen_periode_4, Herkansingen)


#### Toets

#CochranQTest(Herkansingen ~ Onderwijsperiode | Studentnummer,
#              data = Herkansingen_kunstmatige_intelligentie)

#library(rcompanion)
#install.packages("rcompanion")
#pairwiseMcnemar(Herkansingen ~ Onderwijsperiode | Studentnummer,
#                data   = Herkansingen_kunstmatige_intelligentie,
#                test   = "mcnemar",
#                method = "fdr",
#                digits = 3)

#pairwiseMcnemar(Herkansingen ~ Onderwijsperiode | Studentnummer,
#                data   = Herkansingen_kunstmatige_intelligentie,
#                test   = "exact",
#                method = "fdr",
#                digits = 3)

# Relevante links
# https://stats.stackexchange.com/questions/9867/effect-size-of-cochrans-q
# https://www.statisticshowto.datasciencecentral.com/false-discovery-rate/
# https://www.statisticshowto.datasciencecentral.com/benjamini-hochberg-procedure/
# https://www.statisticshowto.datasciencecentral.com/cochrans-q-test/
# https://ncss-wpengine.netdna-ssl.com/wp-content/themes/ncss/pdf/Procedures/NCSS/Cochrans_Q_Test.pdf
# https://en.wikipedia.org/wiki/Cochran%27s_Q_test
# https://rcompanion.org/handbook/H_07.html
# https://statistics.laerd.com/spss-tutorials/cochrans-q-test-in-spss-statistics.php#assumption4
# https://wikistatistiek.amc.nl/index.php/Cochran%27s_Q_toets
# https://dl.acm.org/doi/pdf/10.1145/3095076?casa_token=u4SSnddtJLsAAAAA%3AisfjdwaAzuLBdyns8e3eIPRp1T8_I34rNA-xIYdJ-EhlB48B3bl1FhohXMoPUbTPon7V0d9jsBPh
# 
# 
# 

