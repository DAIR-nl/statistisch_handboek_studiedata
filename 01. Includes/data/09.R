# De vastgoedmanager van de  Facultaire Dienst (FD) van een hogeschool is 
# nieuwsgierig hoe de verschillende eetgelegenheden op de campus gewaardeerd 
# worden door studenten om te inventarisen op welke manier het horeca-aanbod 
# verbeterd kan worden. Uit de Nationale Studenten Enquête (NSE) blijkt dat 
# studenten van de hogeschool ontevreden zijn over het horeca-aanbod op de campus. 
# Als vervolgonderzoek hierop wordt een groep studenten gevraagd om de 
# eetgelegenheden op de campus te beoordelen. Aan de hand daarvan vergelijkt de 
# FD kantines in vier gebouwen: het hoofdgebouw, het bestuursgebouw, het 
# sportcentrum en het cultuurcentrum Rembrandt. Met deze gegevens wil de 
# vastgoedmanager onderzoeken of er verschillen zijn in de waarderingscijfers 
# van de kantines in de vier gebouwen. Als deze verschillen aanwezig zijn, is 
# zij benieuwd welke kantines van elkaar verschillen.

# Dataset heeft drie kolommen: Studentnummer, Kantine en Beoordeling. We
# nemen 20 eerstejaars studenten

# set seed
set.seed(1234)

# Definieer aantal eerstejaars studenten
N <- 20

# Simuleer studentnummers
Studentnummers_opties <- c(4000000:4500000)
Studentnummer_uniek <- sample(Studentnummers_opties, N)
Studentnummer <- rep(Studentnummer_uniek, times = 4)
Studentnummer <- as.factor(Studentnummer)

# Maak kantine variabele
Kantine <- rep(c("Hoofdgebouw", "Bestuursgebouw", "Sportcentrum",
                 "Cultuurcentrum"), 
           each = N)


# Maak variabele beoordeling
Gewichten_hoofdgebouw <- c(0,0,0.05,0.05,0.1,0.2,0.3,0.2,0.1,0)
Beoordeling_hoofdgebouw <- c(rep(1,N*Gewichten_hoofdgebouw[1]),
                             rep(2,N*Gewichten_hoofdgebouw[2]),
                             rep(3,N*Gewichten_hoofdgebouw[3]),
                             rep(4,N*Gewichten_hoofdgebouw[4]),
                             rep(5,N*Gewichten_hoofdgebouw[5]),
                             rep(6,N*Gewichten_hoofdgebouw[6]),
                             rep(7,N*Gewichten_hoofdgebouw[7]),
                             rep(8,N*Gewichten_hoofdgebouw[8]),
                             rep(9,N*Gewichten_hoofdgebouw[9]),
                             rep(10,N*Gewichten_hoofdgebouw[10])
)

Gewichten_bestuursgebouw <- c(0,0,0.1,0.1,0.3,0.2,0.1,0.1,0.1,0)
Beoordeling_bestuursgebouw <- c(rep(1,N*Gewichten_bestuursgebouw[1]),
                             rep(2,N*Gewichten_bestuursgebouw[2]),
                             rep(3,N*Gewichten_bestuursgebouw[3]),
                             rep(4,N*Gewichten_bestuursgebouw[4]),
                             rep(5,N*Gewichten_bestuursgebouw[5]),
                             rep(6,N*Gewichten_bestuursgebouw[6]),
                             rep(7,N*Gewichten_bestuursgebouw[7]),
                             rep(8,N*Gewichten_bestuursgebouw[8]),
                             rep(9,N*Gewichten_bestuursgebouw[9]),
                             rep(10,N*Gewichten_bestuursgebouw[10])
)

Gewichten_sportcentrum <- c(0,0,0.05,0.05,0.05,0.1,0.15,0.3,0.2,0.1)
Beoordeling_sportcentrum <- c(rep(1,N*Gewichten_sportcentrum[1]),
                             rep(2,N*Gewichten_sportcentrum[2]),
                             rep(3,N*Gewichten_sportcentrum[3]),
                             rep(4,N*Gewichten_sportcentrum[4]),
                             rep(5,N*Gewichten_sportcentrum[5]),
                             rep(6,N*Gewichten_sportcentrum[6]),
                             rep(7,N*Gewichten_sportcentrum[7]),
                             rep(8,N*Gewichten_sportcentrum[8]),
                             rep(9,N*Gewichten_sportcentrum[9]),
                             rep(10,N*Gewichten_sportcentrum[10])
)

Gewichten_cultuurcentrum <- c(0,0,0.05,0.2,0.3,0.3,0.1,0.05,0,0)
Beoordeling_cultuurcentrum <- c(rep(1,N*Gewichten_cultuurcentrum[1]),
                             rep(2,N*Gewichten_cultuurcentrum[2]),
                             rep(3,N*Gewichten_cultuurcentrum[3]),
                             rep(4,N*Gewichten_cultuurcentrum[4]),
                             rep(5,N*Gewichten_cultuurcentrum[5]),
                             rep(6,N*Gewichten_cultuurcentrum[6]),
                             rep(7,N*Gewichten_cultuurcentrum[7]),
                             rep(8,N*Gewichten_cultuurcentrum[8]),
                             rep(9,N*Gewichten_cultuurcentrum[9]),
                             rep(10,N*Gewichten_cultuurcentrum[10])
)

hist(Beoordeling_hoofdgebouw)
hist(Beoordeling_bestuursgebouw)
hist(Beoordeling_sportcentrum)
hist(Beoordeling_cultuurcentrum)

Indexen_hoofdgebouw <-sample.int(N, N)
Indexen_bestuursgebouw <-sample.int(N, N)
Indexen_sportcentrum <-sample.int(N, N)
Indexen_cultuurcentrum <-sample.int(N, N)

Beoordeling <- c(Beoordeling_hoofdgebouw[Indexen_hoofdgebouw],
                 Beoordeling_bestuursgebouw[Indexen_bestuursgebouw],
                 Beoordeling_sportcentrum[Indexen_sportcentrum],
                 Beoordeling_cultuurcentrum[Indexen_cultuurcentrum])



# Maak dataset
Beoordelingen_kantines <- cbind.data.frame(Studentnummer, Kantine, Beoordeling)

# Sorteer data

Beoordelingen_kantines <- Beoordelingen_kantines[order(Beoordelingen_kantines$Studentnummer),]

friedman.test(y = Beoordelingen_kantines$Beoordeling, 
              groups = Beoordelingen_kantines$Kantine,
              blocks = Beoordelingen_kantines$Studentnummer)
