## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 00. Voorbereidingen.R
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
### R code voor het Statistisch Handboek van het Versnellingsplan
## Copyright 2020 VU
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
## 11-01-2020: TB: Aanpassing code; directory Handboek wordt niet meer aangemaakt
## 12-03-2021: EG: Toelichting toegevoegd
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Toelichting: In dit script worden alle benodigde voorbereidingen gedaan voor
## het schrijven van toetspagina's. De packages worden ingeladen en de
## zelfgeschreven functies die nodig zijn ook. Dit script wordt gerund aan het
## begin van de meeste scripten in deze repository.

## xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
## Lees packages in
source(paste0(here::here(),"/99. Functies en Libraries/Installeer Packages.R"))

## xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
## Functie om af te ronden en te formatteren. Zorgt ervoor dat decimaalteken 
## punt in een komma veranderd en rond af. Afronding is automatisch op twee
## decimalen, maar dit kan handmatig veranderd worden.
Round_and_format <- function(x, digits = 2) {
  x <- as.character(round(x, digits))
  x <- str_replace(x, "[.]", ",")
  return(x)
}

## Zelfde functie, maar dan voor afronding op 0 decimalen
Round_and_format_0decimals <- function(x, digits = 0) {
  x <- as.character(round(x, digits))
  x <- str_replace(x, "[.]", ",")
  return(x)
}

## Functie om variabelen in een string te plaatsen
Substitute_var <- function(placeholder, list_args) {
  gsubfn(x = placeholder, env = list_args)
}

## Functies om strings te trimmen
## Returns string w/o leading whitespace
trim.leading <- function(x)  sub("^\\s+", "", x)

## Returns string w/o trailing whitespace
trim.trailing <- function(x) sub("\\s+$", "", x)

## Returns string w/o leading or trailing whitespace
trim <- function(x) gsub("^\\s+|\\s+$", "", x)

## ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
## Test dat de index_code.R van deze toets bestaat
Test_index_code_bestaat <- function(toets) {

    ## Vervang spaties met -
    toets <- str_replace_all(toets, "[ ]", "-")

    ## Bepaal het pad en voer assertion uit
    index_code <- paste0("01. Code/Index_code_", toets ,".R")
    return(file.exists(index_code))
}

## Functie die bestanden doorzoekt naar tekst met een bepaald patroon
## en deze teruggeeft in een lijst
Zoek_en_bewaar_code <- function(toets, code){

    ## Vervang spaties met -
    toets <- str_replace_all(toets, "[ ]", "-")

    ## Bepaal de output directory
    output_dir <- paste0("01. Code/", toets)

    ## Controleer of de index voor deze toets bestaat; zo niet return
    index_code <- paste0("01. Code/Index_code_", toets , ".R")
    if (!file.exists(index_code)) {
        print(paste(index_code, "bestaat niet"))
        stopifnot(!file.exists(index_code))
    } else {

        ## Bepaal de regelnummers
        lRegelnummers <- grep(paste0("## [/]{0,1}BLOK: ", toets ,"-", code, ".R"),
                              readLines(paste0("01. Code/Index_code_", toets ,".R")))
        #print(paste(lRegelnummers, toets, code))

        ## Lees het bestand in en knip de betreffende code eruit
        if (length(lRegelnummers) == 2) {
            thisFile      <- readLines(paste0("01. Code/Index_code_", toets ,".R"))
            nStartpositie <- lRegelnummers[1] + 1
            nEindpositie  <- lRegelnummers[2] - 1
            thisCode      <- thisFile[nStartpositie:nEindpositie]

            ## Bewaar de code
            write(thisCode, file = paste0(output_dir,"/", toets,"-", code, ".R"))
        } else {
            print(paste("Geen code gevonden voor", toets, "en", code))
        }
        if (i == lCode[length(lCode)]) {
            print(paste(toets, "gereed"))
        }

    }
}

## ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
## Assert dat de index_code.R van deze toets bestaat
Assert_index_code_bestaat <- function(toets, Collection_Code) {

    ## Vervang spaties met -
    toets <- str_replace_all(toets, "[ ]", "-")

    ## Bepaal het pad en voer assertion uit
    index_code <- paste0("01. Code/Index_code_", toets ,".R")
    assert_file_exists(index_code,
                       add = Collection_Code,
                       .var.name = toets)
}

## Assert code of blokken bestaan en niet vaker dan 2x voorkomen
Assert_codeblokken_bestaan <- function(toets, Collection_Code) {

    ## Vervang spaties met -
    toets <- str_replace_all(toets, "[ ]", "-")

    ## Bepaal het patroon en de tekst
    pattern      <- paste0("## [/]{0,1}BLOK: ", toets ,"-.*.R")
    text         <- readLines(paste0("01. Code/Index_code_", toets ,".R"))

    ## Maak een lijst van codeblokken, verwijder /, zodat elementen gelijk worden
    ## en bepaal dan of er unieke elementen zijn; zo ja, dan is daar een wees -
    ## een naam van een blok fout.
    lCodeblokken <- na.omit(str_match(text, pattern))[,1]
    lCodeblokken <- gsub("/","",lCodeblokken)
    lCodeblokken_singles <- lCodeblokken[which(!(duplicated(lCodeblokken) | duplicated(lCodeblokken, fromLast = TRUE)))]

    ## Als er wezen zijn, toon deze dan in de collectie
    if (length(lCodeblokken_singles)) {
        Collection_Code$push(paste("Geen code gevonden voor", toets, "en", lCodeblokken_singles))
    }

    ## Tel het aantal keren dat een codeblok voorkomt; als het > 2x is geef dan
    ## een assertion
    dfAantallen            <- table(lCodeblokken)
    lCodeblokken_multiples <- names(dfAantallen)[dfAantallen > 2]

    # Als er blokken zijn > 2x, toon deze dan in de collectie
    if (length(lCodeblokken_multiples)) {
        Collection_Code$push(paste("Dubbele codeblokken gevonden voor", toets, "en", unique(lCodeblokken_multiples)))
    }

}
## ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


