## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Toetsmatrix.R ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R code voor het Statistisch Handboek van het Versnellingsplan
## Copyright 2020 VU
## Web Page: http://www.vu.nl
## Contact: Theo Bakker (t.c.bakker@vu.nl)
##
## Doel: De toetsmatrix voor de website
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
## 22-09-2019: TB: Aanmaak bestand
## 12-02-2020: TB: Correctie van cellen
## 13-02-2020: TB: Afhankelijk gemaakt van de sModus (wissel tussen R of Python)
## 22-02-2020: TB: Verbetering dat bij 2 links in 1 box deze onafhankelijke van 
## elkaar zijn in te stellen
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

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 01 FUNCTIES ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Generieke functies om namen en urls te bewerken
Verwijder_voorloop_cijfers <- function(sToets) {
  gsub('^[0-9]+ ', '', sToets)
}

Vervang_spaties_door_dashes <- function(sToets) {
  gsub(' ', '-', sToets)
}

Maak_url <- function(published, sModus, sToets_dashed) {
  if_else(published,
          paste0(sToets_dashed, "-", sModus, ".html"),
          "")
}

Corrigeer_toetsnaam <- function(sToetsnaam) {
  case_when(
      sToetsnaam == "Chi-kwadraat toets voor onafhankelijkheid en Fishers exact toets" ~ "Chi-kwadraat toets voor onafhankelijkheid en Fisher's exact toets",
      sToetsnaam == "Cochrans Q toets" ~ "Cochran's Q toets",
      sToetsnaam == "Fisher-Freeman-Halton exact toets" ~ "Fisher-Freeman- Halton exact toets",
      sToetsnaam == "Friedmans ANOVA I" ~ "Friedman's ANOVA I",
      sToetsnaam == "Friedmans ANOVA II" ~ "Friedman's ANOVA II",
      #sToetsnaam == "Chi-kwadraat toets trend" ~ "Chi-kwadraat toets (trend)",
      TRUE ~ sToetsnaam
    )
}

## Functie om een toetscel te maken (enkelvoudig)
maak_html_toetscel <- function(published, sToets, sModus) {
  # Verwijder voorloopcijfers van de naam
  # Vervang de spaties door dashes
  sToets_naam    <- Corrigeer_toetsnaam(Verwijder_voorloop_cijfers(sToets))
  sToets_dashed  <- Vervang_spaties_door_dashes(sToets)
  sToets_url     <- Maak_url(published, sModus, sToets_dashed)
  ## Als de toets gepubliceerd is, gebruik dan published + a,
  ## anders unpublished en geen a.
  if (published) {
    htmltools::withTags(td(class = "innercell published",
      a(href = sToets_url,
        title = sToets_naam,
        sToets_naam)
    ))
  } else {
    htmltools::withTags(td(class = "innercell unpublished",
      sToets_naam
    ))
  }
}

## Functie om een toetscel te maken (gecombineerd)
maak_html_toetscel_combi <- function(published_1, sToets_1, 
                                     published_2, sToets_2,
                                     sModus) {
  # Verwijder voorloopcijfers van de namen
  # Vervang de spaties door dashes
  sToets_naam_1    <- Corrigeer_toetsnaam(Verwijder_voorloop_cijfers(sToets_1))
  sToets_dashed_1  <- Vervang_spaties_door_dashes(sToets_1)
  sToets_url_1     <- Maak_url(published_1, sModus, sToets_dashed_1)
  sToets_naam_2    <- Corrigeer_toetsnaam(Verwijder_voorloop_cijfers(sToets_2))
  sToets_dashed_2  <- Vervang_spaties_door_dashes(sToets_2)
  sToets_url_2     <- Maak_url(published_2, sModus, sToets_dashed_2)
  ## Als de toets gepubliceerd is, gebruik dan published + a-tag,
  ## anders unpublished en geen a-tag.
  ## TODO: deze code onafhankelijk maken voor published_1 en published_2
  
    htmltools::withTags(td(class = "innercell",
      if (published_1) {            
      a(href = sToets_url_1,
        title = sToets_naam_1,
        class = "published",
        sToets_naam_1)
        } else {
        span(class = "unpublished", sToets_naam_1)
        },
      "/",
      if (published_2) {            
      a(href = sToets_url_2,
        title = sToets_naam_2,
        class = "published",
        sToets_naam_2)
        } else {
        span(class = "unpublished", sToets_naam_1)
        }))
}

