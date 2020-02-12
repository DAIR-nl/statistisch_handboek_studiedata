## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Status.R ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R code voor het Statistisch Handboek van het Versnellingsplan
## Copyright 2020 VU
## Web Page: http://www.vu.nl
## Contact: Theo Bakker (t.c.bakker@vu.nl)
##
## Doel: De stauts van een pagina; als de review van een pagina nog niet is afgerond,
## toon dan onderstaande regel.
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
## 12-02-2020: TB: Aanmaak voorwaardelijkheid
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 01 MAAK HTML ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Controleer of bStatus bestaat; zo niet, maak deze dan aan met default 0
if (!exists("bStatus")) {
  bStatus <- 0
}

## Plaats deze nu in een header; gebruik htmltools::htmlPreserve om
## HTML te behouden. Nodig om in markdown HTML te tonen.
if (bStatus == 0) {
thisStatus <- htmltools::htmlPreserve('
   <div class="concept">NB Het peer review proces voor deze toets is nog niet afgerond; daarom is deze pagina nog in concept.</div>')
} 
## Toon het resultaat
if (bStatus == 0) {
writeLines(thisStatus)
}
