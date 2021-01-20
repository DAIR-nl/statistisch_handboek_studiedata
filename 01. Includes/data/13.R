
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 13.R ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R code voor Student Analytics Vrije Universiteit Amsterdam
## Copyright 2020 VU
## Web Page: http://www.vu.nl
## Contact: Theo Bakker (t.c.bakker@vu.nl)
## Verspreiding buiten de VU: Ja
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
# set seed
set.seed(1, 
         kind = "Mersenne-Twister", 
         normal.kind = "Inversion",
         sample.kind = "Rejection")

# Uitgangspunt:
## Voor leenstelsel: 375 uitval, 496 niet uitval, totaal is 871
## Na leenstelsel: 369 uitval, 394 niet uitval, totaal is 763
## Totaal: 1634

# Simuleer studentnummers
Studentnummers_opties <- c(4000000:4500000)
Studentnummer <- sample(Studentnummers_opties, 1634)
Studentnummer <- Studentnummer[order(Studentnummer)]
Studentnummer <- as.factor(Studentnummer)

# Maak variabele Periode: voor en na leenstelsel
Periode <- c(rep("Geen leenstelsel", 871), rep("Leenstelsel", 763))

# Maak variabele uitval voor studenten voor leenstelsel
Uitval_voor_leenstelsel <- c(rep("Uitval", 375), rep("Geen uitval", 496))
# Randomiseer waarden
Uitval_voor_leenstelsel <- Uitval_voor_leenstelsel[sample.int(length(Uitval_voor_leenstelsel))]

# Maak variabele uitval voor studenten na leenstelsel
Uitval_na_leenstelsel <- c(rep("Uitval", 369), rep("Geen uitval", 394))
# Randomiseer waarden
Uitval_na_leenstelsel <- Uitval_na_leenstelsel[sample.int(length(Uitval_na_leenstelsel))]

# Maak een variabele Uitval door beide te binden
Uitval <- c(Uitval_voor_leenstelsel, Uitval_na_leenstelsel)

# Maak dataset
Uitval_studenten_functiebeperking_leenstelsel <- data.frame(Studentnummer, 
                                                            Periode,
                                                            Uitval)


Tabel_uitval_functiebeperking <- table(Uitval_studenten_functiebeperking_leenstelsel$Periode, 
      Uitval_studenten_functiebeperking_leenstelsel$Uitval)



### Fisher's exact toets

# Uitgangspunt:
## Voor leenstelsel: 3 uitval, 8 niet uitval, totaal is 11
## Na leenstelsel: 7 uitval, 14 niet uitval, totaal is 21
## Totaal: 32

# Simuleer studentnummers
Studentnummers_opties <- c(4000000:4500000)
Studentnummer <- sample(Studentnummers_opties, 32)
Studentnummer <- Studentnummer[order(Studentnummer)]
Studentnummer <- as.factor(Studentnummer)

# Maak variabele Periode: voor en na leenstelsel
Periode <- c(rep("Geen leenstelsel", 11), rep("Leenstelsel", 21))

# Maak variabele uitval voor studenten voor leenstelsel
Uitval_voor_leenstelsel <- c(rep("Uitval", 3), rep("Geen uitval", 8))
# Randomiseer waarden
Uitval_voor_leenstelsel <- Uitval_voor_leenstelsel[sample.int(length(Uitval_voor_leenstelsel))]

# Maak variabele uitval voor studenten na leenstelsel
Uitval_na_leenstelsel <- c(rep("Uitval", 7), rep("Geen uitval", 14))
# Randomiseer waarden
Uitval_na_leenstelsel <- Uitval_na_leenstelsel[sample.int(length(Uitval_na_leenstelsel))]

# Maak een variabele Uitval door beide te binden
Uitval <- c(Uitval_voor_leenstelsel, Uitval_na_leenstelsel)

# Maak dataset
Fisher_Uitval_studenten_functiebeperking_leenstelsel <- data.frame(Studentnummer, 
                                                            Periode,
                                                            Uitval)


Fisher_Tabel_uitval_functiebeperking <- table(Fisher_Uitval_studenten_functiebeperking_leenstelsel$Periode, 
                                       Fisher_Uitval_studenten_functiebeperking_leenstelsel$Uitval)


rm(Periode, Studentnummer, Studentnummers_opties, Uitval, Uitval_na_leenstelsel, 
   Uitval_voor_leenstelsel)


#Geen_leenstelsel <- c(375, 496)
#Leenstelsel <- c(369, 394)
#Uitval_functiebeperking <- t(data.frame(Geen_leenstelsel, Leenstelsel))
#colnames(Uitval_functiebeperking) <- c("Uitval", "Geen uitval")

#Geen_leenstelsel_n43 <- c(8, 14)
#Leenstelsel_n43 <- c(5, 16)
#Uitval_functiebeperking_n43 <- t(data.frame(Geen_leenstelsel_n43, Leenstelsel_n43))
#colnames(Uitval_functiebeperking_n43) <- c("Uitval", "Geen uitval")