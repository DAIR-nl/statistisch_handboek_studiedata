## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Index_Datasets_opslaan.R ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R code voor Student Analytics Vrije Universiteit Amsterdam
## Copyright 2021 VU
## Web Page: http://www.vu.nl
## Contact: Theo Bakker (t.c.bakker@vu.nl)
## Verspreiding buiten de VU: Nee
##
## Doel: Een zip-file van datasets maken
##
## Afhankelijkheden: Afhankelijkheid
##
## Datasets: Datasets
##
## Opmerkingen:
## 1) Geen.
## 2) ___
##
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## TODO:
## 1) ___.
##
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Geschiedenis:
## 04-02-2021: EG: Aanmaak bestand
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 01 ZIP BESTAND AANMAKEN MET DATASETS ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Maak een vector met de nummers van de data simulatiescripts waarvan datasets
## opgeslagen moeten worden
Bestanden <- c("01","02","03","04","05")

## Run over alle data opgegeven data simulatiescripts
for (i in 1:length(Bestanden)) {
  
  ## Run het simulatiescript
  source(paste0("01. Includes/data/",
                Bestanden[i],
                ".R"))
  
  ## Sla de datasets op in een lijst
  Datasets <- mget(ls())
  
  ## Verwijder de vector met bestanden en de indices i en j van de for loops
  Datasets_opslaan <- Datasets[names(Datasets) != "i" & names(Datasets) != "j" & names(Datasets) != "Bestanden"]
  
  ## Bepaal het aantal datasets om op te slaan
  Aantal_datasets_opslaan <- length(Datasets_opslaan)
 
   ## Run over alle datasets
  for (j in 1:Aantal_datasets_opslaan) {
    
    ## Sla de dataset op als csv-bestand in de map 05. Datasets
    write.csv(Datasets_opslaan[[j]],
              file = paste0("05. Datasets/",
                            Bestanden[i],
                            "_",
                            names(Datasets_opslaan)[j],
                            ".csv"))
  }
  
  ## Verwijder nu alle elementen uit de workspace behalve Bestanden en i, de
  ## index van de for loop
  rm(list = setdiff(ls(), 
                    c("Bestanden",
                      "i")))
  
  ## Print i om de voortgang van de for loop bij te houden
  print(i)
  
  }

## Sla de bestandsnamen van de datasets op
Bestandsnamen_datasets <- list.files(paste0(getwd(),
                                            "/05. Datasets"))
## Sla de volledige paden op
Bestandsnamen_datasets_volledig_path <- paste0(getwd(),
                                               "/05. Datasets/",
                                               Bestandsnamen_datasets)
## Maak een zip-bestand
zip::zipr(zipfile = paste0(getwd(),
                           "/Datasets_zipbestand"), 
          files = Bestandsnamen_datasets_volledig_path)
