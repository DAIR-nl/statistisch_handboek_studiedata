## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Render notebook.R
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R code voor het Statistisch Handboek van het Versnellingsplan
## Copyright 2020 VU
## Web Page: http://www.vu.nl
## Contact: Theo Bakker (t.c.bakker@vu.nl)
## Verspreiding buiten de VU: Nee
##
## Doel: Dit script voert het renderen van het notebook uit. De output is een
## html pagina met alle plots. Na het renderen wordt deze output weggeschreven
## naar de network directory in de folder Modellen.
##
## Afhankelijkheden: Index.R
##
## Datasets: Geen
##
## Opmerkingen:
## 1) Geen
##
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## TODO:
## 1) Geen
##
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Geschiedenis:
## 24-08-2017: JvZ: Aanmaak bestand
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## RENDER NOTEBOOK ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

file.remove("04. Modelleren/Aantal EC tm jaar 2/Exploreren_Aantal_EC.nb.html")
rmarkdown::render("04. Modelleren/Aantal EC tm jaar 2/Exploreren_Aantal_EC.Rmd")

## Kopieer het bestand naar de network directory
file.copy("04. Modelleren/Aantal EC tm jaar 2/Exploreren_Aantal_EC.nb.html",
          paste0(Network_directory,"/Modellen/Exploreren_Aantal_EC",Sys.Date(),".nb.html"),
          overwrite = T)

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## RENDER BOOKDOWN ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

wd_Origineel <- getwd()
setwd("04. Modelleren/Aantal EC tm jaar 2/")
bookdown::render_book("index.Rmd")
setwd(wd_Origineel)





