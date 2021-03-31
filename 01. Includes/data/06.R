## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 06.R ####
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
## 29-06-2020: EG: Aanmaak bestand
## 04-01-2021: EG: Aantal observaties gewijzigd nav feedback MM
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set.seed(1234, 
         kind = "Mersenne-Twister", 
         normal.kind = "Inversion",
         sample.kind = "Rejection")

#Jaarlijks_inkomen <- rnorm()

Mogelijkheden <- c(1616:7000)
p_2014 <- c(
  rep(0.4,  385),     #1616-2000
  rep(0.55, 400),     #2000-2400 %>%
  rep(0.7,  400),     #2401-2800
  rep(0.8,  400),     #2801-3200
  rep(0.65, 400),     #3201-3600
  rep(0.45, 400),     #3601-4000
  rep(0.2,  1000),    #4001-5000
  rep(0.1,  1000),    #5001-6000
  rep(0.01, 1000)     #6001-7000
)
Jaarlijks_inkomen <- 10000 + replicate(29, 13*(sample(Mogelijkheden, 1, replace = TRUE, p_2014)))

# Simuleer studentnummers
Studentnummers_opties <- c(4000000:4500000)
Studentnummer <- sample(Studentnummers_opties, 29)
Studentnummer <- as.factor(Studentnummer)

# Maak een dataset
Jaarlijks_inkomen <- data.frame(Studentnummer =  Studentnummer,
                                Inkomen = Jaarlijks_inkomen)

rm(
  Mogelijkheden,
  p_2014,
  Studentnummer,
  Studentnummers_opties
)

## Sla de datasets op
#write.csv(Jaarlijks_inkomen,
#          file = "05. Datasets/06_Jaarlijks_inkomen.csv")
