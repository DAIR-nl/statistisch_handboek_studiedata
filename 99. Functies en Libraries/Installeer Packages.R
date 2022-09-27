## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Installeer Packages.R
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
### R code voor het Statistisch Handboek van het Versnellingsplan
## Copyright 2020 VU
## Web Page: http://www.vu.nl
## Contact: Theo Bakker (t.c.bakker@vu.nl)
## Project: Versnellingsplan - Statistisch Handboek Studiedata
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
## 11-09-2019: TB: Aanmaak bestand
## 29-09-2019: TB: Klippy toegevoegd
## 12-03-2021: EG: Toelichting toegevoegd
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Toelichting: In dit script worden alle packages die gebruikt worden in het
## Statistisch Handboek geïnstalleerd en ingeladen. Als er nieuwe packages
## gebruikt worden in een nieuwe toetspagina, voeg die dan toe aan de lijst.
## Noteer ook achter het package in een comment het nummer van de toetspagina
## waarin de package gebruikt wordt, dat is handig voor de administratie. Soms
## kan het voorkomen dat een bepaald package na een ander package moet staan in
## de lijst, omdat bepaalde functies hetzelfde zijn. Het ene overschrijft dan
## het andere, wat voor errors kan zorgen als de volgorde verkeerd is.

## Bepaal de gebruikte packages. Update deze lijst als er nieuwe packages
## gebruikt worden en noteer in een comment het nummer van de toetspagina
Gebruikte_packages <- c(
    "brms",
    "car",
    "checkmate",
    "dplyr",
    "effsize", # misschien niet meer nodig door lsr
    "emmeans", # 31
    "exact2x2", # 12, en misschien andere pagina's
    "ez",
    "fmsb", # 41
    "DescTools", # moet na package fmsb omdat functie VIF() overlapt
    "ggplot2",
    "ggridges",
    "gsubfn",
    "graphics",
    "here",
    "htmltools",
    "irr",
    #"klippy",
    "lsr",
    "markdown",
    "nortest",
    "performance", # 47
    "plotly",
    "pROC",
    "purrr",
    "QuantPsyc", # 28
    "rapport",
    "rcompanion",
    "readxl",
    "reticulate",
    "reshape", # 58
    "rstatix", # 29
    "RVAideMemoire", # let op, deze moet misschien apart gedownload worden via Bioconductor
    "rlist",
    "stringi",
    "stringr",
    # "userfriendlyscience", # 29
    "rosetta", # is verwijderd van cran.
    "summarytools", # 29, LET OP: laad deze na package userfriendlyscience
    "VGAM", # 53
    "lmtest", # 41, 47, 53 let op, na VGAM package
    "schoRsch", # 41
    "mclogit" # 47
)

## Installeer rosetta vanaf de microsoft cran
## Rosetta is namelijk niet meer op cran beschikbaar.
if (!require("rosetta", quietly = TRUE)) {
    install.packages(
        "rosetta",
        repos=unique(c(
            getOption("repos"),
            repos="https://cran.microsoft.com/snapshot/2022-07-01/")))
}

## Installeer alleen de packages die nog niet geinstalleerd zijn.
Nieuwe_packages <-
    Gebruikte_packages[!(Gebruikte_packages %in% installed.packages()[, "Package"])]
if (length(Nieuwe_packages) > 0) {
    install.packages(Nieuwe_packages,
                     dependencies = TRUE,
                     ## Geef de repository op, zodat installatie van packages ook
                     ## buiten rstudio werkt
                     repos = "https://cloud.r-project.org/")
}

## Laad de packages in de library
lapply(Gebruikte_packages, library, character.only = TRUE, quietly = TRUE)

# Ruim op
rm(Gebruikte_packages,
   Nieuwe_packages)
