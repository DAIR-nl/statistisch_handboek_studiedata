## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Footer.R ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R code voor het Statistisch Handboek van het Versnellingsplan
## Copyright 2020 VU
## Web Page: http://www.vu.nl
## Contact: Theo Bakker (t.c.bakker@vu.nl)
##
## Doel: De footer voor de website
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
## 29-09-2019: TB: Aanmaak bestand
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 01 MAAK HTML ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Plaats  variabelen in een lijst: de root van de site
lVars <- list(
  var_VersieR = paste(R.Version()$major, R.Version()$minor, sep = "."),
  var_Copyright = 
    paste(
        "&copy;",
        format(Sys.time(), '%Y') ,
        "SURF Versnellingsplan - Statistisch Handboek Studiedata.",
        "Deze pagina is voor het laatst gewijzigd op:", format(Sys.time(), '%d-%m-%Y')
    )
)

## Plaats deze nu in een footer; gebruik htmltools::htmlPreserve om
## HTML te behouden. Nodig om in markdown HTML te tonen.
thisFooter <- Substitute_var(htmltools::htmlPreserve('
<div id = "footer">
Deze pagina maakt onderdeel uit van het Statistisch Handboek Studiedata, ontwikkeld binnen de zone Veilig en betrouwbaar benutten van studiedata van het Versnellingsplan. De code is uitgevoerd met R versie `var_VersieR`.
<br/><br/>
`var_Copyright`
</div>'), lVars)

## Toon het resultaat
writeLines(thisFooter)
