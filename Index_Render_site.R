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
## 11-06-2020: EG: Nieuwe toetsen aan tibble toegevoed
## 17-06-2020: EG: Toetsmatrix II toegevoegd
## 04-08-2020: EG: Toetspagina 28 regressie toegevoegd
## 03-09-2020: TB: tribble vereenvoudigd voor numerieke waarden en kopjes 
## 08-03-2021: EG: Toelichting toegevoegd en uitgebreid commentaar
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Toelichting: in dit script wordt een map klaargemaakt die gebruikt wordt om de
## website aan te maken en te updaten. Dit is daarom een erg belangrijk script. 
## De website is in feite een verzameling html-documenten in een map. De map die
## aangemaakt wordt heet _site, hierin staan alle bestanden die op de website 
## komen. De map staat direct in de map SHHO. De map _site wordt in WINSCP 
## geüpload, op deze manier kan de website gewijzigd worden.

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 00 VOORBEREIDINGEN ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Installeer packages en functies
source("99. Functies en Libraries/00. Voorbereidingen.R")

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 01 BEPAAL WELKE TOETSEN GEMAAKT MOETEN WORDEN ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Maak een lijst met alle toetsen waarvoor een html-toetspagina gemaakt moet
## worden voor op de website. De rijen zijn gelijk aan alle toetspagina's die er
## zijn. De kolommen bestaan uit ~InGebruik_R, ~Review_R, ~InGebruik_Python en 
## ~Review_Python. Geef voor de kolom ~InGebruik_R met een 1 aan dat voor die
## toets een html-document gemaakt moet worden en met 0 aan dat dit niet hoeft.
## Dit geldt hetzelfde voor ~InGebruik_Python. Geef in de kolom ~Review_R aan
## met een 1 dat de toetspagina al door alle reviewrondes heen is gegaan en met
## een 0 aan dat dit niet zo is. Als de toetspagina nog niet door alle review-
## rondes heen is, komt er bovenaan de html-toetspagina een disclaimer te staan.
## Voor de kolom ~Review_Python geldt weer hetzelfde. Let dus op dat bij een 
## nieuwe toets de lijst dus gewijzigd moet worden.

## Dit overzicht wordt ook gemaakt in het bestand Toetsen.R uit de map 
## SHHO/01. Includes/code . Het is daarom belangrijk om op te letten dat het
## overzicht met toetsen in het script Index_Render_site.R en het overzicht in
## Toetsen.R hetzelfde is. Houdt dit bij en ga dit na.

