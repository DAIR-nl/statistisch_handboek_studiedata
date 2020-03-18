RNGkind(sample.kind = "Rounding")
set.seed(1)

## Maak inkomens T1 aan
Alumni_inkomens_T1 <- c(
  replicate(0, 38),
  sample(19620:24000, 20),
  sample(24000:26400, 70),
  sample(26400:31200, 160),
  sample(31200:43200, 40),
  sample(43200:60000, 10),
  sample(60000:180000, 3)
)
Alumni_inkomens_T1 <- unlist(Alumni_inkomens_T1)
Alumni_inkomens_T1 <- sort(Alumni_inkomens_T1)

## Maak inkomens T2 op basis van opslag over T1
Promotie_mogelijkheden <- c(0, 800, 1600, 2600, 3200, -100, -200, -400)

#Weging               <- c(400, 400,  200,   100,  10,  200,   100,    50)
Opslag <- sample(Promotie_mogelijkheden, length(Alumni_inkomens_T1), replace = TRUE)
Alumni_inkomens_T2 <- Alumni_inkomens_T1 + Opslag

## Stel volgorde vast en hussel paargewijs
volgorde <- sample(1:length(Alumni_inkomens_T1), length(Alumni_inkomens_T1))
Alumni_inkomens_T1 <- Alumni_inkomens_T1[volgorde]
Alumni_inkomens_T2 <- Alumni_inkomens_T2[volgorde]

## link studentnummer aan vastgestelde volgorde en maak dataframe
Studentnummer <- sample(3000000:4000000, length(Alumni_inkomens_T1))
Studentnummer <- c(Studentnummer,Studentnummer)
Inkomen<- c(Alumni_inkomens_T1, Alumni_inkomens_T2)
Meetmoment <- c(replicate(length(Alumni_inkomens_T1), "T1"), (replicate(length(Alumni_inkomens_T2), "T2")))
Alumni_jaarinkomens <- data.frame(Studentnummer, Meetmoment, Inkomen)

# Verwijder alles behalve dataset

rm(Alumni_inkomens_T1, Alumni_inkomens_T2, Inkomen, Meetmoment, Opslag, 
        Promotie_mogelijkheden, Studentnummer, volgorde)

