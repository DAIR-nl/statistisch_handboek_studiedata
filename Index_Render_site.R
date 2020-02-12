## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Index_Render_site.R ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R code voor het Statistisch Handboek van het Versnellingsplan
## Copyright 2019 VU
## Web Page: http://www.vu.nl
## Contact: Theo Bakker (t.c.bakker@vu.nl)
##
## Doel: Een pagina om de website te maken
##
## Afhankelijkheden: De gegenereerde HTML
##
## Datasets: Geen
##
## Opmerkingen:
## 1) Geen.
## 2) ___
##
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Geschiedenis:
## 21-09-2019: TB: Aanmaak bestand
## 04-12-2019: TB: Toevoeging aan statistisch_handboek_ho files
## 06-02-2020: TB: Aanpassing zodat subfolder meegenomen worden
## 12-02-2020: TB: Controle consistentie namen + Review kolommen
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 00 VOORBEREIDINGEN ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Installeer packages en functies
source("99. Functies en Libraries/00. Voorbereidingen.R")

library("rmarkdown")

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 01 BEPAAL WELKE TOETSEN GEMAAKT MOETEN WORDEN ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Bepaal de lijst van toetsen; wijzig 0 in 1 om in gebruik te nemen
dfToetsen <- tribble(
    ~Toets,                                            ~InGebruik_R, ~Review_R, ~InGebruik_Python, ~Review_Python,
    "01 One sample t-toets",                           "1",          "1",       "1",               "1",       
    "02 Gepaarde t-toets",                             "1",          "0",       "1",               "0",       
    "03 Ongepaarde t-toets",                           "1",          "0",       "1",               "0",       
    "04 Linear mixed model",                           "0",          "0",       "0",               "0",       
    "05 One-way ANOVA",                                "1",          "0",       "1",               "0",       
    "06 Tekentoets",                                   "1",          "0",       "0",               "0",       
    "07 Wilcoxon signed rank toets",                   "0",          "0",       "0",               "0",       
    "08 Mann-Whitney U toets",                         "1",          "0",       "1",               "0",       
    "09 Friedman toets",                               "0",          "0",       "0",               "0",       
    "10 Kruskal Wallis toets",                         "1",          "0",       "1",               "0",       
    "11 z-test voor proporties",                       "0",          "0",       "0",               "0",       
    "12 McNemar toets",                                "0",          "0",       "0",               "0",       
    "13 Chi-kwadraat toets en Fishers exact toets",    "1",          "0",       "1",               "0",       
    "14 NIET IN GEBRUIK; NIET VERWIJDEREN",            "0",          "0",       "0",               "0",       
    "15 Cochrans Q toets",                             "0",          "0",       "0",               "0",       
    "16 Fisher-Freeman-Halton exact toets",            "1",          "0",       "0",               "0",       
    "17 McNemar toets en Wilcoxon signed rank toets",  "0",          "0",       "0",               "0",      
    "18 Chi-kwadraat toets trend",                     "0",          "0",       "0",               "0",       
    "19 GLMM GLEE",                                    "0",          "0",       "0",               "0",       
)

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 01 MAAK WEBSITE ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Bepaal de modus
sModus <- "Root"

## Verwijder de site root
rmarkdown::clean_site(preview = FALSE,
                      quiet = FALSE,
                      encoding = "UTF-8")

# Maak de nieuwe website
rmarkdown::render_site(
  output_format = "html_document",
  envir = parent.frame(),
  quiet = FALSE,
  encoding = "UTF-8"
)

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 02.1 MAAK R FOLDER ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Als R niet bestaat, maak deze dan aan
ifelse(!dir.exists("_site/R"), dir.create("_site/R"), FALSE)

## Loop over de toetsen die in gebruik zijn en genereer die pagina's
for (sToets in dfToetsen$Toets[dfToetsen$InGebruik_R == 1]) {
    sModus  <- "R"
    bStatus <- dfToetsen$Review_R[dfToetsen$Toets == sToets]
    render(paste0("R/",sToets," R.Rmd"), 
           output_file = paste0('_site/R/', gsub(" ", "-", sToets), '-R.html'))    
}

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 02.2 MAAK PYTHON FOLDER ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Als R niet bestaat, maak deze dan aan
ifelse(!dir.exists("_site/Python"), dir.create("_site/Python"), FALSE)

## Loop over de toetsen die in gebruik zijn en genereer die pagina's
for (sToets in dfToetsen$Toets[dfToetsen$InGebruik_Python == 1]) {
    sModus <- "Python"
    bStatus <- dfToetsen$Review_Python[dfToetsen$Toets == sToets]
    render(paste0("R/",sToets,"-Python.Rmd"), 
           output_file = paste0('_site/Python/', gsub(" ", "-", sToets), '-Python.html'))    
}

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 02.3 MAAK IMAGE FOLDER ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Als images folder niet bestaat, maak deze dan aan
ifelse(!dir.exists("_site/images"), dir.create("_site/images"), FALSE)

current_folder <- "01. Includes/images/"
new_folder     <- "_site/images"
list_of_files  <- list.files(current_folder) 

## Kopieer het logo naar deze folder
file.copy(file.path(current_folder,list_of_files), new_folder, 
          overwrite = TRUE, 
          recursive = FALSE,
          copy.mode = TRUE)

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 03 CONTROLEER DE UITKOMST ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# Bekijk de nieuwe website
output_file <- file.path(here::here(), "_site/index.html")
browseURL(output_file)

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 04 RUIM OP ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
rm(list = ls())