## Bepaal de lijst van toetsen; wijzig 0 in 1 om in gebruik te nemen
dfToetsen <- tribble(
    ~Toets,                                                                                ~InGebruik_R, ~Review_R, ~InGebruik_Python, ~Review_Python,
    
    ## Toetsmatrix I
    "01 One sample t-toets",                                                                    1,          1,       1,               1,       
    "02 Gepaarde t-toets",                                                                      1,          1,       1,               0,       
    "03 Ongepaarde t-toets",                                                                    1,          1,       1,               0,       
    "04 Repeated measures ANOVA",                                                               1,          1,       1,               0,       
    "05 One-way ANOVA",                                                                         1,          1,       1,               0,       
    "06 Tekentoets I",                                                                          1,          1,       1,               0,       
    "07 Wilcoxon signed rank toets I",                                                          1,          1,       1,               0,       
    "08 Mann-Whitney U toets I",                                                                1,          1,       1,               0,       
    "09 Friedmans ANOVA I",                                                                     1,          1,       1,               0,       
    "10 Kruskal Wallis toets I",                                                                1,          1,       1,               0,       
    "11 Chi-kwadraat toets voor goodness of fit en binomiaaltoets",                             1,          1,       1,               0,       
    "12 McNemar toets",                                                                         1,          0,       1,               0,       
    "13 Chi-kwadraat toets voor onafhankelijkheid en Fishers exacte toets",                     1,          1,       1,               0,       
    "14 LEEG; NIET VERWIJDEREN",                                                                0,          0,       0,               0,       
    "15 Cochrans Q toets",                                                                      1,          0,       1,               0,       
    "16 Chi-kwadraat toets voor onafhankelijkheid en Fisher-Freeman-Halton exacte toets I",     1,          1,       1,               0,       
    "17 Chi-kwadraat toets voor goodness of fit en multinomiaaltoets",                          0,          0,       0,               0,       
    "18 Bhapkar toets",                                                                         1,          0,       1,               0,      
    "19 Chi-kwadraat toets voor onafhankelijkheid en Fisher-Freeman-Halton exacte toets II",    0,          0,       0,               0,       
    "20 Multilevel multinomiale logistische regressie",                                         1,          1,       0,               0,       
    "21 Chi-kwadraat toets voor goodness of fit en multinomiaaltoets",                          1,          0,       1,               0,       
    "22 Wilcoxon signed rank toets II",                                                         1,          0,       0,               0,       
    "23 Mann-Whitney U toets II",                                                               1,          0,       0,               0,       
    "24 Friedmans ANOVA II",                                                                    1,          0,       0,               0,       
    "25 Kruskal Wallis toets II",                                                               1,          0,       0,               0,       
    "26 Tekentoets II",                                                                         1,          1,       1,               0,       
    "27 Moods mediaan toets",                                                                   1,          0,       1,               0,       
    
   ## Toetsmatrix II
    "28 Multipele lineaire regressie",                                                          1,          0,       0,               0,       
    "29 Factoriele ANOVA",                                                                      1,          0,       0,               0,       
    "30 Factoriele repeated measures ANOVA",                                                    1,          0,       0,               0,       
    "31 ANCOVA",                                                                                1,          0,       0,               0,       
    "32 Mixed ANOVA",                                                                           1,          0,       0,               0,       
    "33 Multilevel lineaire regressie",                                                         0,          0,       0,               0,       
    "34 LEEG; NIET VERWIJDEREN",                                                                0,          0,       0,               0,       
    "35 Multilevel lineaire regressie",                                                         0,          0,       0,               0,       
    "36 Survival analyse",                                                                      0,          0,       0,               0,       
    "38 LEEG; NIET VERWIJDEREN",                                                                0,          0,       0,               0,       
    "38 LEEG; NIET VERWIJDEREN",                                                                0,          0,       0,               0,       
    "39 LEEG; NIET VERWIJDEREN",                                                                0,          0,       0,               0,       
    "40 LEEG; NIET VERWIJDEREN",                                                                0,          0,       0,               0,       
    "41 Logistische regressie",                                                                 0,          0,       0,               0,       
    "42 Loglineaire analyse",                                                                   0,          0,       0,               0,       
    "43 Logistische regressie",                                                                 0,          0,       0,               0,       
    "44 Multilevel logistische regressie I",                                                    0,          0,       0,               0,       
    "45 LEEG; NIET VERWIJDEREN",                                                                0,          0,       0,               0,       
    "46 Multilevel logistische regressie II",                                                   0,          0,       0,               0,       
    "47 Multinomiale logistische regressie",                                                    0,          0,       0,               0,       
    "48 Loglineaire analyse",                                                                   0,          0,       0,               0,       
    "49 Multinomiale logistische regressie",                                                    0,          0,       0,               0,       
    "50 Multilevel multinomiale logistische regressie I",                                       0,          0,       0,               0,       
    "51 LEEG; NIET VERWIJDEREN",                                                                0,          0,       0,               0,       
    "52 Multilevel multinomiale logistische regressie II",                                      0,          0,       0,               0,       
    "53 Ordinale logistische regressie",                                                        0,          0,       0,               0,       
    "54 Ordinale logistische regressie",                                                        0,          0,       0,               0,       
    "55 Multilevel ordinale logistische regressie I",                                           0,          0,       0,               0,       
    "56 LEEG; NIET VERWIJDEREN",                                                                0,          0,       0,               0,       
    "57 Multilevel ordinale logistische regressie II",                                          0,          0,       0,               0,       
    "58 MANOVA",                                                                                0,          0,       0,               0,       
    "59 LEEG; NIET VERWIJDEREN",                                                                0,          0,       0,               0,       
    "60 MANCOVA",                                                                               0,          0,       0,               0,       
    "61 LEEG; NIET VERWIJDEREN",                                                                0,          0,       0,               0,       
    "62 ",                                                                                      0,          0,       0,               0,       
)

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 01.1 MAAK WEBSITE ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## In dit deel worden instellingen bepaald, wordt de map _site eerst verwijderd
## en daarna opnieuw opgebouwd.

