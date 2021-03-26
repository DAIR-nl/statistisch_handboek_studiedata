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
## 04-08-2020: EG: http in https veranderd site versnellingsplan
## 10-02-2021: EG: Datasets downloaden toegevoegd
## 10-03-2021: EG: Toelichting toegevoegd
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Toelichting: In dit script wordt de footer die onderaan de toetspagina's 
## staat aangemaakt. De footer onder de toetspagina's is iets uitgebreider dan
## de footer onder de andere webpagina's, daarvan wordt de footer gemaakt
## met het script Footer_simpel.R, ook in de map SSHO/01. Includes/code . Het
## verschil tussen beide is dat bij de uitgebreidere footer de programmeertalen
## en bijbehorende versies genoemd worden. Dit script is een combinatie van R 
## code en html code.

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 01 MAAK HTML ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Plaats  variabelen in een lijst: de root van de site
lVars <- list(
  var_VersieR = paste(R.Version()$major, R.Version()$minor, sep = "."),
  var_VersiePython = "3.6.13",
  #var_zip = paste0("<a href=\"",sRoot,"Datasets_zipbestand\" download>hier</a>"),
  ##var_zip = paste0(getwd(),"/Datasets_zipbestand"),
  var_Copyright = 
    paste0(
        "&copy; ",
        format(Sys.time(), '%Y') ,
        " <a href=\"https://www.versnellingsplan.nl\" target=\"_blank\">Versnellingsplan</a> - Statistisch Handboek Studiedata - ",
        "<a href=\"",sRoot,"Licentie.html\">Licentie</a> ",
        "Laatst gewijzigd op:", format(Sys.time(), '%d-%m-%Y')
    )
)

## Plaats deze nu in een footer; gebruik htmltools::htmlPreserve om
## HTML te behouden. Nodig om in markdown HTML te tonen.
thisFooter <- Substitute_var(htmltools::htmlPreserve('
<div id = "footerborder"><hr/></div>
<div id = "footer">
Deze pagina maakt onderdeel uit van het Statistisch Handboek Studiedata, ontwikkeld binnen de zone Veilig en betrouwbaar benutten van studiedata van het Versnellingsplan. R code is uitgevoerd met R versie `var_VersieR`; Python code is uitgevoerd in Python `var_VersiePython`. De gesimuleerde datasets zijn <a href="`sRoot`Datasets_zipbestand" download>hier</a> te downloaden.
<br/><br/>
`var_Copyright`
</div>'), lVars)

## Toon het resultaat
writeLines(thisFooter)
