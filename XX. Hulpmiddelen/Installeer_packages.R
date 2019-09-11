## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Installeer Packages.R
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R code voor Student Analytics Vrije Universiteit Amsterdam
## Copyright 2019 VU
## Web Page: http://www.vu.nl
## Contact: Theo Bakker (t.c.bakker@vu.nl)
## Verspreiding buiten de VU: Ja
##
## Doel: In dit script worden alle benodigde packages geinstalleerd als ze nog
## niet geinstalleerd zijn, vervolgens worden deze ingeladen.
##
## Afhankelijkheden: Geen
##
## Datasets: Geen
##
## Opmerkingen:
## 1) Geen
##
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## TODO:
## 1) Geen
##
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Geschiedenis:
## 03-05-2017: JvZ: Aanmaak bestand
## 03-05-2017: TB: Toevoegen van httr
## 04-05-2017: TB: plyr moet voor dplyr geladen worden; de melding
## data.table + dplyr code now lives in dtplyr verschijnt nog.
## 05-05-2017: TB: Aangevuld met alle packages die genoemd worden in het project
## door te zoeken op library() & compareGroups
## 23-05-2017: JvZ: Package lubridate stond twee keer in de lijst. één verwijderd
## 02-06-2017: JS: Package survival (nodig voor Hmisc) gaf foutmelding. Survival toegevoegd
## 21-06-2017: JvZ: Packag pbapply toegevoegd om apply functies met een progress-bar
## te kunnen verrijken.
## 08-07-2017: TB: Package Metrics toegevoegd voor een aantal standaard evaluatie functies
## 09-07-2017: TB: Package caTools voor het tonen van de ROC
## 17-07-2017: TB: Package stringi ivm lege kolomnamen
## 03-08-2017: JvZ: Package janitor toegevoegd om ingelezen data op te schonen
## 04-08-2017: JvZ: Package forcats toegevoegd om met factoren te kunnen werken
## 07-08-2017: JvZ: Package stringdist toegevoegd om te bekijken hoeveel strings
## op elkaar lijken
## 15-09-2017: JS: Purrr package toegevoegd
## 19-09-2017: JvZ: Devtools toegevoegd
## 28-09-2017: JvZ: VUStudentAnalytics toegevoegd
## 18-12-2017: JS: Caret package verplaatst van Overige_packages naar Packages_stap_123
## 23-02-2017: TB: testthat package toegevoegd aan Overige_packages
## 11-03-2018: TB: testthat en checkmate toegevoegd aan Packages_stap_123,
## testthat verwijderd van Overige_packages
## 30-03-2018: TB: Vanaf R 3.0 worden rpanel en tcltk standaard in R meegeleverd,
## en hoeven daarom niet geinstalleerd te worden.
## 13-08-2018: KP: readODS toegevoegd
## 27-08-2018: TB: ReporteRs verwijderd
## 28-09-2018: JvZ: Manier waarop vusa wordt geinstalleerd veranderd
## 10-04-2019: DK: stringi, foreign, pbapply, sqldf van stap123 naar overig
## 25-04-2019: DK: data.table, reshape en spam van stap123 naar overig
## 02-05-2019: DK: In alle scripts worden nu standaard aleen de basis_packages
## ingelezen. De uitgebreide packages worden ingeladen als dit wordt meegegeven
## 17-07-2019: DK: Forcats naar Uitgebreid_packages, bechrijving bij de basis_packages
## 26-07-2019: TB: Else statement toegevoegd omdat anders gebruikte packages niet bekend is.

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Basis_packages <- c(
    "caret",          ## Gebruikt om regressies en classifiers te modelleren.
    "checkmate",      ## Gebruikt voor de assertions tests.
    "crayon",          ## Gebruikt om kleur mee te geven aan berichten in de console
    "digest",         ## Gebruikt voor het hashen van variabelen
    "devtools",       ## Gebruikt om te installeren via Github.
    "gridExtra",      ## Gebruikt om meerdere graphical objects in een tabel te plaatsen.
    "fillr",          ## Gebruikt om missende waarden op te vullen.
    "haven",          ## Gebruikt voor importeren van SPSS, STATA en SAS bestanden.
    "httr",           ## Gebruikt om met HTTP te werken.
    "janitor",        ## Gebruikt om namen op te schonen van speciale tekens.
    "lubridate",      ## Gebruikt om te werken met data en tijden.
    "maptools",       ## Gebruikt om polygon shapefile in te lezen.
    "purrr",          ## Gebruikt om met functies and vectoren te werken.
    "furrr",          ## Gebruikt om functies van purrr met meerdere processoren uit te voeren.
    "readODS",        ## Gebruikt om ODS (OpenDocument Speadsheet) in te lezen.
    "readr",          ## Gebruikt om data (csv, tsv, and fwf) in te lezen.
    "vroom",          ## Gebruikt om data (csv) sneller in te lezen.
    "readxl",         ## Gebruikt om excel (.xls and .xlsx) bestanden in te lezen.
    "rvest",          ## Gebruikt om met HTML te werken.
    "slackr",         ## Gebruikt voor het sturen van berichten in Slack.
    "sp",             ## Gebruikt voor het bewerken van dataframes.
    "stats",          ## Gebruikt voor statisctische functies en berekeningen.
    "stringdist",     ## Gebruikt voor het vinden van (deels) overeenkomstige strings.
    "stringr",        ## Gebruikt voor functies om met strings te werken.
    "testthat",       ## Gebruikt voor het testen in de assertions.
    "tibble",         ## Gebruikt voor bewerken en aanmaken van tibbles.
    "tidyr",          ## Gebruikt om data op te schonen in de tidverse omgeving.
    "utils",          ## Gebruikt voor utility functies
    "dplyr",          ## Gebruikt voor de dplyr omgeving.
    "fst"             ## Gebruikt om bewerkingen te doen met grote data bestanden.
)

