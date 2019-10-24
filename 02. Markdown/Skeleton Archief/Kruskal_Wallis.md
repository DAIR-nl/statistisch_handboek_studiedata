---
output:
  html_document:
    theme: lumen
    toc: yes
    toc_float: 
      collapsed: FALSE 
    number_sections: true
    keep_md: true
  keywords: [statistisch handboek, studiedata]
  
---

---
title: Kruskal Wallis
date: "versie 0.1, 23-10-2019"
number-sections: yes
---


<!-- CSS -->
<style>
<!--html_preserve-->/* Stylesheet Statistisch Handboek */

/* Title */
h1.title {
    opacity: 1;
    text-align: left;
    color: #158CBA;
}

/* Casus */
#casus {
    display: block;
    padding: 9.5px;
    margin: 0 0 10px;
    font-size: 14px;
    line-height: 2;
    color: #000000;
    background-color: #f5f5f5;
    border: 1px solid #158CBA;
    border-radius: 4px;
}

/* Empty data */
.empty{
    display: block;
    color: #FF0000;
}

/* Klippy */
.btn-klippy .octicon {
    display: inline-block;
    margin: 2px;
    padding: 2px;
    width: 15px !important;
}

/* Main container */
.main-container {
    margin-top: 50px;
}

/* Toetsmatrix */
table.toetsmatrix {
    text-align: center;
    margin: 5px;
    padding: 5px;
}


td.header1 {
    font-weight: bold;
    color: #FFFFFF;
    background-color: #158CBA;
    text-align: center;
}

td.header2 {
    font-weight: bold;
    color: #FFFFFF;
    background-color: #A6A6A6;
    text-align: center;
}

td.header3 {
    font-weight: bold;
    background-color: #D9D9D9;
    text-align: center;
}

table.toetsmatrix td {
    border-color: #000000 !important;
    padding: 10px;
}

td.innercell{
    border: 1px solid #000000;
}

td.innercell a {
    text-decoration: none;
}

td.innercell a:hover {
    text-decoration: underline;
}

td.published {
    color: #158cba;
}

td.unpublished, td.unpublished a {
    color: #A6A6A6;
}

td.unpublished a:hover {
    color: #A6A6A6;
    text-decoration: none;
}

/* Footer */
#footer {
 color: #808080;
 background-image: url('images/VPO_logo_studiedata.png');
 background-repeat: no-repeat;
 background-position: right;
 background-size: 230px auto;
 padding-right: 242px;
}
<!--/html_preserve-->
</style>

<!-- Header -->
<!--html_preserve-->
<div class="navbar navbar-default  navbar-fixed-top" role="navigation">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/Users/theo/Dropbox/Bitbucket/sho_skeleton/_site/index.html">Statistisch Handboek Hoger Onderwijs</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li>
  <a href="/Users/theo/Dropbox/Bitbucket/sho_skeleton/_site/Toetsmatrix.html">Toetsmatrix</a>
</li>
<li>
  <a href="/Users/theo/Dropbox/Bitbucket/sho_skeleton/_site/Over.html">Over</a>
</li>
<li>
  <a href="/Users/theo/Dropbox/Bitbucket/sho_skeleton/_site/Licentie.html">Licentie</a>
</li>
      </ul>
      <ul class="nav navbar-nav navbar-right">

      </ul>
    </div><!--/.nav-collapse -->
  </div><!--/.container -->
</div><!--/html_preserve-->

<!-- Klippy: kopieer code -->


<!-- 0. Dummydata -->
<!-- ## BLOK: Toets-dummydata.R -->

<!-- ## /BLOK: Toets-dummydata.R -->
<!-- ![Caption](images/zone-logo.png) -->

