## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Index.R
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R code voor Student Analytics Vrije Universiteit Amsterdam
## Copyright 2019 VU
## Web Page: http://www.vu.nl
## Contact: Theo Bakker (t.c.bakker@vu.nl)
## Project: Versnellingsagenda - Statistisch Handboek HO
##
## Doel: Index bestand voor het uitvoeren van statistische toetsen
##
## Afhankelijkheden: Geen
##
## Datasets: Geen
##
## Opmerkingen: 
## 1) Geen.
## 2) ___
##
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Geschiedenis:
## 26-07-2019: TB: Aanmaak bestand
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## De hoofdstructuur is:
## Vooraf: vaststellen van de working directory, inlezen van functies en het aanmaken
## van directories
## 1) Voer voorbereidingen uti
## 2) Voer toetsen uit
## 3) Sluit af en ruim op

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 01 VOORBEREIDINGEN ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library(stringr)
library(rlist)
library(rmarkdown)
library(ggplot2)
library(rapport)

toetsenlijst <- list.files(path = "02. Markdown/")
toetsenlijst <- sapply("02. Markdown", paste, toetsenlijst,  sep ="/")
toetsenlijst <- toetsenlijst [-1]
    html_indices <- grep(".html", toetsenlijst)
html_paginas <- toetsenlijst[html_indices]
toetsenlijst <- toetsenlijst[-html_indices]


Bekijk_voortgang <- function(){
  toetsnummers <- str_extract(toetsenlijst, "[0-9]+")
  toetsenlijst <- sapply("02. Markdown", paste, toetsenlijst,  sep ="/")
  html_indices <- grep(".html", toetsenlijst)
  html_paginas <- toetsenlijst[html_indices]
  if (!is_empty(html_indices)) {
    toetsenlijst <- toetsenlijst[-html_indices] }
  
  versies <- list()
  for (toetsnaam in toetsenlijst) {
    toetspagina <- read_file(toetsnaam)
    if (str_detect(tolower("versie 1.0", toetspagina()))) {
      versie <- 7
    } else if (str_detect(tolower("versie 0.6", toetspagina))) {
     versie <- 6
    } else if (str_detect(tolower("versie 0.5", toetspagina))) {
      versie <- 5
    } else if (str_detect(tolower("versie 0.4", toetspagina))) {
      versie <- 4
    } else if (str_detect(tolower("versie 0.3", toetspagina))) {
      versie <- 3
    } else if (str_detect(tolower("versie 0.2", toetspagina))) {
      versie <- 2
    } else if (str_detect(tolower("versie 0.1", toetspagina))) {
      versie <- 1
 }
 append(versies, versie)
  }
  
 voortgang <- data.frame(toetsnummers, versies)
 ggplot(voortgang, aes(x = toetsen, y = versies)) +
  geom_barplot(aes(y = versies),
                 binwidth = 1) +
  ylab("Versie") +
  xlab("Toetspagina") +
  scale_x_continuous(labels = as.character(seq(1, 19)), breaks = seq(1, 19)) +
  scale_y_discrete(labels = c("Data klaar", "Tekst klaar", "Review Megiel", "Review Theo", "Review VU-A", "Review wetenschap", "Pagina af"))
  labs(title = "Voortgang SHHO") +
  coord_flip()

}

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 02 RENDER TOETSEN ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



sapply(html_paginas, file.remove)
sapply(toetsenlijst, render)
  
## als je 1 specifieke pagina wil renderen gebruik je in de console `render(toetsenlijst[toetsnummer]`.



## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## RUIM OP ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
