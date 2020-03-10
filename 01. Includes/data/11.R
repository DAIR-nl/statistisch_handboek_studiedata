## De controller van een Universiteit is geïnteresseerd in de instroom van tweedekansstudenten. Zij vraagt zich af: Heeft onze Universiteit relatief veel tweedekansstudenten in vergelijking met het landelijke gemiddelde?
RNGkind(sample.kind = "Rounding")
set.seed (7)
aantal_studenten <- 7348
Studentnummer <- sample(5000000:6000000, aantal_studenten)

hbo_vooropleiding <- round(rnorm(aantal_studenten, 0.4, 0.1))
hbo_vooropleiding [hbo_vooropleiding == 1] <- "ja"
hbo_vooropleiding [hbo_vooropleiding == 0] <- "nee"

Instroom_2018_totaal <- data.frame(Studentnummer, hbo_vooropleiding)

# neem sample van dataset voor binomiaaltoets
indices <- sample.int(nrow(Instroom_2018_totaal),20)
Instroom_2018_totaal_steekproef <- Instroom_2018_totaal[indices,]


