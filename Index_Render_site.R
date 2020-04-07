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
## Afhankelijkheden: De codepagina's per toets
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
## 22-02-2020: TB: Toevoeging sitemap + google bestanden
## 08-03-2020: TB: Locatie van het aanmaken van images naar voren gehaald
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 00 VOORBEREIDINGEN ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Installeer packages en functies
source("99. Functies en Libraries/00. Voorbereidingen.R")

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 01 BEPAAL WELKE TOETSEN GEMAAKT MOETEN WORDEN ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Bepaal de lijst van toetsen; wijzig 0 in 1 om in gebruik te nemen
dfToetsen <- tribble(
    ~Toets,                                                                                ~InGebruik_R, ~Review_R, ~InGebruik_Python, ~Review_Python,
    "01 One sample t-toets",                                                                    "1",          "1",       "1",               "1",       
    "02 Gepaarde t-toets",                                                                      "1",          "0",       "1",               "0",       
    "03 Ongepaarde t-toets",                                                                    "1",          "0",       "1",               "0",       
    "04 Repeated measures ANOVA",                                                               "1",          "0",       "0",               "0",       
    "05 One-way ANOVA",                                                                         "1",          "0",       "1",               "0",       
    "06 Tekentoets I",                                                                          "1",          "0",       "0",               "0",       
    "07 Wilcoxon signed rank toets II",                                                         "1",          "0",       "0",               "0",       
    "08 Mann-Whitney U toets I",                                                                "1",          "0",       "1",               "0",       
    "09 Friedmans ANOVA I",                                                                     "0",          "0",       "0",               "0",       
    "10 Kruskal Wallis toets I",                                                                "1",          "0",       "1",               "0",       
    "11 Chi-kwadraat toets voor goodness of fit en binomiaaltoets",                             "1",          "0",       "0",               "0",       
    "12 McNemar toets I",                                                                       "1",          "0",       "0",               "0",       
    "13 Chi-kwadraat toets voor onafhankelijkheid en Fishers exact toets",                      "1",          "0",       "1",               "0",       
    "14 NIET IN GEBRUIK; NIET VERWIJDEREN",                                                     "0",          "0",       "0",               "0",       
    "15 Cochrans Q toets",                                                                      "0",          "0",       "0",               "0",       
    "16 Chi-kwadraat toets voor onafhankelijkheid en Fisher-Freeman-Halton exact toets I",      "1",          "0",       "0",               "0",       
    "17 Chi-kwadraat toets voor goodness of fit en multinomiaaltoets",                          "0",          "0",       "0",               "0",       
    "18 McNemar toets II",                                                                      "0",          "0",       "0",               "0",      
    "19 Chi-kwadraat toets voor onafhankelijkheid en Fisher-Freeman-Halton exact toets II",     "0",          "0",       "0",               "0",       
    "20 Generalized Linear Mixed Model",                                                        "0",          "0",       "0",               "0",       
    "21 Chi-kwadraat toets voor onafhankelijkheid en Fisher-Freeman-Halton exact toets III",    "0",          "0",       "0",               "0",       
    "22 Wilcoxon signed rank toets III",                                                        "0",          "0",       "0",               "0",       
    "23 Mann-Whitney U toets II",                                                               "0",          "0",       "0",               "0",       
    "24 Friedmans ANOVA II",                                                                    "0",          "0",       "0",               "0",       
    "25 Kruskal Wallis toets II",                                                               "0",          "0",       "0",               "0",       
    "26 Tekentoets II",                                                                         "0",          "0",       "0",               "0",       
    "27 Mood's mediaan toets",                                                                  "0",          "0",       "0",               "0",       
)

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 01.1 MAAK WEBSITE ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Bepaal de modus; deze bepaalt de opbouw van de paden
sModus <- "Root"


## lProgrammeertalen
lProgrammeertalen <- c("R","Python")

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
## 01.2 MAAK IMAGE FOLDER ####
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
## 01.3 MAAK DE TOETSMATRIX ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## We maken 2x de toetsmatrix: 1x voor R en 1x voor Python.
## Als de R of Python folder niet bestaan, maak deze dan aan
## en maak vervolgens de bijbehorende toetsmatrix op basis van de modus

for (p in lProgrammeertalen) {
  ifelse(!dir.exists(paste0("_site/", p)), dir.create(paste0("_site/", p)), FALSE)
  sModus  <- p
  rmarkdown::render("_Toetsmatrix.Rmd",
         output_file = paste0('_site/', p, '/Toetsmatrix.html'))
}

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 02.1 MAAK R BESTANDEN ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Loop over de toetsen die in gebruik zijn en genereer die pagina's
for (sToets in dfToetsen$Toets[dfToetsen$InGebruik_R == 1]) {
    sModus  <- "R"
    bStatus <- dfToetsen$Review_R[dfToetsen$Toets == sToets]
    rmarkdown::render(paste0("R/",sToets," R.Rmd"), 
           output_file = paste0('_site/R/', gsub(" ", "-", sToets), '-R.html'))    
}

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 02.2 MAAK PYTHON BESTANDEN ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Loop over de toetsen die in gebruik zijn en genereer die pagina's
for (sToets in dfToetsen$Toets[dfToetsen$InGebruik_Python == 1]) {
    sModus <- "Python"
    bStatus <- dfToetsen$Review_Python[dfToetsen$Toets == sToets]
    rmarkdown::render(paste0("Python/",sToets,"-Python.Rmd"), 
           output_file = paste0('_site/Python/', gsub(" ", "-", sToets), '-Python.html'))    
}

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 02.3 KOPIEER SITEMAP EN GOOGLE VERIFICATIECODE ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Kopieer het html bestand voor Google
current_folder <- "01. Includes/google/"
new_folder     <- "_site"
list_of_files  <- list.files(current_folder) 

## Kopieer het html bestand naar deze folder
file.copy(file.path(current_folder,list_of_files), new_folder, 
          overwrite = TRUE, 
          recursive = FALSE,
          copy.mode = TRUE)

## Kopieer de sitemap
current_folder <- "01. Includes/sitemap/"
new_folder     <- "_site"
list_of_files  <- list.files(current_folder) 

## Kopieer de sitemap naar deze folder
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


