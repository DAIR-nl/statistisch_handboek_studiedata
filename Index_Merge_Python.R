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
## 25-01-2020: TB: Aanvulling voor verschillende codeblokken
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 00 VOORBEREIDINGEN ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Installeer packages en functies
source("99. Functies en Libraries/00. Voorbereidingen.R")

## Debug
bDebug <- F

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 01 BEPAAL DE TOETSEN DIE GEMERGED MOETEN WORDEN ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Bepaal de lijst van toetsen; wijzig 0 in 1 om in gebruik te nemen
dfToetsen <- tribble(
    ~Toets, ~InGebruik,
    "01 One sample t-toets",                "0", 
    "02 Gepaarde t-toets",                  "0", 
    "03 Ongepaarde t-toets",                "1", 
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

## Verwerk codeblokken met OPENBLOK, TEKSTBLOK
sRegEx <- "## [/]{0,1}[A-Z]{4,5}BLOK: "

## Loop over de toetsen die in gebruik zijn
for (toets in dfToetsen$Toets[dfToetsen$InGebruik == 1]) {
    sToets <- toets
    
    ## Bepaal de R Markdown en Pyton Markdown
    thisRmd_R      <- paste0("R/", paste0(toets, " R.Rmd"))
    thisRmd_Python <- paste0("04. Python chunks/", paste0(toets, " py.Rmd"))
    
    ## Als beide bestanden bestaan, ga dan verder
    if (file.exists(thisRmd_R) & file.exists(thisRmd_Python)) {
      
      ## Lees de twee bestanden in en plaats ze in een variabele 
      thisRmd_R_file      <- readLines(con = thisRmd_R, warn = F)
      thisRmd_Python_file <- readLines(con = thisRmd_Python, warn = F)
      
      ## Bepaal de regelnummers en maak een lijst van codeblokken
      lRegelnummers <- grep(paste0(sRegEx), 
                            readLines(con = thisRmd_R, warn = F))
      lCodeblokken <- thisRmd_R_file[lRegelnummers]
      
      ## Verwijder regels met /BLOK en verwijder begin + einde string (<--! -->)
      lCodeblokken <- lCodeblokken[!str_detect(lCodeblokken, pattern = "## /")] %>% 
        str_replace("<!-- ## ", "") %>% 
        str_replace(".R[ ]{0,1}-->", "") 
      
      ## Loop nu over de codeblokken
      for (l in lCodeblokken) {
        
        ## Bepaal de regelnummers in de Python versie en toon deze (voor debug)
        lRegelnummers_Python <- grep(paste0(l,".py"),
                                     thisRmd_Python_file)
        ## Lees het bestand nu in en knip de betreffende code eruit, bewaar deze
        ## en geef een melding
        if (length(lRegelnummers_Python) == 2) {
            
            if (bDebug == T) {
              print(paste(l, ": ", lRegelnummers_Python))
            }
            thisCode      <- thisRmd_Python_file[lRegelnummers_Python[1]:lRegelnummers_Python[2]]

            ## Bewaar de code (tijdelijk)
            write(thisCode, file = paste0("Python/", toets,"-", l, ".py"))
            
            ## Melding
            if (bDebug == T) {
              print(paste0("Python code verwerkt voor ", toets, " en ", l, ".py"))
            }
            
        } else {
            print(paste0("GEEN Python code gevonden voor ", toets, " en ", l, ".py"))
        }
      }
      
      ## Plaats nu thisRmd_R_file in thisRmd_file
      thisRmd_file <- thisRmd_R_file
      
      ## Verwijder het gemergede Python bestand als het bestaat
      sPythonFile_Merged <- paste0("Python/", toets, "-Python.Rmd")
      if (file.exists(sPythonFile_Merged)) {
        unlink(sPythonFile_Merged)
      }
        
      ## Loop over de .py bestanden en vervang de .R code blokken met de .py code blokken
      ## Maak een teller, zodat na de 1e loop het bestand dat gemaakt is kan gebruikt
      ## worden als basis in plaats van het originel R rmd file.
      i <- 0
      for (l in lCodeblokken) {
        i <- i + 1
        if (i > 1 & file.exists(sPythonFile_Merged)) {
          thisRmd_file <- readLines(sPythonFile_Merged)
        }
        
        lRegelnummers_R <- grep(paste0(l,".R"), thisRmd_file)
        if (bDebug == T) {
          print(paste(l, ": ", lRegelnummers_R))
        }
        
        ## Lees het bestand in en knip de betreffende code eruit
        sPythonFile_Code <- paste0("Python/", toets,"-", l, ".py")
        if (length(lRegelnummers_R) == 2 & file.exists(sPythonFile_Code)) {
            thisPythonCode    <- readLines(sPythonFile_Code)
            
            ## Bepaal de start en eindregel
            startRegel <- lRegelnummers_R[1] - 1
            eindRegel  <- lRegelnummers_R[2] + 1
            
            ## Plaats het begin van het bestand in een variabele en het einde.
            thisNewFile_Start <- thisRmd_file[1:startRegel]
            thisNewFile_End   <- thisRmd_file[eindRegel:length(thisRmd_file)]
            
            ## Combineer nu het begin en einde met het codeblok 
            cat(file = sPythonFile_Merged, 
                thisNewFile_Start, thisPythonCode, thisNewFile_End, 
                sep = "\n")
            
            ## Geef een melding
            if (bDebug == T) {
              print(paste(l, "verwerkt"))
            }
            unlink(sPythonFile_Code)
            
        } else {
            ## Als er geen code is gevonden, geef dan een melding
            print(paste0("GEEN Python code verwerkt voor ", toets, " en ", l,".py"))
        }
      }
      
    } else {
      ## Als er geen bestanden zijn gevonden, geef dan een melding 
      print(paste("GEEN bestanden aanwezig voor", sToets))
    }

}

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 02 RUIM OP ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
rm(list = ls())
