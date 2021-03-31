## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 03.R ####
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
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set.seed(1, 
         kind = "Mersenne-Twister", 
         normal.kind = "Inversion",
         sample.kind = "Rejection")

mu <- 6.3
sigma <- 1.2
Cijfers_2010 <- rnorm(180, mu, sigma)
Cijfers_2010 <- Cijfers_2010[Cijfers_2010 <= 10 & Cijfers_2010 >= 1]
Cijfers_2010 <- sapply(Cijfers_2010, round, 3)

mu <- 6.3
sigma <- 1.2
Cijfers_2010_n30 <- rnorm(30, mu, sigma)
Cijfers_2010_n30 <- Cijfers_2010_n30[Cijfers_2010_n30 <= 10 & Cijfers_2010_n30 >= 1]
Cijfers_2010_n30 <- sapply(Cijfers_2010_n30, round, 3)

mu <- 6.45
sigma <- 1.2
Cijfers_2011 <- rnorm(160, mu, sigma)
Cijfers_2011 <- Cijfers_2011[Cijfers_2011 <= 10 & Cijfers_2011 >= 1]
Cijfers_2011 <- sapply(Cijfers_2011, round, 3)

mu <- 6.45
sigma <- 1.2
Cijfers_2011_n30 <- rnorm(30, mu, sigma)
Cijfers_2011_n30 <- Cijfers_2011_n30[Cijfers_2011_n30 <= 10 & Cijfers_2011_n30 >= 1]
Cijfers_2011_n30 <- sapply(Cijfers_2011_n30, round, 3)

## Maak studentnummer aan
Studentnummer <- sample(300000:400000, (length(c(Cijfers_2010, Cijfers_2011))))

Cijfers <- c(Cijfers_2010, Cijfers_2011)
Cohort <- as.character(c(replicate(180, 2010), replicate(160, 2011)))
Cijfers_gemiddeld <- data.frame(Studentnummer, Cohort, Cijfers)

# Verwijder objecten die niet nodig zijn
rm(Cijfers, Cijfers_2010, Cijfers_2011, Cohort, mu, sigma, Studentnummer)

## Sla de datasets op
#write.csv(Cijfers_gemiddeld,
#          file = "05. Datasets/03_Cijfers_gemiddeld.csv")

#write.csv(Cijfers_2011_n30,
#          file = "05. Datasets/03_Cijfers_2011_n30.csv")

#write.csv(Cijfers_2010_n30,
#          file = "05. Datasets/03_Cijfers_2010_n30.csv")