## Bepaal de modus; deze bepaalt de opbouw van de paden
sModus <- "Root"

## lProgrammeertalen
lProgrammeertalen <- c("R","Python")

## Verwijder de map _site in SHHO
rmarkdown::clean_site(preview = FALSE,
                      quiet = FALSE,
                      encoding = "UTF-8")

## Maak een nieuwe map _site en render daarin een aantal markdown-bestanden om
## daarmee html-pagina's aan te maken voor in de map _site
rmarkdown::render_site(
  output_format = "html_document",
  envir = parent.frame(),
  quiet = FALSE,
  encoding = "UTF-8"
)

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 01.2 MAAK IMAGE FOLDER ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## In dit deel worden de images uit de map SHHO/01. Includes/images 
## gekopieerd naar de map _site/images. De images zijn nodig voor op de website.

## Als images folder nog niet bestaat, maak deze dan aan in de map _site
ifelse(!dir.exists("_site/images"), dir.create("_site/images"), FALSE)

## Benoem de oude map, nieuwe map en een lijst met images
current_folder <- "01. Includes/images/"
new_folder     <- "_site/images"
list_of_files  <- list.files(current_folder) 

## Kopieer de images van de oude naar de nieuwe map
file.copy(file.path(current_folder,list_of_files), new_folder, 
          overwrite = TRUE, 
          recursive = FALSE,
          copy.mode = TRUE)

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 01.3 MAAK DE TOETSMATRIX ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## We maken 2x de pagina met de toetsmatrices: 1x voor R en 1x voor Python.
## Als de R of Python map nog niet bestaan in de map _site, maak deze dan aan
## en maak vervolgens het bijbehorende html-document voor de bijbehorende 
## pagina met daarop de toetsmatrices en de uitleg daaromheen

for (p in lProgrammeertalen) {
  ifelse(!dir.exists(paste0("_site/", p)), dir.create(paste0("_site/", p)), FALSE)
  sModus  <- p
  rmarkdown::render("_Toetsmatrix.Rmd",
         output_file = paste0('_site/', p, '/Toetsmatrix.html'))
}

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 02.1 MAAK R BESTANDEN ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## In dit blok wordt voor elk markdown document in de map SHHO/R waarvan in
## dfToetsen is aangegeven dat de toets in gebruik is een html-pagina gemaakt
## op basis van het markdown document. De html-documenten komen te staan in de 
## map _site/R .

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

## In dit blok wordt voor elk markdown document in de map SHHO/Python waarvan in
## dfToetsen is aangegeven dat de toets in gebruik is een html-pagina gemaakt
## op basis van het markdown document. De html-documenten komen te staan in de 
## map _site/Python .

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

## In dit deel worden twee bestanden naar de map _site gekopieerd die ervoor
## zorgen dat de website beter gevonden kan worden via google doordat ie hoger
## in de lijst met zoekresultaten komt te staan.

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

## In dit deel kan de website alvast bekeken worden. Door deze regels te runnen
## opent er een webpagina in je browser waarin te zien is hoe de website eruit
## komt te zien. Hier kan je ook op de verschillende onderdelen van de website
## klikken en onderzoeken of het allemaal werkt zoals het zou moeten werken.

## Bekijk de nieuwe website
output_file <- file.path(here::here(), "_site/index.html")
browseURL(output_file)

## Nu is de map _site compleet gevuld met alle documenten die nodig zijn. De map
## kan nu in het programma WINSP geüpload worden, op deze manier wordt de
## website gewijzigd. Ndata de map _site via WINSCP is geüpload, moet het script
## Index_Sitemap.R gerund worden. In dat bestand wordt de sitemap aangepast op
## basis van de vernieuwde website.

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 04 RUIM OP ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
rm(list = ls())
