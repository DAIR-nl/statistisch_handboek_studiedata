## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Index_Merge_Python.R ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R code voor het Statistisch Handboek van het Versnellingsplan
## Copyright 2020 VU
## Web Page: http://www.vu.nl
## Contact: Theo Bakker (t.c.bakker@vu.nl)
##
## Doel: Een pagina om R Markdown toetsen in R om te zetten naar Python
##
## Afhankelijkheden: De R Markdown toetsen
##
## Datasets: Geen
##
## Opmerkingen:
## 1) Geen.
## 2) ___
##
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Geschiedenis:
## 11-01-2020: TB: Aanmaak bestand
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 00 VOORBEREIDINGEN ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Installeer packages en functies
source("99. Functies en Libraries/00. Voorbereidingen.R")

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 01 BEPAAL DE TOETSEN DIE GEMERGED MOETEN WORDEN ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Bepaal de lijst van toetsen; wijzig 0 in 1 om in gebruik te nemen
dfToetsen <- tribble(
    ~Toets, ~InGebruik,
    "01 One sample t-toets",                "1", 
    "02 Gepaarde t-toets",                  "0", 
    "03 Ongepaarde t-toets",                "0", 
    "04 Linear mixed model",                "0", 
    "05 One-way ANOVA",                     "0", 
    "06 Tekentoets",                        "0", 
    "07 Wilcoxon signed rank toets",        "0", 
    "08 Mann-Whitney U toets",              "0", 
    "09 Friedman toets",                    "0", 
    "10 Kruskal Wallis",                    "0", 
    "11 z-test voor proporties",            "0", 
    "12 McNemar toets",                     "0", 
    "13 Chi2 toets",                        "0", 
    "14 Fisher’s exact toets",              "0", 
    "15 Cochran’s Q toets",                 "0", 
    "16 Fisher-Freeman-Halton exact toets", "0", 
    "17 Chi2 toets (trend)",                "0", 
    "18 GLMM",                              "0", 
    "19 GEE",                               "0" 
)

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 02 LEES R MARKDOWN EN PYTHON ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

for (toets in dfToetsen$Toets[dfToetsen$InGebruik == 1]) {
    sToets <- toets
    
    ## R Markdown
    thisRmd_R <- paste0("R/", paste0(toets, ".Rmd"))
    
    ## Python
    thisRmd_Python <- paste0("Python/", paste0(toets, " py.Rmd"))
    
    if (file.exists(thisRmd_R) & file.exists(thisRmd_Python)) {
      
      ## Merge 
      thisRmd_R_file      <- readLines(con = thisRmd_R)
      thisRmd_Python_file <- readLines(con = thisRmd_Python)
      
      ## Maak een lijst van codeblokken
      ## Bepaal de regelnummers
      lRegelnummers <-
        grep(paste0("## [/]{0,1}BLOK:"),
             readLines(con = thisRmd_R))
      lLines <- thisRmd_R_file[lRegelnummers]
      
      ## Verwijder regels met /BLOK en verwijder begin + einde string
      lLines2 <- lLines[!str_detect(lLines, pattern = "## /BLOK")] 
      lLines3 <- lLines2 %>% 
        str_replace("<!-- ## BLOK: ", "") %>% 
        str_replace(".R -->", "")
      
      ## Loop over regelnummers
      for (l in lLines3) {
        lRegelnummers_Python <- grep(paste0("## [/]{0,1}BLOK: ",l,".py"),
                                     thisRmd_Python_file)
      }
      
      
      ## Bewaar de code
      ## write(thisRmd_R_file, file = paste0("Merged/Python/",sToets,"-Python.Rmd"))
      ## Read thisRmd_R
      ## Read thisRmd_Python
      
      
    }

}