Uitgebreid_packages <- c(
    "AUC",
    "bookdown",
    "caTools",
    "cellranger",
    "compare",
    "compareGroups",
    "corrplot",
    "data.table",
    "dtplyr",
    "e1071",
    "fields",
    "forcats",
    "foreign",
    "gdata",
    "GenKern",
    "ggplot2",
    "gmodels",
    "graphics",
    "grDevices",
    "gsubfn",
    "hexbin",
    "Hmisc",
    "irlba",
    "knitr",
    "kohonen",
    "L1pack",
    "lattice",
    "magrittr",
    "Matrix",
    "Metrics",
    "mgcv",
    "micEcon",
    "openxlsx",
    "parallel",
    "pastecs",
    "pbapply",
    "psych",
    "randomForest",
    "RColorBrewer",
    "RCurl",
    "reshape",
    "rgdal",
    "RJSONIO",
    "ROCR",
    "rpart",
    "scales",
    "spam",
    "sqldf",
    "stringi",
    "survival",
    "WriteXLS",
    "zoo"
)

## Als Package_selectie == "Uitgebreid" dan wordt alleen de uitgebreide lijst met
## packages ingelezen
if (exists("Package_selectie")) {
    if (Package_selectie == "Uitgebreid") {
        Gebruikte_packages <- c(Basis_packages, Uitgebreid_packages)
    } else {
        Gebruikte_packages <- Basis_packages
    }
} else {
    Gebruikte_packages <- Basis_packages
}

# Installeer alleen de packages die nog niet geinstalleerd zijn.
Nieuwe_packages <-
    Gebruikte_packages[!(Gebruikte_packages %in% installed.packages()[, "Package"])]
if (length(Nieuwe_packages) > 0) {
    install.packages(Nieuwe_packages,
                     dependencies = TRUE,
                     ## Geef de repository op, zodat installatie van packages ook
                     ## buiten rstudio werkt
                     repos = "https://cloud.r-project.org/")
}


# Laad de packages in de library
lapply(Gebruikte_packages, library, character.only = TRUE)

## xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
## Package vusa

## Installeer vusa package als dat nodig is.
source("99. Functies & Libraries/Installeer vusa package.R", local = F)

## Laad het package vusa in het geheugen.
library(vusa)

# Ruim op
rm(Gebruikte_packages,
   Nieuwe_packages,
   Uitgebreid_packages,
   Basis_packages)
