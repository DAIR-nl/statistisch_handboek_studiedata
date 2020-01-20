RNGkind(sample.kind = "Rounding")
set.seed(1)
Mogelijkheden <- c(1616:7000)


## Maak inkomens T1 aan
Alumni_inkomens_T1 <- c(
  replicate(0, 38),
  sample(500:1800, 80),
  sample(1635:2000, 20),
  sample(2000:2200, 70),
  sample(2200:2600, 120),
  sample(2600:3600, 40),
  sample(3600:5000, 10),
  sample(5000:15000, 3)
)
Alumni_inkomens_T1 <- unlist(Alumni_inkomens_T1)
Alumni_inkomens_T1 <- sort(Alumni_inkomens_T1)

## Maak inkomens T2 op basis van opslag over T1
Promotie_mogelijkheden <- c(0, 100, 200, 400, 1000, -50, -100, -200)
#Weging               <- c(400, 400,  200,   100,  10,  200,   100,    50)
Opslag <- sample(Promotie_mogelijkheden, length(Alumni_inkomens_T1), replace = TRUE)
Alumni_inkomens_T2 <- Alumni_inkomens_T1 + Opslag

## Stel volgorde vast en hussel paargewijs
volgorde <- sample(1:length(Alumni_inkomens_T1), length(Alumni_inkomens_T1))
Alumni_inkomens_T1 <- Alumni_inkomens_T1[volgorde]
Alumni_inkomens_T2 <- Alumni_inkomens_T2[volgorde]

## link studentnummer aan vastgestelde volgorde en maak dataframe
Studentnr <- 2*sample(3000000:4000000, length(Alumni_inkomens_T1))
Inkomen<- c(Alumni_inkomens_T1, Alumni_inkomens_T2)
Meetmoment <- c(replicate(length(Alumni_inkomens_T1), "T1"), (replicate(length(Alumni_inkomens_T2), "T2")))
Alumni_inkomens <- data.frame(Studentnr, Meetmoment, Inkomen)

## Sorteer op inkomen voor presentatie dataset
Alumni_inkomens <- Alumni_inkomens[order(Alumni_inkomens$Inkomen, decreasing = TRUE),]