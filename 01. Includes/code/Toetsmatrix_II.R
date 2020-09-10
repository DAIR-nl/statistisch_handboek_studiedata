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
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

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

## Functies om de toetsmatrix in HTML per regel op te bouwen
## Regel 1:
maak_html_r1 <- function() {
  htmltools::withTags(
    tr(
      td(rowspan = 6, class = "header1 innercell", "Afhankelijke variabele"),
      td(rowspan = 1, class = "header2 innercell", "continu",tags$br(),"(interval en ratio)"),
      ## Toets 01 tm 05
      maak_html_toetscel_combi(as.logical(as.numeric(dfToetsen[28,]$InGebruik)),  
                   dfToetsen[28,]$Toets, 
                   as.logical(as.numeric(dfToetsen[29,]$InGebruik)),  
                   dfToetsen[29,]$Toets, 
                   sModus = sModus),      
      maak_html_toetscel_combi(as.logical(as.numeric(dfToetsen[30,]$InGebruik)),  
                   dfToetsen[30,]$Toets, 
                   as.logical(as.numeric(dfToetsen[31,]$InGebruik)),  
                   dfToetsen[31,]$Toets, 
                   sModus = sModus),      
      maak_html_toetscel_combi(as.logical(as.numeric(dfToetsen[32,]$InGebruik)),  
                   dfToetsen[32,]$Toets, 
                   as.logical(as.numeric(dfToetsen[33,]$InGebruik)),  
                   dfToetsen[33,]$Toets, 
                   sModus = sModus),      
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[33,]$InGebruik)),  
                   dfToetsen[33,]$Toets, 
                   sModus = sModus),
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[33,]$InGebruik)),  
                   dfToetsen[33,]$Toets, 
                   sModus = sModus)
    )
  )
}

## Regel 2:
maak_html_r2 <- function() {
  htmltools::withTags(
    tr(
      td(class = "header2 innercell", "gecensureerd",tags$br(),"continu"),
      ## Toets 06 tm 10
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[36,]$InGebruik)),  
                   dfToetsen[36,]$Toets, 
                   sModus = sModus),
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[36,]$InGebruik)),  
                   dfToetsen[36,]$Toets, 
                   sModus = sModus),
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[38,]$InGebruik)),  
                   dfToetsen[38,]$Toets, 
                   sModus = sModus),
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[38,]$InGebruik)),  
                   dfToetsen[38,]$Toets, 
                   sModus = sModus),
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[38,]$InGebruik)),  
                   dfToetsen[38,]$Toets, 
                   sModus = sModus)
    )
  )
}

## Regel 3:
maak_html_r3 <- function() {
  htmltools::withTags(
    tr(
      td(class = "header2 innercell", "binair",tags$br(),""),
      ## Toets 11 tm 15
      maak_html_toetscel_combi(as.logical(as.numeric(dfToetsen[41,]$InGebruik)),  
                   dfToetsen[41,]$Toets, 
                   as.logical(as.numeric(dfToetsen[42,]$InGebruik)),  
                   dfToetsen[42,]$Toets, 
                   sModus = sModus),      
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[41,]$InGebruik)),  
                   dfToetsen[41,]$Toets, 
                   sModus = sModus),
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[44,]$InGebruik)),  
                   dfToetsen[44,]$Toets,
                   sModus = sModus),
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[44,]$InGebruik)),  
                   dfToetsen[44,]$Toets,
                   sModus = sModus),
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[44,]$InGebruik)),  
                   dfToetsen[44,]$Toets,
                   sModus = sModus)
    )
  )
}

## Regel 4:
maak_html_r4 <- function() {
  htmltools::withTags(
    tr(
      td(class = "header2 innercell", "nominaal ",tags$br(), ""),
      ## Toets 16 tm 19
      maak_html_toetscel_combi(as.logical(as.numeric(dfToetsen[47,]$InGebruik)),  
                   dfToetsen[47,]$Toets, 
                   as.logical(as.numeric(dfToetsen[48,]$InGebruik)),  
                   dfToetsen[48,]$Toets, 
                   sModus = sModus),      
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[47,]$InGebruik)),  
                         dfToetsen[47,]$Toets, 
                         sModus = sModus),
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[50,]$InGebruik)),  
                         dfToetsen[50,]$Toets,
                         sModus = sModus),
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[50,]$InGebruik)),  
                         dfToetsen[50,]$Toets,
                         sModus = sModus),
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[50,]$InGebruik)),  
                         dfToetsen[50,]$Toets,
                         sModus = sModus)
    )
  )
}

## Regel 5:
maak_html_r5 <- function() {
  htmltools::withTags(
    tr(
      td(class = "header2 innercell", "ordinaal"),
      ## Toets 16 tm 19
      #maak_html_toetscel(F,  
      #                   "...", 
      #                   sModus = sModus),
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[53,]$InGebruik)),
                         dfToetsen[53,]$Toets,
                         sModus = sModus),
      ## Wilcoxon
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[53,]$InGebruik)),  
                         dfToetsen[53,]$Toets, 
                         sModus = sModus),
      ## Chi-kwadraat toets (trend)
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[55,]$InGebruik)),
                         dfToetsen[55,]$Toets,
                         sModus = sModus),
      ## Friedman's ANOVA
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[55,]$InGebruik)),  
                         dfToetsen[55,]$Toets, 
                         sModus = sModus),
      ## Chi-kwadraat toets (trend)
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[55,]$InGebruik)),
                         dfToetsen[55,]$Toets,
                         sModus = sModus)
    )
  )
}


## Regel 6:
maak_html_r6 <- function() {
  htmltools::withTags(
    tr(
      td(class = "header2 innercell", "Meerdere continue",tags$br(), "variabelen"),
      ## Toets 16 tm 19
      #maak_html_toetscel(F,  
      #                   "...", 
      #                   sModus = sModus),
      maak_html_toetscel_combi(as.logical(as.numeric(dfToetsen[58,]$InGebruik)),  
                   dfToetsen[58,]$Toets, 
                   as.logical(as.numeric(dfToetsen[59,]$InGebruik)),  
                   dfToetsen[59,]$Toets, 
                   sModus = sModus),      
      ## Wilcoxon
      maak_html_toetscel_combi(as.logical(as.numeric(dfToetsen[60,]$InGebruik)),  
                   dfToetsen[60,]$Toets, 
                   as.logical(as.numeric(dfToetsen[61,]$InGebruik)),  
                   dfToetsen[61,]$Toets, 
                   sModus = sModus),      
      ## Chi-kwadraat toets (trend)
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[62,]$InGebruik)),
                         dfToetsen[62,]$Toets,
                         sModus = sModus),
      ## Friedman's ANOVA
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[62,]$InGebruik)),  
                         dfToetsen[62,]$Toets, 
                         sModus = sModus),
      ## Chi-kwadraat toets (trend)
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[62,]$InGebruik)),
                         dfToetsen[62,]$Toets,
                         sModus = sModus)
    )
  )
}


## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 03.1 BOUW HTML ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Bouw nu de 4 rijen op
maak_html_r1()
maak_html_r2()
maak_html_r3()
maak_html_r4()
maak_html_r5()
maak_html_r6()

