## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Header.R ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R code voor het Statistisch Handboek van het Versnellingsplan
## Copyright 2020 VU
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
## 08-02-2020: TB: Verbetering verwijzing naar Root
## 11-03-2021: EG: Toelichting toegevoegd
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Toelichting: In dit script wordt de header van de website aangemaakt. Via 
## deze header kan de bezoeker van de website klikken op de verschillende
## onderdelen van de website. Op dit moment bestaat de header van de website
## uit de onderdelen Toetsmatrix (R), Toetsmatrix (Python), Begrippenlijst,
## Over, Verantwoording, Feedback en Nieuwsbrief. Feedback en Nieuwsbrief
## linken door naar een google form. Het google form voor Feedback dient om 
## gebruikers de mogelijkheid te geven feedback op de toetspagina te geven. Het
## google form voor Nieuwsbrief dient om je op te geven voor de nieuwsbrief van
## het Statistisch Handboek. Dit script is een combinatie van R 
## code en html code.

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 01 MAAK HTML ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Plaats  variabelen in een lijst: de root van de site; als de modus gelijk is 
## aan Root, verwijs dan nergens naar, verwijs anders naar de bovenliggende 
## directory
if (!exists("sModus")) {
  sModus <- "Root"
}
sRoot <- case_when(
  sModus %in% c("R","Python") ~ "../",
  TRUE ~ ""
) 

lVars <- list(
  sRoot = sRoot
)

## Fix for rmarkdown 2.6
## https://github.com/yihui/xaringan/issues/293#issuecomment-761973964
options(htmltools.preserve.raw = FALSE)

## Plaats deze nu in een header; gebruik htmltools::htmlPreserve om
## HTML te behouden. Nodig om in markdown HTML te tonen.
thisHeader <- Substitute_var(htmltools::htmlPreserve('
<div class="navbar navbar-default navbar-fixed-top" role="navigation">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="`sRoot`Index.html">Statistisch Handboek Studiedata</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav navbar-start">
        <li>
  <a href="`sRoot`R/Toetsmatrix.html">Toetsmatrix (R)</a>
</li>
<li>
  <a href="`sRoot`Python/Toetsmatrix.html">Toetsmatrix (Python)</a>
</li>
<li>
  <a href="`sRoot`Begrippenlijst.html">Begrippenlijst</a>
</li>
<li>
  <a href="`sRoot`Over.html">Over</a>
</li>
<li>
  <a href="`sRoot`Verantwoording.html">Verantwoording</a>
</li>
<li>
  <a href="https://docs.google.com/forms/d/1UQcCVTNLpVAg7vSffJCPkBCklsfMlGB0QxyxLDgqosI/edit" target=\"_blank\">Feedback</a>
</li>
<li>
  <a href="https://docs.google.com/forms/d/1d2jQRQyFvLw7FvFB8iLs5X0lWH7ydEt1XjErQM7Tq5M/viewform?ts=5e7878b6&edit_requested=true" target=\"_blank\">Nieuwsbrief</a>
</li>
      </ul>
      <ul class="nav navbar-nav navbar-right">

      </ul>
    </div><!--/.nav-collapse -->
  </div><!--/.container -->
</div>'), lVars)

## Toon het resultaat
writeLines(thisHeader)
