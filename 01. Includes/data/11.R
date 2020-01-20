## De controller van een Universiteit is geïnteresseerd in de instroom van tweedekansstudenten. Zij vraagt zich af: Heeft onze Universiteit relatief veel tweedekansstudenten in vergelijking met het landelijke gemiddelde?
RNGkind(sample.kind = "Rounding")
set.seed (7)
aantal_studenten <- 7348
Studentnr <- sample(5000000:6000000, aantal_studenten)

hbo_achtergrond <- round(rnorm(aantal_studenten, 0.4, 0.1))
hbo_achtergrond [hbo_achtergrond == 1] <- "ja"
hbo_achtergrond [hbo_achtergrond == 0] <- "nee"

Instroom_2018_totaal <- data.frame(Studentnr, hbo_achtergrond)