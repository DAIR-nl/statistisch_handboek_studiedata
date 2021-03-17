## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Controleer_consistentie_blokken.R ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R code voor het Statistisch Handboek van het Versnellingsplan
## Copyright 2021 VU
## Web Page: http://www.vu.nl
## Contact: Theo Bakker (t.c.bakker@vu.nl)
##
## Doel: Een pagina om R Markdown toetsen te testen op consistentie
##
## Afhankelijkheden: De R Markdown toetsen
##
## Datasets: Geen
##
## Opmerkingen:
## 1) Op basis van https://serialmentor.com/blog/2016/6/13/reading-and-combining-many-tidy-data-files-in-R
## 2) ___
##
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Geschiedenis:
## 26-01-2020: TB: Aanmaak bestand
## 16-03-2021: EG: Toelichting toegevoegd
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Toelichting: Dit bestand onderzoekt of er blokken zijn gemaakt waarvan de naam
## niet compleet gedefinieerd is. Elk blok wordt eerst geopend en daarna gesloten.
## In dit script wordt voor alle toetspagina's gecheckt of er blokken zijn waarbij
## de opening of de sluiting ontbreekt. Deze worden met bijbehorende toetspagina
## en regelnummer opgeslagen in een dataframe. Op deze manier kunnen alle
## toetspagina's hierop gecontroleerd worden. Het is handig om dit eens in de
## zoveel tijd te checken.

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 00 VOORBEREIDINGEN ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Installeer packages en functies
source("99. Functies en Libraries/00. Voorbereidingen.R")

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 01 AANVULLENDE FUNCTIES ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Verwerk codeblokken 
sRegEx <- "## [/]{0,1}[A-Z]{4,6}BLOK"

#Bestandsnaam <- "04. Python chunks/01 One sample t-toets-TEST py.Rmd"

## Functie om Blokken te vinden die geen paar zijn
Bepaal_code_wezen <- function(Bestandsnaam) {
  
  ## Lees het bestand in, maak er een df van,
  ## Voeg kolomnaam en regelnummers toe
  file          <- readLines(con = Bestandsnaam, warn = F)
  dfFile        <- as.data.frame(matrix(file, ncol = 1, byrow = TRUE), 
                                 stringsAsFactors = FALSE)
  names(dfFile) <- c("Tekst")
  dfFile        <- tibble::rownames_to_column(dfFile, "Regelnummer")
  
  ## Behoud vervolgens alleen rijen met BLOK die maar 1x voorkomen
  dfFile <- dfFile %>%
    filter(grepl(sRegEx, Tekst)) %>%
    mutate(Toets = Bestandsnaam) %>%
    mutate(Tekst = str_remove(Tekst, "<!-- ##[ ]{0,1}[/]{0,1}"),
           Tekst = str_remove(Tekst, "[ ]{0,1}-->")) %>%
    mutate(Tekst = trim(Tekst)) %>%
    group_by(Tekst) %>%
    mutate(Dubbel = n() > 1) %>%
    filter(Dubbel == F) %>%
    ungroup() %>%
    select(Toets, Regelnummer, Tekst, Dubbel)
}
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 02 BEPAAL DE FOUTEN DIE VOORKOMEN IN R EN PYTHON ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Bepaal de Python chunk bestanden
Bestanden <- dir(path = "04. Python chunks", 
             pattern = "*.Rmd",
             full.names = TRUE)

## Maak een dataset met fouten in Python chunk bestanden
dfFouten_Python_chunks <- Bestanden %>%
  map(Bepaal_code_wezen) %>%    
  reduce(rbind)

## Bepaal de R bestanden
Bestanden <- dir(path = "R", 
             pattern = "*.Rmd",
             full.names = TRUE)

## Maak een dataset met fouten in R bestanden
dfFouten_R <- Bestanden %>%
  map(Bepaal_code_wezen) %>%    
  reduce(rbind)

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 02 RUIM OP ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
rm(Bestanden, sRegEx, Bepaal_code_wezen, dfFouten_Python_chunks, dfFouten_R)