## Functies om de toetsmatrix in HTML per regel op te bouwen
## Regel 1: 01-05
maak_html_r1 <- function() {
  htmltools::withTags(
    tr(
      td(rowspan = 5, class = "header1 innercell", "Type data"),
      td(rowspan = 2, class = "header2 innercell", "numeriek",tags$br(),"(continu)"),
      td(class = "header3 innercell", "normaal",tags$br(),"verdeeld"),
      ## Toets 01 tm 05
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[1,]$InGebruik)),  
                   dfToetsen[1,]$Toets, 
                   sModus = sModus),
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[2,]$InGebruik)),  
                   dfToetsen[2,]$Toets, 
                   sModus = sModus),
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[3,]$InGebruik)),  
                   dfToetsen[3,]$Toets, 
                   sModus = sModus),
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[4,]$InGebruik)),  
                   dfToetsen[4,]$Toets, 
                   sModus = sModus),
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[5,]$InGebruik)),  
                   dfToetsen[5,]$Toets, 
                   sModus = sModus)
    )
  )
}

## Regel 2: 06-10
maak_html_r2 <- function() {
  htmltools::withTags(
    tr(
      td(class = "header3 innercell", "niet normaal",tags$br(),"verdeeld"),
      ## Toets 06 tm 10
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[6,]$InGebruik)),  
                   dfToetsen[6,]$Toets, 
                   sModus = sModus),
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[7,]$InGebruik)),  
                   dfToetsen[7,]$Toets, 
                   sModus = sModus),
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[8,]$InGebruik)),  
                   dfToetsen[8,]$Toets, 
                   sModus = sModus),
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[9,]$InGebruik)),  
                   dfToetsen[9,]$Toets, 
                   sModus = sModus),
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[10,]$InGebruik)),  
                   dfToetsen[10,]$Toets, 
                   sModus = sModus)
    )
  )
}

## Regel 3: 11-15
maak_html_r3 <- function() {
  htmltools::withTags(
    tr(
      td(rowspan = 3, class = "header2 innercell", "categorisch",tags$br(),"(discreet)"),
      td(class = "header3 innercell", "binair", tags$br(), "(2 waarden)"),
      ## Toets 11 tm 15
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[11,]$InGebruik)),  
                   dfToetsen[11,]$Toets, 
                   sModus = sModus),
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[12,]$InGebruik)),  
                   dfToetsen[12,]$Toets, 
                   sModus = sModus),
      ## Combinatie: Chi-kwadraat toets / Fisher's exact toets
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[13,]$InGebruik)),  
                   dfToetsen[13,]$Toets,
                   sModus = sModus),
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[15,]$InGebruik)),  
                   dfToetsen[15,]$Toets, 
                   sModus = sModus),
      ## Combinatie: Chi-kwadraat toets / Fisher-Freeman-Halton exact toets
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[16,]$InGebruik)),  
                         dfToetsen[16,]$Toets,
                         sModus = sModus)
    )
  )
}

## Regel 4: 12,16-19
maak_html_r4 <- function() {
  htmltools::withTags(
    tr(
      td(class = "header3 innercell", "nominaal ",tags$br(), "(>2 waarden)"),
      ## Toets 16 tm 19
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[17,]$InGebruik)),
                         dfToetsen[17,]$Toets,
                         sModus = sModus),
      ## McNemar
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[18,]$InGebruik)),  
                         dfToetsen[18,]$Toets, 
                         sModus = sModus),
      ## Combinatie: Chi-kwadraat toets / Fisher-Freeman-Halton exact toets
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[19,]$InGebruik)),  
                         dfToetsen[19,]$Toets,
                         sModus = sModus),
      ## GLM/GEE
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[20,]$InGebruik)),
                   dfToetsen[20,]$Toets,
                   sModus = sModus),
      ## Chi-kwadraat toets (trend)
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[21,]$InGebruik)),  
                         dfToetsen[21,]$Toets,
                         sModus = sModus)
    )
  )
}

