RNGkind(sample.kind = "Rounding")
set.seed(2)

## stel parameters data vast
MUt0 <- 29
MUt1 <- 29.2
SD <- 9

## maak uren studeren aan op basis van een normale verdeling
Uren_studeren_t0 <- rnorm(134, MUt0, SD)
Uren_studeren_t1 <- rnorm(134, MUt1, SD)

## Rond uren studeren af naar 1 decimaal
Uren_studeren_t0 <- sapply(Uren_studeren_t0, round, 1)
Uren_studeren_t1 <- sapply(Uren_studeren_t1, round, 1)

## stel volgorde vast en rangschik op grootte, voeg daarna samen
volgorde <- order(Uren_studeren_t0)
Uren_studeren_t0 <- sort(Uren_studeren_t0)
Uren_studeren_t1 <- sort(Uren_studeren_t1)
Uren_studeren_t0 <- Uren_studeren_t0[volgorde]
Uren_studeren_t1 <- Uren_studeren_t1[volgorde]
Uren_studeren <- c(Uren_studeren_t0, Uren_studeren_t1)

## Maak studentnummer aan en verdubbel
Studentnr <-sample(300000:400000, (length(Uren_studeren_t0)))
Studentnr <- c(Studentnr, Studentnr)

## Maak meetmoment aan en voeg samen als factor
Meetmoment_t0 <- replicate(length(Uren_studeren_t0), "T0")
Meetmoment_t1 <- replicate(length(Uren_studeren_t1), "T1")
Meetmoment <- as.factor(c(Meetmoment_t0, Meetmoment_t1))

## Voeg samen in data.frame
Studielogboek <- data.frame(Studentnr, Uren_studeren, Meetmoment)

## MAAK N30 SAMPLE, let op klopt niet helemaal
Uren_studeren_T0_n30 <- sample(Uren_studeren_t0, 30)
Uren_studeren_T1_n30 <- sample(Uren_studeren_t1, 30)
