## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 11.R ####
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

set.seed(7, 
         kind = "Mersenne-Twister", 
         normal.kind = "Inversion",
         sample.kind = "Rejection")
aantal_studenten <- 7348
Studentnummer <- sample(5000000:6000000, aantal_studenten)

hbo_vooropleiding <- round(rnorm(aantal_studenten, 0.4, 0.1))
hbo_vooropleiding[hbo_vooropleiding == 1] <- "ja"
hbo_vooropleiding[hbo_vooropleiding == 0] <- "nee"

Instroom_2018_totaal <- data.frame(Studentnummer, hbo_vooropleiding)

# neem sample van dataset voor binomiaaltoets
indices <- sample.int(nrow(Instroom_2018_totaal),20)
Instroom_2018_totaal_steekproef <- Instroom_2018_totaal[indices,]

rm(
  aantal_studenten,
  Studentnummer,
  hbo_vooropleiding,
  indices
)

## Sla de datasets op
#write.csv(Instroom_2018_totaal,
#          file = "05. Datasets/11_Instroom_2018_totaal.csv")

#write.csv(Instroom_2018_totaal_steekproef,
#          file = "05. Datasets/11_Instroom_2018_totaal_steekproef.csv")

