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

## Toelichting: in dit script wordt een xml-bestand aangemaakt wat vervolgens
## via WINSCP aan de website wordt toegevoegd. Het xml-bestand zorgt ervoor dat
## de website van het Statistisch Handboek beter te vinden is via google. 
## Daarom is het belangrijk dit script te runnen. Na het updaten van de website
## via het script Index_Render_site.R wordt de map _site geüpload via WINSCP om
## de website te updaten. Als dit gedaan is, run dan dit script. Dat zorgt 
## ervoor dat de meest recente versie van de website gebruikt wordt voor het
## maken van het xml-bestand en in dit script wordt het xml-bestand ook
## met code geüpload naar de website via WINSCP.

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

## In dit deel wordt een overzicht gemaakt van alle toetsen die nu op de website
## staan. Dit overzicht komt uit het bestand Toetsen.R uit de map 
## SHHO/01. Includes/code . Het is daarom belangrijk om op te letten dat het
## overzicht met toetsen in het script Index_Render_site.R en het overzicht in
## Toetsen.R hetzelfde is. Houdt dit bij en ga dit na.

source("01. Includes/code/Toetsen.R")

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 02 BEPAAL DE PAGINAS WAARVAN EEN SITEMAP GEMAAKT MOET WORDEN ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## In dit deel wordt een overzicht gemaakt van alle onderdelen van de website.
## De website heeft verschillende onderdelen waarop je kan doorklikken. Om
## het xml-bestand aan te maken, zijn alle onderdelen nodig, in dit deel worden
## deze verzameld.

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

## In dit deel wordt de sitemap aangemaakt door de functie map_links toe te
## passen op alle onderdelen van de website (de onderdelen zijn opgeslagen in
## lPaginas). Het xml-bestand komt te staan in de map _site.

lPaginas <- lapply(lPaginas, map_links)

print(paste(length(lPaginas), "pagina's staan in de sitemap"))

## Als _site folder niet bestaat, maak deze dan aan
ifelse(!dir.exists("_site"), dir.create("_site"), FALSE)

sink("_site/sitemap.xml")
cat(whisker.render(xmltemplate))
sink()

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 04 RUIM LOKALE OBJECTEN OP ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

rm(dfToetsen, lPaginas, xmltemplate, p, sToets, password, server, user, map_links)
