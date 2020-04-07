## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Index_Sitemap.R ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R code voor het Statistisch Handboek van het Versnellingsplan
## Copyright 2020 VU
## Web Page: http://www.vu.nl
## Contact: Theo Bakker (t.c.bakker@vu.nl)
##
## Doel: Het aanmaken van een sitemap.xml en die naar de server FTP-en
##
## Afhankelijkheden: De live website www.sh-studiedata.nl
##
## Datasets: dfToetsen (via 01. Includes/code/Toetsen.R)
##
## Opmerkingen: 
## 1) Geen.
## 2) ___
##
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Geschiedenis:
## 22-02-2020: TB: Aanmaak bestand
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 00 VOORBEREIDINGEN ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Installeer packages en functies
source("99. Functies en Libraries/00. Voorbereidingen.R")

## Installeer aanvullende packages en functies
library(whisker) # Library om te werken met templates
library(httr)    # Library om een webpagina te openen
library(RCurl)   # Library om een pagina te ftp-en
library(glue)    # Library om strings aan elkaar te plakken met placeholders

## Het basis xml template
xmltemplate <- '<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">
<!-- Built by Statistisch Handboek Studiedata Versnellingsplan VU -->
 {{#lPaginas}}
   <url>
      <loc>{{{loc}}}</loc>
      <lastmod>{{{lastmod}}}</lastmod>
      <changefreq>{{{changefreq}}}</changefreq>
      <priority>{{{priority}}}</priority>
   </url>
 {{/lPaginas}}
</urlset>
'


## Functie om links te maken
map_links <- function(l) {
  sRoot  <- "http://www.sh-studiedata.nl/"
  thisUrl <- paste0(sRoot, l, if (l != "") {".html"})
  print(thisUrl)
  
  ## Test de url en haal de datum van de laatste wijziging op
  tmp <- GET(thisUrl)
  d <- tmp$headers[['last-modified']]
  
  ## Bepaal de priority voor deze url: root 1.0, toetsmatrix 0.8, overige 0.5
  ## en de Changefreq: root en toetsmatrix daily, overige weekly
  if (l == "") {
    thisPriority  <- "1.0"
    thisChangefreq <- "daily"
  }
  else if (str_detect(l, "Toetsmatrix")) {
    thisPriority  <- "0.8"
    thisChangefreq <- "daily"
  } else
  {
    thisPriority  <- "0.5"
    thisChangefreq <- "weekly"
  }

  ## Maak een lijst van de attributen voor deze url
  list(loc = thisUrl,
       lastmod = format(as.Date(d,format = "%a, %d %b %Y %H:%M:%S")),
       changefreq = thisChangefreq,
       priority = thisPriority)
}

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 01 BEPAAL DE TOETSEN ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

source("01. Includes/code/Toetsen.R")

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 02 BEPAAL DE PAGINAS WAARVAN EEN SITEMAP GEMAAKT MOET WORDEN ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Maak een lijst van standaard urls
lPaginas <- c(
  "", # De root
  "Index",
  "Licentie",
  "Over",
  "Verantwoording",
  "R/Toetsmatrix",
  "Python/Toetsmatrix"
)

## Loop over de toetsen die in gebruik zijn en voeg die toe aan de lijst
for (sToets in dfToetsen$Toets[dfToetsen$InGebruik_R == 1]) {
  p <- "R"
  lPaginas <- c(lPaginas, paste0(p, "/", gsub(" ", "-", sToets), "-", p))
}
for (sToets in dfToetsen$Toets[dfToetsen$InGebruik_Python == 1]) {
  p <- "Python"
  lPaginas <- c(lPaginas, paste0(p, "/", gsub(" ", "-", sToets), "-", p))
}


## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 03 PAS DE FUNCTIE map_links TOE OP DE PAGINALIJST EN CREËER EEN SITEMAP ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


lPaginas <- lapply(lPaginas, map_links)

print(paste(length(lPaginas), "pagina's staan in de sitemap"))

## Als _site folder niet bestaat, maak deze dan aan
ifelse(!dir.exists("_site"), dir.create("_site"), FALSE)

sink("_site/sitemap.xml")
cat(whisker.render(xmltemplate))
sink()

# browseURL("_site/sitemap.xml")

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 04 FTP DE SITEMAP NAAR DE LIVE SITE ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


## Plaats het bestand op de FTP server; gebruik verbose = TRUE om te zien 
## wat de server antwoordt

user      <- "jlweb32049"
password  <- "k35xDLUYUAIeRUZIDdej"
server    <- "ftp://jlweb320.prolocation.net/html"

ftpUpload(what = "_site/sitemap.xml",
          to = glue("{server}/sitemap/sitemap.xml"),
          verbose = TRUE,
          userpwd = glue("{user}:{password}"), 
          ftp.ssl = TRUE, 
          ssl.verifypeer = FALSE, 
          ssl.verifyhost = FALSE
          )

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 05 RUIM LOKALE OBJECTEN OP ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

rm(dfToetsen, lPaginas, xmltemplate, p, sToets, password, server, user, map_links)
