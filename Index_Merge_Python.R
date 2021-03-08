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
## 28-01-2020: TB: Nieuwe versie zonder het wegschrijven van snippets
## 08-03-2021: EG: Toelichting toevoegen en uitgebreider commenten
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Toelichting: in dit script worden de Python chunks omgezet in Python 
## toetspagina's. In de Python chunks is voor alle blokken alternatieve tekst
## of code ingevuld die de tekst of code in de blokken van de R toetspagina
## moet vervangen. In dit script wordt een markdown document gemaakt om
## Python toetspagina's te kunnen maken. Dit wordt gedaan door in het markdown-
## document voor de toetspagina's in R de blokken te vervangen door de blokken
## gedefinieerd in de Python chunks bestanden. De Python toetspagina's zijn
## markdown documenten die later weer gerund worden om zo html-documenten met
## Python code voor de site te hebben. De Python chunks staan in de map 
## SHHO/04. Python chunks, de Python toetspagina's worden opgeslagen in de map
## SHHO/Python.

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

## Geef in de lijst de toetsen aan waarvoor de Python markdown documenten 
## aangemaakt moeten worden. Met een 1 wordt aangegeven dat voor deze toets een
## Python markdown document aangemaakt moet worden op basis van de Python 
## chunks. Voor de toetsen met een 0 wordt deze niet aangemaakt. Bij een nieuwe
## toets moet de lijst dus gewijzigd worden.
dfToetsen <- tribble(
    ~Toets, ~InGebruik,
    "01 One sample t-toets",                                                                    "1", 
    "02 Gepaarde t-toets",                                                                      "1", 
    "03 Ongepaarde t-toets",                                                                    "1", 
    "04 Repeated measures ANOVA",                                                               "1", 
    "05 One-way ANOVA",                                                                         "1", 
    "06 Tekentoets I",                                                                          "1", 
    "07 Wilcoxon signed rank toets I",                                                          "1", 
    "08 Mann-Whitney U toets I",                                                                "1", 
    "09 Friedmans ANOVA I",                                                                     "1", 
    "10 Kruskal Wallis toets I",                                                                "1", 
    "11 Chi-kwadraat toets voor goodness of fit en binomiaaltoets",                             "1", 
    "12 McNemar toets",                                                                         "1", 
    "13 Chi-kwadraat toets voor onafhankelijkheid en Fishers exacte toets",                     "1", 
    "14 NIET IN GEBRUIK; NIET VERWIJDEREN",                                                     "0", 
    "15 Cochrans Q toets",                                                                      "1", 
    "16 Chi-kwadraat toets voor onafhankelijkheid en Fisher-Freeman-Halton exacte toets I",     "1", 
    "17 Chi-kwadraat toets voor goodness of fit en multinomiaaltoets",                          "0",    
    "18 Bhapkar toets",                                                                         "1",   
    "19 Chi-kwadraat toets voor onafhankelijkheid en Fisher-Freeman-Halton exacte toets II",    "0",        
    "20 Multilevel multinomiale logistische regressie",                                         "0",    
    "21 Chi-kwadraat toets voor goodness of fit en multinomiaaltoets",                          "1",     
    "22 Wilcoxon signed rank toets II",                                                         "0",        
    "23 Mann-Whitney U toets II",                                                               "0",       
    "24 Friedmans ANOVA II",                                                                    "0",       
    "25 Kruskal Wallis toets II",                                                               "0",     
    "26 Tekentoets II",                                                                         "1",       
    "27 Moods mediaan toets",                                                                   "1", 
)

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 02 MAAK PYTHON TOETSPAGINA'S ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## In dit deel van de code wordt voor elke toets uit de lijst een Python
## markdown document aangemaakt op basis van de Python chunks.

## Verwerk codeblokken met OPENBLOK, TEKSTBLOK
sRegEx <- "## [/]{0,1}[A-Z]{4,6}BLOK: "

## Loop over de toetsen die in gebruik zijn op basis van de lijst hierboven
for (sToets in dfToetsen$Toets[dfToetsen$InGebruik == 1]) {

    ## Bepaal de R Markdown en Python chunk Markdown
    thisRmd_R      <- paste0("R/", paste0(sToets, " R.Rmd"))
    thisRmd_Python <- paste0("04. Python chunks/", paste0(sToets, " py.Rmd"))
    
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
      ## en trim
      lCodeblokken <- lCodeblokken[!str_detect(lCodeblokken, pattern = "## /")] %>% 
        str_replace("<!-- ## ", "") %>% 
        str_replace(".R[ ]{0,1}-->", "") %>%
        trim()
      
      ## Maak een lijst voor de Python code op basis van de lijst van Codeblokken
      lPythonCode <- vector(mode = "list", length = length(lCodeblokken))
      
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

            ## Bewaar de code in een tijdelijke variabele
            lPythonCode[[l]] <- thisCode
            
            ## Melding
            if (bDebug == T) {
              print(paste0("Python code verwerkt voor ", sToets, " en ", l, ".py"))
            }
            
        } else {
            print(paste0("GEEN Python code gevonden voor ", sToets, " en ", l, ".py"))
        }
      }
      
      ## Plaats nu thisRmd_R_file in thisRmd_file
      thisRmd_file <- thisRmd_R_file
      
      ## Verwijder het gemergede Python bestand als het bestaat
      sPythonFile_Merged <- paste0("Python/", sToets, "-Python.Rmd")
      if (file.exists(sPythonFile_Merged)) {
        unlink(sPythonFile_Merged)
        print(paste0("VERWIJDERD OM OPNIEUW OP TE BOUWEN: ", sPythonFile_Merged))
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
        
        ## Lees het bestand in en knip de betreffende code eruit,
        ## maar alleen als er een gevuld element is in lPythonCode[[l]]
        if (length(lRegelnummers_R) == 2 && !is.null(lPythonCode[[l]])) {
            thisPythonCode <- lPythonCode[[l]]
            
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
            print(paste0("Verwerkt: ",l))
            
            if (i == length(lCodeblokken) ) {
              if (file.exists(sPythonFile_Merged)) {
                print(paste0("Aangemaakt: ", sPythonFile_Merged))
              } else {
              print(paste0("ERROR: ", sPythonFile_Merged, " niet aangemaakt"))
              } 
            }
            
        } else {
            ## Als er geen code is gevonden, geef dan een melding
            print(paste0("GEEN Python code verwerkt voor ", sToets, " en ", l,".py"))
        }
      }
      
    } else {
      ## Als er geen bestanden zijn gevonden, geef dan een melding 
      print(paste("GEEN bestanden aanwezig voor", sToets))
    }

}

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 03 RUN PYTHON TOETSPAGINA'S ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## In dit deel van de code wordt voor elke Python toetspagina die hierboven is
## aangemaakt een html-bestand gemaakt. Op deze manier kan er voor elke Python
## toetspagina een controle uitgevoerd worden op de html-documenten die later
## op de website gezet worden. Als er een nieuwe toetspagina in Python af is,
## is dit handig om even te controleren om zo kleine foutjes eruit te halen.

## Loop over de toetsen die in gebruik zijn en genereer die html-pagina's
for (sToets in dfToetsen$Toets[dfToetsen$InGebruik == 1]) {
    sModus <- "Python"
    #bStatus <- dfToetsen$Review_Python[dfToetsen$Toets == sToets]
    rmarkdown::render(paste0("Python/",sToets,"-Python.Rmd"), 
           output_file = paste0('Python/', gsub(" ", "-", sToets), '-Python.html'))    
}

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 04 RUIM OP ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
rm(list = ls())