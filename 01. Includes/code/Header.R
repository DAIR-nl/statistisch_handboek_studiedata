## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Header.R ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R code voor Student Analytics Vrije Universiteit Amsterdam
## Copyright 2019 VU
## Web Page: http://www.vu.nl
## Contact: Theo Bakker (t.c.bakker@vu.nl)
##
## Doel: De header voor de website
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
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 01 MAAK HTML ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Plaats  variabelen in een lijst: de root van de site
lVars <- list(
  sRoot = paste0(here::here(),"/_site")
)

## Plaats deze nu in een header; gebruik htmltools::htmlPreserve om
## HTML te behouden. Nodig om in markdown HTML te tonen.
thisHeader <- Substitute_var(htmltools::htmlPreserve('
<div class="navbar navbar-default  navbar-fixed-top" role="navigation">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="`sRoot`/index.html">Statistisch Handboek Hoger Onderwijs</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li>
  <a href="`sRoot`/Toetsmatrix.html">Toetsmatrix</a>
</li>
<li>
  <a href="`sRoot`/Over.html">Over</a>
</li>
<li>
  <a href="`sRoot`/Licentie.html">Licentie</a>
</li>
      </ul>
      <ul class="nav navbar-nav navbar-right">

      </ul>
    </div><!--/.nav-collapse -->
  </div><!--/.container -->
</div>'), lVars)

## Toon het resultaat
writeLines(thisHeader)
