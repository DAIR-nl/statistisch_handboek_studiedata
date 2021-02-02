## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Toetsmatrix_functies.R ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R code voor het Statistisch Handboek van het Versnellingsplan
## Copyright 2020 VU
## Web Page: http://www.vu.nl
## Contact: Theo Bakker (t.c.bakker@vu.nl)
##
## Doel: Functies om toetsmatrix op te bouwen
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
## 09-09-2020: EG: Aanmaak bestand
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

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
      sToetsnaam == "Chi-kwadraat toets voor onafhankelijkheid en Fishers exacte toets" ~ "Chi-kwadraat toets voor onafhankelijkheid en Fisher's exacte toets",
      sToetsnaam == "Cochrans Q toets" ~ "Cochran's Q toets",
      sToetsnaam == "Fisher-Freeman-Halton exact toets" ~ "Fisher-Freeman-Halton exact toets",
      sToetsnaam == "Friedmans ANOVA I" ~ "Friedman's ANOVA I",
      sToetsnaam == "Friedmans ANOVA II" ~ "Friedman's ANOVA II",
      sToetsnaam == "Moods mediaan toets" ~ "Mood's mediaan toets",
      sToetsnaam == "Factoriele ANOVA" ~ "Factoriële ANOVA",
      sToetsnaam == "Factoriele repeated measures ANOVA" ~ "Factoriële repeated measures ANOVA",
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
        span(class = "unpublished", sToets_naam_2)
        }))
}