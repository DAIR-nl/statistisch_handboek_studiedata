## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Toetsmatrix_II.R ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R code voor het Statistisch Handboek van het Versnellingsplan
## Copyright 2020 VU
## Web Page: http://www.vu.nl
## Contact: Theo Bakker (t.c.bakker@vu.nl)
##
## Doel: De toetsmatrix II voor de website
##
## Afhankelijkheden: htmltools package
##
## Datasets: Geen
##
## Opmerkingen:
## 1) Geen.
## 2) ___
##
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Geschiedenis:
## 17-06-2020: EG: Aanmaak bestand
## 10-09-2020: EG: Functies in aparte R-code gezet
## 11-03-2021: EG: Toelichting toegevoegd
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Toelichting: In dit script wordt toetsmatrix II aangemaakt. De toetsmatrix
## wordt opgebouwd door een combinatie van R en html code. Elke toetscel wordt
## gevuld met url's naar de toetsen die in die toetscel horen te staan.

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 00 VOORBEREIDINGEN ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Bepaal de default modus
if (!exists("sModus")) {
  sModus <- "R"
}

if (exists("dfToetsen")) {
  varname <- paste0("InGebruik_",sModus)
  dfToetsen <- dfToetsen %>%
      mutate(InGebruik = !!as.name(varname))
}

## Laad functies in 
source(paste0(here::here(),"/01. Includes/code/Toetsmatrix_functies.R"))

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 01 FUNCTIES ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## In dit deel wordt een functie geschreven voor elke regel van de toetsmatrix.

## Regel 1
maak_html_r1 <- function() {
  htmltools::withTags(
    tr(
      td(rowspan = 6, class = "header1 innercell", "Afhankelijke variabele"),
      td(rowspan = 1, class = "header2 innercell", "continu",tags$br(),"(interval en ratio)"),
      ## Multipele lineaire regressie / Factoriële ANOVA
      maak_html_toetscel_combi(as.logical(as.numeric(dfToetsen[28,]$InGebruik)),  
                   dfToetsen[28,]$Toets, 
                   as.logical(as.numeric(dfToetsen[29,]$InGebruik)),  
                   dfToetsen[29,]$Toets, 
                   sModus = sModus),      
      ## Multipele lineaire regressie / ANCOVA
      maak_html_toetscel_combi(as.logical(as.numeric(dfToetsen[28,]$InGebruik)),  
                   dfToetsen[28,]$Toets, 
                   as.logical(as.numeric(dfToetsen[31,]$InGebruik)),  
                   dfToetsen[31,]$Toets, 
                   sModus = sModus),      
      ## Factoriële repeated measures ANOVA / Mixed ANOVA / Multilevel lineaire
      ## regressie
      maak_html_toetscel_tri(as.logical(as.numeric(dfToetsen[30,]$InGebruik)),  
                   dfToetsen[30,]$Toets, 
                   as.logical(as.numeric(dfToetsen[32,]$InGebruik)),  
                   dfToetsen[32,]$Toets, 
                   as.logical(as.numeric(dfToetsen[33,]$InGebruik)),  
                   dfToetsen[33,]$Toets, 
                   sModus = sModus),      
      ## Multilevel lineaire regressie
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[33,]$InGebruik)),  
                   dfToetsen[33,]$Toets, 
                   sModus = sModus),
      ## Multilevel lineaire regressie
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[35,]$InGebruik)),  
                   dfToetsen[35,]$Toets, 
                   sModus = sModus)
    )
  )
}

## Regel 2
maak_html_r2 <- function() {
  htmltools::withTags(
    tr(
      td(class = "header2 innercell", "gecensureerd",tags$br(),"continu"),
      ## Survival analyse
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[36,]$InGebruik)),  
                   dfToetsen[36,]$Toets, 
                   sModus = sModus),
      ## Survival analyse
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[36,]$InGebruik)),  
                   dfToetsen[36,]$Toets, 
                   sModus = sModus),
      ## Leeg
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[62,]$InGebruik)),
                         dfToetsen[62,]$Toets,
                         sModus = sModus),
      ## Leeg
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[62,]$InGebruik)),
                         dfToetsen[62,]$Toets,
                         sModus = sModus),
      ## Leeg
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[62,]$InGebruik)),
                         dfToetsen[62,]$Toets,
                         sModus = sModus)
    )
  )
}

