## Het hoofd communicatie wil in verband met wervingsactiviteiten weten wat de reistijd is van studenten aan verschillende opleidingen.

## Doel: tidy data met een kolom reistijd (value) en een kolom opleiding (factor)
library(dplyr)
RNGkind(sample.kind = "Rounding")
set.seed(3)

Studiegrootte <- 29
reistijd_gem <- 35
sd_gem <- 12
Reistijd_FIL <- round(rnorm(2.1*Studiegrootte, reistijd_gem, sd_gem), 2)
namenlijst_fil <- replicate(2.1*Studiegrootte, "Filosofie")

Studiegrootte <- 23
reistijd_gem <- 45
sd_gem <- 13
Reistijd_ATC <- round(rnorm(2.1*Studiegrootte, reistijd_gem, sd_gem), 2)
namenlijst_atc <- replicate(2.1*Studiegrootte, "Arabische Taal en Cultuur")

Studiegrootte <- 71
reistijd_gem <- 36
sd_gem <- 11
Reistijd_GSC <- round(rnorm(2.1*Studiegrootte, reistijd_gem, sd_gem), 2)
namenlijst_gsc <- replicate(2.1*Studiegrootte, "Geschiedenis")

Reistijd <- c(Reistijd_ATC, Reistijd_GSC, Reistijd_FIL)
Opleiding <- c(namenlijst_atc, namenlijst_gsc, namenlijst_fil)

Opleiding <- Opleiding[order(Reistijd)]
Reistijd <- sort(Reistijd)

Reistijd_per_opleiding <- data.frame(Reistijd, Opleiding)
colnames(Reistijd_per_opleiding) <- c("Reistijd", "Opleiding")


Reistijd_per_opleiding <- Reistijd_per_opleiding %>%
  mutate(Reistijd = if_else(Reistijd < 0, Reistijd*-1, Reistijd))