## Regel 5: test
maak_html_r5 <- function() {
  htmltools::withTags(
    tr(
      td(class = "header3 innercell", "ordinaal"),
      ## Toets 16 tm 19
      #maak_html_toetscel(F,  
      #                   "...", 
      #                   sModus = sModus),
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[17,]$InGebruik)),
                         dfToetsen[17,]$Toets,
                         sModus = sModus),
      ## Wilcoxon
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[22,]$InGebruik)),  
                         dfToetsen[22,]$Toets, 
                         sModus = sModus),
      ## Chi-kwadraat toets (trend)
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[23,]$InGebruik)),
                         dfToetsen[23,]$Toets,
                         sModus = sModus),
      ## Friedman's ANOVA
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[24,]$InGebruik)),  
                         dfToetsen[24,]$Toets, 
                         sModus = sModus),
      ## Chi-kwadraat toets (trend)
      maak_html_toetscel(as.logical(as.numeric(dfToetsen[25,]$InGebruik)),
                         dfToetsen[25,]$Toets,
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

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 3.2 DOEL ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## De regels die we opbouwen moeten er als volgt uit komen te zien:
## Regel 1
# <tr>
#     <td rowspan="4" class="header1 innercell">Type data</td>
#     <td rowspan="2" class="header2 innercell">numeriek<br/>(continu)</td>
#     <td class="header3 innercell">normaal<br/>verdeeld</td>
#     <td class="innercell published"><a href="R/01-One-sample-t-toets-R.html" title="">One sample t-toets</a></td>
#     <td class="innercell published"><a href="R/02-Gepaarde-t-toets-R.html" title="">Gepaarde t-toets</a></td>
#     <td class="innercell published"><a href="R/03-Ongepaarde-t-toets-R.html" title="">Ongepaarde t-toets</a></td>
#     <td class="innercell unpublished"><a href="" title="">Linear mixed models</a></td>
#     <td class="innercell published"><a href="R/05-One-way-ANOVA-R.html" title="">One-way ANOVA</a></td>
# </tr>

## Regel 2
# <tr>
#     <td class="header3 innercell">niet normaal<br/>verdeeld</td>
#     <td class="innercell unpublished"><a href="" title="">Tekentoets</a></td>
#     <td class="innercell published"><a href="R/07-Wilcoxon-signed-rank-toets-R.html" title="">Wilcoxon signed rank toets</a></td>
#     <td class="innercell published"><a href="R/08-Mann-Whitney-U-toets-R.html" title="">Mann-Whitney U toets</a></td>
#     <td class="innercell unpublished"><a href="" title="">Friedman toets</a></td>
#     <td class="innercell published"><a href="R/10-Kruskal-Wallis-toets-R.html" title="">Kruskal Wallis toets</a></td>
# </tr>

## Regel 3
# <tr>
#     <td rowspan="2" class="header2 innercell"> categorisch<br/>(discreet)</td>
#     <td class="header3 innercell">binair</td>
#     <td class="innercell unpublished"><a href="" title="">z-test voor proporties</a></td>
#     <td class="innercell unpublished"><a href="" title="">McNemar toets</a></td>
#     <td class="innercell published"><a href="R/13-Chi-kwadraat-toets-R.html" title="">Chi-kwadraat toets / Fisher's exact toets</a></td>
#     <td class="innercell unpublished"><a href="" title="">Cochran's Q toets</a></td>
#     <td class="innercell unpublished"><a href="" title="">Chi-kwadraat toets</a>/<br/><a href="" title="">Fisher-Freeman-<br/>Halton exact toets</a></td>
# </tr>

## Regel 4
# <tr>
#     <td class="header3 innercell">nominaal /<br/>ordinaal</td>
#     <td class="innercell unpublished">...</td>
#     <td class="innercell unpublished"><a href="" title="">McNemar toets</a>/<br/><a href="" title="">Wilcoxon signed rank toets</a></td>
#     <td class="innercell unpublished"><a href="" title="">Chi-kwadraat toets</a> (trend)</td>
#     <td class="innercell unpublished"><a href="" title="">GLMM/GEE</a></td>
#     <td class="innercell unpublished"><a href="" title="">Chi-kwadraat toets</a> (trend)</td>
# </tr>