## Regel 3
maak_html_r3 <- function() {
  htmltools::withTags(
    tr(
      td(class = "header2 innercell", "binair",tags$br(),""),
      ## Logistische regressie / Loglineaire analyse
      maak_html_toetscel_combi(as.logical(as.numeric(dfToetsen[41,]$InGebruik)),  
                   dfToetsen[41,]$Toets, 
                   as.logical(as.numeric(dfToetsen[42,]$InGebruik)),  
                   dfToetsen[42,]$Toets, 
                   sModus = sModus),      
      ## Logistische regressie
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[41,]$InGebruik)),  
                   dfToetsen[41,]$Toets, 
                   sModus = sModus),
      ## Multilevel logistische regressie
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[44,]$InGebruik)),  
                   dfToetsen[44,]$Toets,
                   sModus = sModus),
      ## Multilevel logistische regressie
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[44,]$InGebruik)),  
                   dfToetsen[44,]$Toets,
                   sModus = sModus),
      ## Multilevel logistische regressie
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[46,]$InGebruik)),  
                   dfToetsen[46,]$Toets,
                   sModus = sModus)
    )
  )
}

## Regel 4
maak_html_r4 <- function() {
  htmltools::withTags(
    tr(
      td(class = "header2 innercell", "nominaal ",tags$br(), ""),
      ## Multinomiale logistische regressie / Loglineaire analyse
      maak_html_toetscel_combi(as.logical(as.numeric(dfToetsen[47,]$InGebruik)),  
                   dfToetsen[47,]$Toets, 
                   as.logical(as.numeric(dfToetsen[48,]$InGebruik)),  
                   dfToetsen[48,]$Toets, 
                   sModus = sModus),
      ## Multinomiale logistische regressie
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[47,]$InGebruik)),  
                         dfToetsen[47,]$Toets, 
                         sModus = sModus),
      ## Multilevel multinomiale regressie
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[50,]$InGebruik)),  
                         dfToetsen[50,]$Toets,
                         sModus = sModus),
      ## Multilevel multinomiale regressie
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[50,]$InGebruik)),  
                         dfToetsen[50,]$Toets,
                         sModus = sModus),
      ## Multilevel multinomiale regressie
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[52,]$InGebruik)),  
                         dfToetsen[52,]$Toets,
                         sModus = sModus)
    )
  )
}

## Regel 5
maak_html_r5 <- function() {
  htmltools::withTags(
    tr(
      td(class = "header2 innercell", "ordinaal"),
      ## Ordinale logistische regressie
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[53,]$InGebruik)),
                         dfToetsen[53,]$Toets,
                         sModus = sModus),
      ## Ordinale logistische regressie
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[53,]$InGebruik)),  
                         dfToetsen[53,]$Toets, 
                         sModus = sModus),
      ## Multilevel ordinale regressie
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[55,]$InGebruik)),
                         dfToetsen[55,]$Toets,
                         sModus = sModus),
      ## Multilevel ordinale regressie
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[55,]$InGebruik)),  
                         dfToetsen[55,]$Toets, 
                         sModus = sModus),
      ## Multilevel ordinale regressie
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[57,]$InGebruik)),
                         dfToetsen[57,]$Toets,
                         sModus = sModus)
    )
  )
}

## Regel 6
maak_html_r6 <- function() {
  htmltools::withTags(
    tr(
      td(class = "header2 innercell", "Meerdere continue",tags$br(), "variabelen"),
      ## MANOVA
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[58,]$InGebruik)),
                         dfToetsen[58,]$Toets,
                         sModus = sModus),
      ## Leeg
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[62,]$InGebruik)),
                         dfToetsen[62,]$Toets,
                         sModus = sModus),
      ## Leeg
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[62,]$InGebruik)),
                         dfToetsen[62,]$Toets,
                         sModus = sModus),
      ## Leeg
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[62,]$InGebruik)),  
                         dfToetsen[62,]$Toets, 
                         sModus = sModus),
      ## Leeg
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[62,]$InGebruik)),
                         dfToetsen[62,]$Toets,
                         sModus = sModus)
    )
  )
}

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 03.1 BOUW HTML ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## In dit deel worden de functies uitgevoerd en wordt de toetsmatrix opgebouwd.

## Bouw nu de 6 rijen op
maak_html_r1()
maak_html_r2()
maak_html_r3()
maak_html_r4()
maak_html_r5()
maak_html_r6()
