## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Footer_simpel.R ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R code voor het Statistisch Handboek van het Versnellingsplan
## Copyright 2020 VU
## Web Page: http://www.vu.nl
## Contact: Theo Bakker (t.c.bakker@vu.nl)
##
## Doel: De footer voor de website voor de basispagina's
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
## 08-02-2020: TB: Aanmaak bestand
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 01 MAAK HTML ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Plaats  variabelen in een lijst: de root van de site
lVars <- list(
  var_Copyright = 
    paste0(
        "&copy; ",
        format(Sys.time(), '%Y') ,
        " <a href=\"http://www.versnellingsplan.nl\" target=\"_blank\">Versnellingsplan</a> - Statistisch Handboek Studiedata - ",
        "<a href=\"",sRoot,"Licentie.html\">Licentie</a> "
    )
)

## Plaats deze nu in een footer; gebruik htmltools::htmlPreserve om
## HTML te behouden. Nodig om in markdown HTML te tonen.
thisFooter <- Substitute_var(htmltools::htmlPreserve('
<div id = "footerborder"><hr/></div>
<div id = "footer">
Deze pagina maakt onderdeel uit van het Statistisch Handboek Studiedata, ontwikkeld binnen de zone Veilig en betrouwbaar benutten van studiedata van het Versnellingsplan. 
<br/><br/>
`var_Copyright`
</div>'), lVars)

## Toon het resultaat
writeLines(thisFooter)
