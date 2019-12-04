## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 00. Voorbereidingen.R
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
### R code voor Student Analytics Vrije Universiteit Amsterdam
## Copyright 2019 VU
## Web Page: http://www.vu.nl
## Contact: Theo Bakker (t.c.bakker@vu.nl)
## Project: Versnellingsplan - Statistisch Handboek Studiedata
##
## Doel: De working directory wordt bepaald door de locatie van het project
## De specifieke functies en libraries voor dit project worden ingeladen
##
## Afhankelijkheden: geen
##
## Datasets: geen
##
## Opmerkingen:
## 1) Draai voor het inlezen van de juiste packages eerst het bestand Installeer Packages.R
## source("Installeer Packages.R")
##
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## TODO:
## 1) Geen
##
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Geschiedenis:
## 11-09-2017: TB: Aanmaak bestand
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
## Lees packages in
source("99. Functies en Libraries/Installeer Packages.R")

## xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
## Functies om een rapport te genereren
Generate_report <- function(template_name,
                            output_file,
                            param_list,
                            see_now = FALSE) {
    if (!file.exists("00. Skeletons/Skeleton_SH.Rmd")) {
        Copy_skeleton(template_name)
    }
    output_file <- file.path(here::here(), output_file)
    rmarkdown::render(input = "00. Skeletons/Skeleton_SH.Rmd",
                      output_file = output_file,
                      params = param_list)
    if (see_now)
        browseURL(output_file)
}

Template_path <-
    function(template_name)
        file.path(
            .libPaths(),
            "reportsAsFunctions",
            "rmarkdown",
            "templates",
            template_name,
            "skeleton",
            "00. Skeletons/Skeleton_SH.Rmd"
        )

Copy_skeleton <- function(template_name) {
    p <- Template_path(template_name)
    invisible(file.copy(p, here::here()))
}

## Functie om af te ronden en te formatteren
Round_and_format <- function(x, digits = 2) {
  x <- as.character(round(x, digits))
  x <- str_replace(x, "[.]", ",")
  return(x)
}

## Functie om variabelen in een string te plaatsen
Substitute_var <- function(placeholder, list_args) {
  gsubfn(x = placeholder, env = list_args)
}

## Functie om de Header van de pagina's te maken
Get_Header <- function() {
    source(file = "03. Includes/code/Header.R")
}

## Functies om strings te trimmen
# Returns string w/o leading whitespace
trim.leading <- function(x)  sub("^\\s+", "", x)

# Returns string w/o trailing whitespace
trim.trailing <- function(x) sub("\\s+$", "", x)

# Returns string w/o leading or trailing whitespace
trim <- function(x) gsub("^\\s+|\\s+$", "", x)

## xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
## Code om een rapport te genereren

## Bepaal de lijst van blokken met codes
lCode <- c(
    "dummydata",
    "datainspectie",
    "histogram",
    "qqplot",
    "boxplot",
    "kolmogorovsmirnov",
    "shapirowilk",
    "test",
    "testinterpretatie",
    "cohensd",
    "levenestest",
    "rapportage"
)

## xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
## Maak directories voor Handboek/Toetsen/R

## Maak Toetsen/R aan als deze nog niet bestaat
if (!dir.exists("Handboek")) {
    dir.create("Handboek")
    dir.create("Handboek/Includes")
    dir.create("Handboek/Toetsen")
    dir.create("Handboek/Toetsen/R")
    print(paste0("Directory Handboek/Toetsen/R aangemaakt"))
}