<!-- 1. Toepassing -->
[//Toepassing]: # Toepassing
# Toepassing
Gebruik de *Kruskal Wallis toets* om te toetsen of de medianen van meerdere groepen significant verschillen. Een kenmerk van de data is dat deze numeriek en ongepaard is.  

De *Kruskal Wallis* ordent de scores van laag naar hoog en ze geeft de scores een rangnummer. Op deze wijze zijn outliers en de assumptie normaliteit geen probleem meer.[^12] De *Kruskal Wallis* in plaats van de de *one way ANOVA* gebruikt als de assumpties van normaliteit en/of van Homogeniteit van Varianties worden geschonden.[^12]  

<!-- 2. Onderwijscasus -->
[//Onderwijscasus]: # Onderwijscasus
# Onderwijscasus
<div id = "casus">
De opleidingsdirecteur van de tweejarige Masteropleiding Arbeidsrecht is geï¿½nteresseerd in de afstudeersnelheid van zijn studenten. Hij vraagt zich af of het type vooropleiding bepalend is voor hoeveel vakken de studenten afronden in het eerste jaar. Hij kijkt naar de vier meest gangbare vooropleidingen die de studenten doorlopen voordat ze met de Master Arbeidsrecht beginnen; de bachelors: fiscaal recht, notarieel recht, rechtsgeleerdheid en een schakelprogramma.  

H~0~: De vooropleiding is niet bepalend voor het aantal vakken die de Masterstudenten Arbeidsrecht behalen in het eerste jaar. De gemiddelde rank is per groep ongeveer gelijk aan elkaar. 

H~1~: De vooropleiding is bepalend voor het aantal vakken die de Masterstudenten Arbeidsrecht behalen in het eerste jaar. De gemiddelde rank is per groep ongeveer gelijk aan elkaar. 
</div>

<!-- 3. Assumpties -->
[//Assumpties]: # Assumpties







[//Toetsen van homogeniteit van varianties]: # Toetsen van homogeniteit van varianties



<!-- 4. Effectmaat -->
[//Effectmaat]: # Effectmaat




<!-- 5. Uitvoering in R -->
[//Uitvoering in R]: # Uitvoering in R
# Uitvoering in R
Er is een dataset ingeladen met studieresultaten van de master arbeidsrecht per vooropleiding: Fiscaal recht, Notarieel recht, Rechtsgeleerdheid en een Schakelprogramma.

[//Gemiddelde en standaarddeviatie]: # Gemiddelde en standaarddeviatie 
 


<!-- ## BLOK: Toets-datainspectie.R -->

```r
## De data bekijken
head(Resultaten_arbeidsrecht)
##   Studentnr     Vooropleiding Ec_jaar1
## 1   3174851   Notarieel recht       54
## 2   3499521 Rechtsgeleerdheid       36
## 3   3093697  Schakelprogramma       36
## 4   3170000     Fiscaal recht       60
## 5   3199467   Notarieel recht       54
## 6   3611663     Fiscaal recht       30
levels(Resultaten_arbeidsrecht$Vooropleiding)
## [1] "Fiscaal recht"     "Notarieel recht"   "Rechtsgeleerdheid"
## [4] "Schakelprogramma"

## mean in base R (mogelijkheid 1)
mean(Resultaten_arbeidsrecht$Ec_jaar1 [Vooropleiding=="Rechtsgeleerdheid"])
## [1] 38.27027
mean(Resultaten_arbeidsrecht$Ec_jaar1 [Vooropleiding=="Notarieel recht"])
## [1] 50.79452
mean(Resultaten_arbeidsrecht$Ec_jaar1 [Vooropleiding=="Fiscaal recht"])
## [1] 48.98734
mean(Resultaten_arbeidsrecht$Ec_jaar1 [Vooropleiding=="Schakelprogramma"])
## [1] 44.27027

## mean in package 'dplyr' (mogelijkheid 2)
library(dplyr)
group_by(Resultaten_arbeidsrecht, Vooropleiding) %>%
    summarise(
        count = n(),
        mean = mean(Ec_jaar1),
        median = median(Ec_jaar1)
    )
## # A tibble: 4 x 4
##   Vooropleiding     count  mean median
##   <fct>             <int> <dbl>  <dbl>
## 1 Fiscaal recht        79  49.0     54
## 2 Notarieel recht      73  50.8     54
## 3 Rechtsgeleerdheid    74  38.3     42
## 4 Schakelprogramma     74  44.3     48
```
<!-- ## /BLOK: Toets-datainspectie.R -->

[//Visuele inspectie van normaliteit]: # Visuele inspectie van normaliteit



[//Histogram]: # Histogram

<!-- ## BLOK: Toets-histogram.R -->

<!-- ## /BLOK: Toets-histogram.R -->


[//Q-Q plot]: # Q-Q plot


<!-- ## BLOK: Toets-qqplot.R -->

<!-- ## /BLOK: Toets-qqplot.R -->


[//Boxplot]: # Boxplot


<!-- ## BLOK: Toets-boxplot.R -->

<!-- ## /BLOK: Toets-boxplot.R -->


[//Toetsen van normaliteit]: # Toetsen van normaliteit


 
[//Kolmogorov-Smirnov test]: # Kolmogorov-Smirnov test


<!-- ## BLOK: Toets-kolmogorovsmirnov.R -->

<!-- ## /BLOK: Toets-kolmogorovsmirnov.R -->


[//Shapiro-Wilk test]: # Shapiro-Wilk test



<!-- ## BLOK: Toets-shapirowilk.R -->

<!-- ## /BLOK: Toets-shapirowilk.R -->


<!-- 6. Levenes Test -->
[//Levenes Test]: # Levenes Test

[//Levenes Test Inleiding]: # Levenes Test Inleiding

<!-- ## BLOK: Toets-levenestest.R -->

<!-- ## /BLOK: Toets-levenestest.R -->

<!-- 7. Toets -->
[//Toets]: # Toets
## Toets
[//Toets Inleiding]: # Inleiding
 <span class='empty'>!!  Uitvoering.Toets.Inleiding bestaat niet</span>

[//Toets Interpretatie output]: # Interpretatie output
<!-- ## BLOK: Toets-test.R -->

```r
## Kruskal Wallis
kruskal.test(Ec_jaar1 ~ Vooropleiding, Resultaten_arbeidsrecht)
```

```
## 
## 	Kruskal-Wallis rank sum test
## 
## data:  Ec_jaar1 by Vooropleiding
## Kruskal-Wallis chi-squared = 33.073, df = 3, p-value = 3.108e-07
```
<!-- ## /BLOK: Toets-test.R -->

<!-- ## BLOK: Toets-testinterpretatie.R -->
[1] "tijdelijke tekst"
<!-- ## /BLOK: Toets-testinterpretatie.R -->

<!-- 8. Cohens d -->
[//Cohens d]: # Cohens d


<!-- ## BLOK: Toets-cohensd.R -->

<!-- ## /BLOK: Toets-cohensd.R -->

<!-- 9. Rapportage -->
[//Rapportage]: # Rapportage
# Rapportage
De *Kruskal Wallis* is uitgevoerd om te toetsen of een vooropleiding bepalend is voor de hoeveelheid studiepunten die een student behaalt tijdens het eerste jaar van de Master Arbeidsrecht. 
<!-- ## BLOK: Toets-rapportage.R -->
[1] "tijdelijke tekst"
<!-- ## /BLOK: Toets-rapportage.R -->
 Uit de resultaten kan afgelezen worden dat een significant verschil is tussen het aantal studiepunten dat een student in het eerste jaar behaalt en de type vooropleiding die de student heeft afgerond. Met een post-hoc toets is het verschil tussen vooropleidingen getoetst. 

<!-- Noten -->
[//Noten]: # Noten
[^3]: Laerd statistics. (2018). [Testing for Normality using SPSS Statistics](https://statistics.laerd.com/spss-tutorials/testing-for-normality-using-spss-statistics.php).
[^4]: Normaliteit. (14 juli 2014). [UvA Wiki Methodologiewinkel](https://wiki.uva.nl/methodologiewinkel/index.php/Normaliteit).
[^7]: Lumley, T., Diehr, P., Emerson, S., & Chen, L. (2002). The importance of the normality assumption in large public health data sets. *Annu Rev Public Health, 23*, 151-69. doi: 10.1146/annurev.publheath.23.100901.140546 http://rctdesign.org/techreports/arphnonnormality.pdf 
[^9]: Marshall, E., & Boggis, E. (2016). *The statistics tutor’s quick guide to commonly used statistical tests*. http://www.statstutor.ac.uk/resources/uploaded/tutorsquickguidetostatistics.pdf 
[^12]: LEEG
[^15]: Universiteit van Amsterdam (8 juli 2014). *One-way ANOVA*. https://wiki.uva.nl/methodologiewinkel/index.php/One-way_ANOVA

<!-- Footer -->
[//Footer]: # Footer

***
<!--html_preserve-->
<div id = "footer">
Deze pagina maakt onderdeel uit van het Statistisch Handboek Studiedata, ontwikkeld binnen de zone Veilig en betrouwbaar benutten van studiedata van het Versnellingsplan. De code is uitgevoerd met R versie 3.6.1.
<br/><br/>
&copy; 2019 SURF Versnellingsplan - Statistisch Handboek Studiedata
</div><!--/html_preserve-->
