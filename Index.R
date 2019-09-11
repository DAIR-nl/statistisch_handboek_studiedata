## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Index.R
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R code voor Student Analytics Vrije Universiteit Amsterdam
## Copyright 2019 VU
## Web Page: http://www.vu.nl
## Contact: Theo Bakker (t.c.bakker@vu.nl)
## Project: Versnellingsagenda - Statistisch Handboek HO
##
## Doel: Index bestand voor het uitvoeren van statistische toetsen
##
## Afhankelijkheden: Geen
##
## Datasets: Geen
##
## Opmerkingen: 
## 1) Geen.
## 2) ___
##
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Geschiedenis:
## 26-07-2019: TB: Aanmaak bestand
## 06-09-2019: MK: Opvulling bestand
## 10-09-2019: TB: Review op opzet
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## TB: Gebruik geen diacritische tekens aangezien daarmee de encodig van de pagina verandert
## De hoofdstructuur is:
## Vooraf: vaststellen van de working directory, inlezen van functies en het aanmaken
## van directories
## 1) Voer voorbereidingen uit
## 2) Definiëer tekstblocks (Irene)
## 3) Definiëer codeblocks (Megiel)
## 4) Definiëer css blocks (Megiel)
## 3) Render Markdown
## 4) Sluit af en ruim op

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 01 VOORBEREIDINGEN ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## TB: Begin zinnen met een hoofdletter
## installeer en laad benodigde packages: zie script XX. Hulpmiddelen/Installeer_packages.R
## TB: Deze code omschrijven naar een lijst van packages en een functie
## en aanroepen vanuit een bestand.
## TB: Wat is de logica achter de volgorde van deze packages?
if (!require("stringr")) install.packages("stringr")
library("stringr")
if (!require("rlist")) install.packages("rlist")
library("rlist")
if (!require("car")) install.packages("car")
library("car")
if (!require("nortest")) install.packages("nortest")
library("nortest")
if (!require("dplyr")) install.packages("dplyr")
library("dplyr")
if (!require("effsize")) install.packages("effsize")
library("effsize")
if (!require("ggplot2")) install.packages("ggplot2")
library("ggplot2")
if (!require("plotly")) install.packages("plotly")
library("plotly")
if (!require("tidyverse")) install.packages("tidyverse")
library("tidyverse")
if (!require("ggridges")) install.packages("ggridges")
library("ggridges")
if (!require("graphics")) install.packages("graphics")
library("graphics")
if (!require("rapport")) install.packages("rapport")
library("rapport")

## _____________________________________________________________________________
## Bepaal de working directory

## Bewaar de huidige working directory 
## en zet deze daarna om naar de XX Test folder
if (!exists("wd_Origineel")) {
  wd_Origineel <- getwd()
  setwd("XX. Test/")
}

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 02 DEFINIEER HEADER ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## TITELS
lTitels    <- c("One sample t-toets")
sCopyright <- "© 2019, SURF Versnellingsagenda - Statistisch Handboek Hoger Onderwijs"
sVersie    <- "0.4"
sTheme     <- "united"
sToc       <- "yes"
sToc_float <- "yes"

## KOPPEN
lOnderdelen <- c(
  "Toepassing test",
  "Onderwijscasus",
  "Assumpties",
  "Uitvoering in R",
  "Rapportage",
  "Noten"
)

## Loop over lOnderdelen en maak op basis hiervan de Koppen
lKoppen <- vector()
n <- 0
for (i in lOnderdelen) {
  n <- n + 1
  lKoppen <- c(lKoppen, paste0("## ", n , " ", i))
}

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 03 DEFINIEER CODEBLOCKS ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 04 DEFINIEER TEKSTEN ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## _____________________________________________________________________________
## 1 Toepassing
lText.1.Toepassing <- "De *one sample t-toets* wordt gebruikt om aan de hand van één steekproef het gemiddelde van de totale populatie te vergelijken met een vooraf opgestelde hypothese [^1]. "

## _____________________________________________________________________________
## 2 Onderwijscasus
lText.2.Onderwijscasus <- "De opleidingsdirecteur van de opleiding Werktuigbouwkunde wil weten of het gemiddelde eindexamencijfer voor de exacte vakken (Wiskunde, Natuurkunde en Scheikunde; WNS) van vwo studenten hoger is dan het landelijk gemiddelde (6,8)[^2]. Zo kan zij bepalen of het curriculum van de inleidende vakken genoeg aansluit bij eerstejaars studenten met een vwo vooropleiding.

H~0~: Het gemiddelde eindexamencijfer voor de exacte vakken van vwo studenten die beginnen aan de Bachelor Werktuigbouwkunde is lager dan of gelijk aan het landelijk gemiddelde: µ = 6,8. 

H~A~: Het gemiddelde eindexamencijfer voor de exacte vakken van vwo studenten die beginnen aan de Bachelor Werktuigbouwkunde is hoger dan het landelijk gemiddelde: µ ≠ 6,8. "

## _____________________________________________________________________________
## 3 Assumpties
lText.3.Assumpties <- "### 3.1 Normaliteit 
De t-toets gaat ervan uit dat de data normaal verdeeld is. Controleer deze assumptie met de volgende stappen:  
1. Controleer de data visueel met een histogram, een boxplot of een Q-Q plot.   
2. Toets of de data normaal verdeeld is met de *Kolmogorov-Smirnov test* of bij een kleinere steekproef (n < 50[^3]) met de *Shapiro-Wilk test* [^4].  
3. Als blijkt dat de data niet normaal verdeeld is, transformeer de data en kijk daarna of het normaal verdeeld is.

