## H0 en H1 medianen of gemiddelden, ook in toepassing 
## is het wel interessant om gemiddelden te tonen? 
## link naar Mann W-U test 

RNGkind(sample.kind = "Rounding")
set.seed(8)
# 3
## 300 waarnemingen voor Vooropleiding
Seed <- sample(c(1, 2, 3, 4), 300, replace = TRUE)
Vooropleiding <-  ifelse(Seed == 1, "Rechtsgeleerdheid", 
                         ifelse(Seed == 2, "Notarieel Recht",
                                ifelse(Seed == 3, "Fiscaal Recht",
                                       ifelse(Seed == 4, "Premaster",
                                              NA))))

## 300 waarnemingen voor puntenaantallen, random gesampled uit een lijst mogelijkheden
Punten_mogelijkheden <- c(6, 12, 18, 24, 30, 36, 36, 42, 42, 42, 48, 48, 48, 48, 54, 54, 54, 60, 60, 60, 60, 60, 60)
EC_Jaar1 <- sample(Punten_mogelijkheden, 300, replace = TRUE)

Studentnummer <- sample(3000000:4000000, 300)
Resultaten_Arbeidsrecht <- data.frame(Studentnummer, Vooropleiding, EC_Jaar1)

## puntencorrectie om Fiscaal en Notarieel +6 punten te geven en Rechtsgeleerdheid -6 punten
Resultaten_Arbeidsrecht$EC_Jaar1[Vooropleiding == "Fiscaal Recht" | Vooropleiding == "Notarieel Recht"] <-
  Resultaten_Arbeidsrecht$EC_Jaar1[Vooropleiding == "Fiscaal Recht" | Vooropleiding == "Notarieel Recht"] + 6
Resultaten_Arbeidsrecht$EC_Jaar1[Vooropleiding == "Rechtsgeleerdheid"] <-
  Resultaten_Arbeidsrecht$EC_Jaar1[Vooropleiding == "Rechtsgeleerdheid"] - 6