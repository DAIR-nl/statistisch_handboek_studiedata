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
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# install.packages("devtools")
# devtools::install_github("RLesur/klippy")

## Bepaal de gebruikte packages
Gebruikte_packages <- c(
    "car",
    "checkmate",
    "dplyr",
    "DescTools",
    "effsize",
    "ez",
    "exact2x2",
    "ggplot2",
    "ggridges",
    "gsubfn",
    "graphics",
    "here",
    "htmltools",
    #"klippy",
    "markdown",
    "nortest",
    "plotly",
    "purrr",
    "rapport",
    "rcompanion",
    "readxl",
    "reticulate",
    "RVAideMemoire",
    "rlist",
    "stringi",
    "stringr",
    "tidyverse"
)

## TB: Niet meer inladen
## ,"xlsx"

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
lapply(Gebruikte_packages, library, character.only = TRUE, quietly = TRUE)

# Ruim op
rm(Gebruikte_packages,
   Nieuwe_packages)
