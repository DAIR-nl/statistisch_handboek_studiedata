## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Status.R ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R code voor het Statistisch Handboek van het Versnellingsplan
## Copyright 2020 VU
## Web Page: http://www.vu.nl
## Contact: Theo Bakker (t.c.bakker@vu.nl)
##
## Doel: De stauts van een pagina
##
## Afhankelijkheden: htmltools package
##
## Datasets: Geen
##
## Opmerkingen:
## 1) Geen.
## 2) ___
##
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Geschiedenis:
## 06-02-2020: TB: Aanmaak bestand
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 01 MAAK HTML ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Controleer of Substitute_var bestaat; zo niet, sluit dan het voorbereidingen
## script in.
# if (!exists("Substitute_var")) {
#   ## Installeer packages en functies
#   source(paste0(here::here(), "/99. Functies en Libraries/00. Voorbereidingen.R"), echo = FALSE)
# }

## Plaats  variabelen in een lijst: de root van de site
lVars <- list(
  sRoot = paste0(here::here(),"/_site")
)

## Plaats deze nu in een header; gebruik htmltools::htmlPreserve om
## HTML te behouden. Nodig om in markdown HTML te tonen.
thisStatus <- Substitute_var(htmltools::htmlPreserve('
   <div class="concept">NB Het peer review proces voor deze toets is nog niet afgerond; daarom is deze pagina nog in concept.</div>'), lVars)

## Toon het resultaat
writeLines(thisStatus)
