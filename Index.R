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
## 06-09-2019: MK: Opvulling bestand
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## De hoofdstructuur is:
## Vooraf: vaststellen van de working directory, inlezen van functies en het aanmaken
## van directories
## 1) Voer voorbereidingen uit
## 2) Definiëer tekstblocks (Irene)
## 3) Definiëer codeblocks (Megiel)
## 4) Definiëer css blocks (Megiel)
## 3) Render Markdown
## 4) Sluit af en ruim op

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 01 VOORBEREIDINGEN ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## installeer en laad benodigde packages
if (!require("stringr")) install.packages("stringr")
library("stringr")
if (!require("rlist")) install.packages("rlist")
library("rlist")
if (!require("car")) install.packages("car")
library("car")
if (!require("nortest")) install.packages("nortest")
library("nortest")
if (!require("dplyr")) install.packages("dplyr")
library("dplyr")
if (!require("effsize")) install.packages("effsize")
library("effsize")
if (!require("ggplot2")) install.packages("ggplot2")
library("ggplot2")
if (!require("plotly")) install.packages("plotly")
library("")
if (!require("tidyverse")) install.packages("tidyverse")
library("tidyverse")
if (!require("ggridges")) install.packages("ggridges")
library("ggridges")
if (!require("graphics")) install.packages("graphics")
library("graphics")
if (!require("rapport")) install.packages("rapport")
library("rapport")

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 02 DEFINIEER TOETSBLOCKS ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 03 DEFINIEER CODEBLOCKS ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

YAML_HEADER <- 

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 04 DEFINIEER CSS BLOCKS ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 05 RENDER MARKDOWN ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

toetsenlijst <- list.files(path = "02. Markdown/")
toetsenlijst <- sapply("02. Markdown", paste, toetsenlijst,  sep = "/")
toetsenlijst <- toetsenlijst[-1]
html_indices <- grep(".html", toetsenlijst)
html_paginas <- toetsenlijst[html_indices]
toetsenlijst <- toetsenlijst[-html_indices]


sapply(html_paginas, file.remove)
sapply(toetsenlijst, render)
  
## als je 1 specifieke pagina wil renderen gebruik je in de console `render(toetsenlijst[toetsnummer]`.



## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 06 RUIM OP ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