Als er geen sprake is van normaliteit, gebruik de *Wilcoxon Signed Rank Test* [^5].
"

## _____________________________________________________________________________
## 4 Uitvoering

lText.4.Uitvoering <- "Er zijn twee dummy datasets `Gemiddeld_cijfer_WNS` en `Gemiddeld_cijfer_WNS_n30` ingeladen met de gemiddelde eindexamencijfers van WNS van eerstejaars Werktuigbouwkunde (uit Studielink). Het eerste bestand bevat 122 middelbare scholierenstudenten en het tweede bevat 30 studenten."

## _____________________________________________________________________________
## 4.1 Uitvoering: Assumpties

lText.4.1.1.Uitvoering <- "### 4.1 Test assumpties: normaliteit"
lText.4.1.2.Uitvoering <- "Bekijk de data via `mean()`, `sd()`."
lText.4.1.3.Uitvoering <- "Geef normaliteit visueel weer met een histogram, boxplot of Q-Q plot. "

## _____________________________________________________________________________
## 4.2 Uitvoering: Toets
lText.4.2.1.Toets <- "### 4.2 One sample t-toets
Gebruik `t.test()`om een t-toets uit te voeren. Geef het gemiddelde waarmee wordt vergeleken en specifieer welke alternatieve hypothese er getoetst wordt. In de praktijk wordt meestal tweezijdig getoetst[^6]. "
lText.4.2.2.Toets <- "* Het gemiddelde van de steekproef is 7,08  
* Vrijheidsgraden, *df* = *n* -1 = 122-1 = 121  
* p-waarde < 0,05, dus de H~0~ wordt verworpen en de H~A~ wordt aangenomen
* *t* (121) = 3,76, *p* < 0,01
* 95%-betrouwbaarheidsinterval: bij het herhalen van het onderzoek zal in 95% van de gevallen de µ in het interval vallen. In deze casus is het interval tussen 6,96 en 7,23. "
lText.5.Rapportage <- "De *one sample t-toets* is uitgevoerd om te toetsen of het gemiddelde eindexamencijfer voor de exacte vakken van vwo studenten die Werktuigbouwkunde zijn gaan studeren, hoger is dan het landelijk gemiddelde. Het gemiddelde van de steekproef (*M* = 7,08, *SD* = 0,8) is significant hoger dan het landelijk gemiddelde van 6,8, *t* (121) = 3,76, *p* < 0,01. 

De resultaten ondersteunen de conclusie dat het gemiddelde eindexamencijfer voor de exacte vakken hoger ligt voor studenten Werktuigbouwkunde met een vwo vooropleiding, dan het landelijk gemiddelde."
lText.6.Noten <- "[^1]: van Geloven, N. (25 mei 2016). T-toets [Wiki Statistiek Academisch Medisch Centrum]. https://wikistatistiek.amc.nl/index.php/T-toets#one_sample_t-toets
[^2]: Centraal Instituut voor Toetsontwikkeling (2018). Examenverslag 2018. https://www.cito.nl/onderwijs/voortgezet-onderwijs/centrale-examens-voortgezet-onderwijs/tools-en-informatie-voor-docenten/examenverslagen/examenverslag-2018
[^3]: Laerd statistics. (2018). Testing for Normality using SPSS Statistics. https://statistics.laerd.com/spss-tutorials/testing-for-normality-using-spss-statistics.php  
[^4]: Normaliteit. (14 juli 2014). [UvA Wiki Methodologiewinkel]. https://wiki.uva.nl/methodologiewinkel/index.php/Normaliteit  
[^5]: Prabhakaran, S. (2016-2017). Statistical Tests [r-statistics.co]. http://r-statistics.co/Statistical-Tests-in-R.html  
[^6]: Knottnerus, J. A., & Bouter, L. M. (2001). The ethics of sample size: Two-sided testing and one-sided thinking. *Journal of Clinical Epidemiology, 54*(2), 109-110."


## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 05 RENDER MARKDOWN ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Render het bestand
rmarkdown::render("../02. Markdown/01 One sample t-toets_TB.Rmd")

## TB: licht toe wat je hier precies doet; gebruik magrittr pipes
## TB: volg de naamconventies; zie hiervoor de stijlgids
toetsenlijst <- list.files(path = "02. Markdown/")
# toetsenlijst <- sapply("02. Markdown", paste, toetsenlijst,  sep = "/")
# toetsenlijst <- toetsenlijst[-1] ## TB: waarom -1?
# html_indices <- grep(".html", toetsenlijst)
# html_paginas <- toetsenlijst[html_indices]
# toetsenlijst <- toetsenlijst[-html_indices]
# 
# sapply(html_paginas, file.remove)
# sapply(toetsenlijst, render)
  
## als je 1 specifieke pagina wil renderen gebruik je in de console `render(toetsenlijst[toetsnummer]`.

## Zet de working directory terug naar het origineel
if (exists("wd_Origineel")) {
  setwd(wd_Origineel)
}

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 06 RUIM OP ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


