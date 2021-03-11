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
## 04-08-2020: EG: http in https veranderd site versnellingsplan
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Toelichting: In dit script wordt de footer die onderaan de webpagina's 
## staat aangemaakt. De footer onder de webpagina's is iets minder uitgebreid
## dan de footer onder de toetspagina's, daarvan wordt de footer gemaakt
## met het script Footer.R, ook in de map SSHO/01. Includes/code . Het
## verschil tussen beide is dat bij de uitgebreidere footer de programmeertalen
## en bijbehorende versies genoemd worden. Dit script is een combinatie van R 
## code en html code.


## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 01 MAAK HTML ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Plaats  variabelen in een lijst: de root van de site
lVars <- list(
  var_Copyright = 
    paste0(
        "&copy; ",
        format(Sys.time(), '%Y') ,
        " <a href=\"https://www.versnellingsplan.nl\" target=\"_blank\">Versnellingsplan</a> - Statistisch Handboek Studiedata - ",
        "<a href=\"",sRoot,"Licentie.html\">Licentie</a> "
    )
)

## CODE voor downloaden datasets: <a href="Datasets_zipbestand" download>hier</a>
  
## Plaats deze nu in een footer; gebruik htmltools::htmlPreserve om
## HTML te behouden. Nodig om in markdown HTML te tonen.
thisFooter <- Substitute_var(htmltools::htmlPreserve('
<div id = "footerborder"><hr/></div>
<div id = "footer">
Deze pagina maakt onderdeel uit van het Statistisch Handboek Studiedata, ontwikkeld binnen de zone Veilig en betrouwbaar benutten van studiedata van het Versnellingsplan. De gesimuleerde datasets zijn <a href="`sRoot`Datasets_zipbestand" download>hier</a> te downloaden.
<br/><br/>
`var_Copyright`
</div>'), lVars)

## Toon het resultaat
writeLines(thisFooter)
