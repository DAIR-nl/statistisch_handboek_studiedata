---
title: "Gepaarde t-test"
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

<style>
<!--html_preserve--><style>
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
 color: #808080
 background-image: url('images/VPO_logo_studiedata.png');;
 background-repeat: no-repeat;
 background-position: right;
 background-size: 230px auto;
 padding-right: 242px;
}

</style>

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

<style>
  .col2 {
    columns: 2 200px;
    -webkit-columns: 2 200px;
    -moz-columns: 2 200px;
  }
</style><!--/html_preserve-->
</style>



<!-- ## BLOK: Functiedefinities.R -->

<!-- ## /BLOK: Functiedefinities.R -->




<!-- ## BLOK: Data-aanmaken.R -->

<!-- ## /BLOK: Data-aanmaken.R -->

# Toepassing
Gebruik de *t-toets* om te toetsen of de gemiddeldes van twee groepen aan elkaar gelijk zijn. Gebruik de *gepaarde t-toets* bij een herhaalde meting van dezelfde groep.[^1] 

# Onderwijscasus
Ter voorbereiding op een visitatie vraagt de opleidingsdirecteur van de lerarenopleiding zich af of het gemiddelde tentamencijfer veranderd na een tutorgesprek. Ze bekijkt het gemiddelde tentamencijfer van de onderwijsperiode voor het tutorgesprek (T~0~) en het gemiddelde cijfer van de onderwijsperiode na het tutorgesprek (T~1~). 

H~0~: Het gemiddelde tentamencijfer per onderwijsperiode verandert niet na het tutorgesprek, µ~T0~ = µ~T1~  

H~A~: Het gemiddelde tentamencijfer per onderwijsperiode verandert na het tutorgesprek, µ~T0~ ≠ µ~T1~ 


# Assumpties
Voor een betrouwbaar resultaat moet de data aan een aantal voorwaarden voldoen voordat de toets uitgevoerd kan worden.

## Normaliteit
De *t-toets* gaat ervan uit dat de data normaal verdeeld is. Ga er bij een *n* > 100 vanuit dat de *t-toets* robuust genoeg is om uit te voeren zonder dat de data een normale verdeling volgt.[^2]   

Controleer de assumptie van normaliteit met de volgende stappen:  
1. Controleer de data visueel met een histogram, een Q-Q plot of een boxplot.
2. Toets of de data normaal verdeeld is met de *Kolmogorov-Smirnov test* of bij een kleinere steekproef (n < 50[^3]) met de *Shapiro-Wilk test*.[^4]  
3. Als blijkt dat de data niet normaal verdeeld is, transformeer de data eventueel en bepaal daarna of deze wel normaal verdeeld is. 

Als er geen sprake is van normaliteit en *n* is niet groter dan 100, gebruik de *Wilcoxon Signed Rank Test*.[^5]

# Effectmaat
Bereken de effectmaat om te bepalen of de gevonden p-waarde betekenisvol is. Een veel gebruikte effectmaat is Cohen's *d*. Cohen's *d* geeft de sterkte van het effect van een onafhankelijke variabele op een afhankelijke variabele weer.  
Een indicatie om *d* te interpreteren is: rond 0,3 is een klein effect, rond 0,5 is een gemiddeld effect en rond 0,8 is een groot effect.[^6]  

# Uitvoering in R
Er is een dataset ingeladen met `Tentamencijfer_voor_tutorgesprek` (T~0~) en met `Tentamencijfer_na_tutorgesprek` (T~1~). 

## De data bekijken
De data is verdeeld in 3 kolommen, het studentnummer, het cijfer en of deze voor of na het tutorgesprek behaald is.
<!-- ## BLOK: Data-bekijken.R -->

```r
## Eerste 10 observaties
head(Tentamencijfers)
##   Studentnr Cijfer Voor_of_na_tutorgesprek
## 1    347010  4.353                    voor
## 2    366583  8.363                    voor
## 3    393716  7.056                    voor
## 4    314712  5.903                    voor
## 5    323302  4.281                    voor
## 6    393319  8.123                    voor

## Laatste 10 observaties
tail(Tentamencijfers)
##     Studentnr Cijfer Voor_of_na_tutorgesprek
## 463    372952  7.080                      na
## 464    352534  8.025                      na
## 465    343648  6.222                      na
## 466    308108  6.357                      na
## 467    348907  5.231                      na
## 468    370059  6.830                      na
```
<!-- ## /BLOK: Data-bekijken.R -->

Selecteer beide groepen en sla deze op in een vector om deze makkelijker aan te kunnen roepen.
<!-- ## BLOK: Data-selecteren.R -->

```r
Tentamencijfer_voor_tutorgesprek <-
  Tentamencijfers[Tentamencijfers$Voor_of_na_tutorgesprek=="voor", 2]
Tentamencijfer_na_tutorgesprek <- 
  Tentamencijfers[Tentamencijfers$Voor_of_na_tutorgesprek=="na", 2]
```
<!-- ## /BLOK: Data-selecteren.R -->

Inspecteer de data met `length()`, `mean()`en `sd()` om meer inzicht te krijgen in de data. 

<div class="col2">
<!-- ## BLOK: Data-beschrijven-t1.R -->

```r
## Aantallen, gemiddelde en standaarddeviatie voor tutorgesprek
length(Tentamencijfer_voor_tutorgesprek)
## [1] 234
mean(
  Tentamencijfer_voor_tutorgesprek)
## [1] 6.837269
sd(Tentamencijfer_voor_tutorgesprek)
## [1] 1.662847
```
<!-- ## /BLOK: Data-beschrijven-t1.R -->

*n* = 234   
Gemiddeld tentamencijfer voor tutorgesprek (standaardafwijking): 6,84 (1,66)

<!-- ## BLOK: Data-beschrijven-t2.R -->

```r
## Aantallen, gemiddelde en standaarddeviatie na tutorgesprek
length(Tentamencijfer_na_tutorgesprek)
## [1] 234
mean(
  Tentamencijfer_na_tutorgesprek)
## [1] 7.039671
sd(Tentamencijfer_na_tutorgesprek)
## [1] 1.431434
```
<!-- ## /BLOK: Data-beschrijven-t2.R -->

*n* = 234   
Gemiddeld tentamencijfer voor tutorgesprek (standaardafwijking): 7,04 (1,43)
</div>

### Histogram
Controleer de data visueel met een histogram.

<!-- ## BLOK: library-ggplot2.R -->

```r
library(ggplot2)
```
<!-- ## /BLOK: library-ggplot2.R -->

<!-- ## BLOK: Histogram.R -->

```r
ggplot(Tentamencijfers,
  aes(x = Cijfer)) +
  geom_histogram(aes(y = ..density..),
                 binwidth = 1,
                 color = "grey30",
                 fill = "#0089CF") +
  facet_wrap(~ Voor_of_na_tutorgesprek) +
  geom_density(alpha = .2, adjust = 1) +
  ylab("Frequentiedichtheid") +
  scale_x_continuous(
    labels = as.character(seq(1, 10)),
    breaks = seq(1, 10)) +
  coord_fixed(ylim = c(0, 0.4),
              xlim = c(1, 10),
              ratio = 22) +
  labs(title = "Lerarenopleiding tentamencijfers")
```

![](02-Gepaarde-t-toets_files/figure-html/histogram atc-1.png)<!-- -->
<!-- ## /BLOK: Histogram.R -->


Beide histogrammen laten een belcurve zien vergelijkbaar aan een normale verdeling. Veel waardes liggen rondom de gemiddeldes. Opvallend is dat het histogram van voor het tutorgesprek veel waardes in de linkerstaart van de verdeling heeft liggen.  

### Q-Q plot
Controleer de data visueel met een Q-Q plot. Gebruik `qqnorm()` en `qqline()` met `pch = 1` om een Q-Q plot te maken met kleine cirkels.

<div class ="col2">
<!-- ## BLOK: QQplot-t1.R -->

```r
qqnorm(Tentamencijfer_voor_tutorgesprek, 
       pch = 1,
       main = "Normaal Q-Q plot van tentamencijfers voor tutorgesprek",
       ylab = "Kwantielen in data",
       xlab = "Theoretische kwantielen")
qqline(Tentamencijfer_voor_tutorgesprek)
```

![](02-Gepaarde-t-toets_files/figure-html/qqplot voor tutor-1.png)<!-- -->
<!-- ## /BLOK: QQplot-t1.R -->

<!-- ## BLOK: QQplot-t2.R -->

```r
qqnorm(Tentamencijfer_na_tutorgesprek, 
       pch = 1,
       main = "Normaal Q-Q plot van tentamencijfers na tutorgesprek",
       ylab = "Kwantielen in data",
       xlab = "Theoretische kwantielen")
qqline(Tentamencijfer_na_tutorgesprek)
```

![](02-Gepaarde-t-toets_files/figure-html/qqplot na tutor-1.png)<!-- -->
<!-- ## /BLOK: QQplot-t2.R -->
</div>

Als over het algemeen de meeste datapunten op de lijn liggen, kan aangenomen worden dat de data normaal verdeeld is. In deze casus liggen de meeste punten op de lijn behalve bij de uiteinden. 

### Boxplot
Controleer de data visueel met een boxplot.  
De box geeft de middelste 50% van de tentamencijfers weer. De zwarte lijn binnen de box is de mediaan. In de staarten zitten de eerste 25% en de laatste 25%. Cirkels zijn uitbijters.  

<!-- ## BLOK: Boxplot.R -->

```r
boxplot(Cijfer ~ Voor_of_na_tutorgesprek, Tentamencijfers,
        main = "Boxplot van tentamencijfers lerarenopleiding")
```

![](02-Gepaarde-t-toets_files/figure-html/Boxplot-1.png)<!-- -->
<!-- ## /BLOK: Boxplot.R -->
De boxplotten geven de spreiding weer van het gemiddelde tentamencijfer per periode voor de lerarenopleiding. De boxplot en de staarten van T~0~ zijn niet helemaal symmetrisch. Dit kan een teken zijn dat de data niet normaal verdeeld is. Het gaat om een kleine afwijking, daarom is de data vermoedelijk normaal verdeeld. Er zijn een aantal uitbijters. Er kan gekeken worden of de uitbijters bepalend zijn voor normaliteit of niet.  
De boxplot van T~1~ ziet er symmetrisch uit. Er zijn geen uitbijters.    

***

Om te controleren of de data normaal verdeeld is, kan de normaliteit getoetst worden. Hierbij een toelichting bij twee veel gebruikte toetsen: de *Kolmogorov-Smirnov test* en de *Shapiro-Wilk test*.


### Kolmogorov-Smirnov (met Lilliefors correctie)
De *Kolmogorov-Smirnov test* toetst het verschil in vorm tussen de twee verdelingen. In dit geval toetst deze test het verschil tussen een normale verdeling en de verdeling van de steekproef. De Lilliefors correctie is een correctie op de *Kolmogorov-Smirnov test*, die wordt gebruikt als het gemiddelde van de steekproef niet 0 is en de standaardafwijking niet 1 is. Als de p-waarde groter is dan 0,05 is de verdeling van de data niet significant verschillend van een normale verdeling. 
<!-- ## BLOK: Library-nortest -->

```r
library(nortest)
```
<!-- ## /BLOK: Library-nortest -->
<div class ="col2">
<!-- ## BLOK: Lilliefors-test -->

```r
lillie.test(
  Tentamencijfer_voor_tutorgesprek)
```

```
## 
## 	Lilliefors (Kolmogorov-Smirnov) normality test
## 
## data:  Tentamencijfer_voor_tutorgesprek
## D = 0.048971, p-value = 0.1869
```

```r
lillie.test(
  Tentamencijfer_na_tutorgesprek)
```

```
## 
## 	Lilliefors (Kolmogorov-Smirnov) normality test
## 
## data:  Tentamencijfer_na_tutorgesprek
## D = 0.055488, p-value = 0.07754
```
<!-- ## /BLOK: Lilliefors-test -->
</div>

Bij deze casus is van beide groepen de p-waarde > 0,05; er is geen significant verschil gevonden tussen de verdeling van de steekproef en de normale verdeling. Er wordt aan de assumptie van normaliteit voldaan, dus de *gepaarde t-toets* kan uitgevoerd worden. 

### Shapiro-Wilk Test
De *Shapiro-Wilk test* is een soortgelijke test als de *Kolmogorov-Smirnov test* en wordt vooral gebruikt bij kleine steekproeven. Als de p-waarde groter is dan 0,05 is de verdeling van de data niet significant verschillend van de normale verdeling.
<div class ="col2">
<!-- ## BLOK: Shapiro-Wilk-test -->

```r
shapiro.test(
  Tentamencijfer_voor_tutorgesprek_n30)
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  Tentamencijfer_voor_tutorgesprek_n30
## W = 0.97858, p-value = 0.7866
```

```r
shapiro.test(
  Tentamencijfer_na_tutorgesprek_n30)
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  Tentamencijfer_na_tutorgesprek_n30
## W = 0.97599, p-value = 0.712
```
<!-- ## /BLOK: Shapiro-Wilk-test -->
</div>

In dit voorbeeld, met een kleine *n*, hebben beide groepen een p-waarde > 0,05. De verdeling van beide groepen is niet significant verschillend van de normale verdeling. Er wordt aan de assumptie van normaliteit voldaan. De *gepaarde t-toets* kan uitgevoerd worden.  

***

## Gepaarde t-toets
Gebruik `t.test()` met `paired = TRUE`.
<!-- ## BLOK: T-test -->

```r
t.test(Cijfer ~ Voor_of_na_tutorgesprek, Tentamencijfers, paired = TRUE)
```

```
## 
## 	Paired t-test
## 
## data:  Cijfer by Voor_of_na_tutorgesprek
## t = -9.9591, df = 233, p-value < 2.2e-16
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -0.2424427 -0.1623607
## sample estimates:
## mean of the differences 
##              -0.2024017
```
<!-- ## BLOK: T-test -->


* Vrijheidsgraden, *df* = *n* -1 = 234-1 = 233  
* p-waarde < 0,05, dus de H~0~ wordt verworpen en de H~A~ wordt aangenomen
* *t* (234) = -9,96, *p* < 0,01
* 95%-betrouwbaarheidsinterval: bij het herhalen van het onderzoek zal in 95% van de gevallen de µ in het interval vallen. In deze casus is het interval tussen -0,24 en -0,16.

### Effectmaat: Cohen's d
Gebruik `cohen.d()` met `paired = TRUE` om de effectgrootte te meten.

```r
library(effsize)
cohen.d(Cijfer ~ Voor_of_na_tutorgesprek, Tentamencijfers, paired = TRUE)
```

```
## 
## Cohen's d
## 
## d estimate: -0.08760611 (negligible)
## 95 percent confidence interval:
##       lower       upper 
## -0.10492516 -0.07028705
```

*d* = -0,09. De sterkte van het effect van de tutor op het cijfer is minimaal. 

# Rapportage
Een *gepaarde t-toets* is uitgevoerd om te toetsen of het gemiddelde tentamencijfer van de studenten gelijk is gebleven na een gesprek met hun tutor. Het verschil tussen het gemiddelde van T~0~ (*M~T0~* = 6,84, *SD~T0~* = 1,66) en het gemiddelde van T~1~ (*M~T1~* =7,04, *SD~T1~* = 1,43) is significant, *t* (233) = -9,96, *p* < 0,01. Het 95% betrouwbaarheidsinterval voor het verschil tussen het gemiddelde van beide groepen is van -0,24 tot -0,16. Het valt op dat het gemiddelde van T~1~ hoger is dan van T~0~. Het effect is minimaal, *d* = -0,09. 

Aan de hand van de resultaten kan geconcludeerd worden dat de studenten, na een gesprek met de tutor, de opleiding beter beoordelen dan daarvoor. Het effect is minimaal.  

[^1]: Wikipedia (21 augustus 2019). *Student's t-test*. https://en.wikipedia.org/wiki/Student%27s_t-test
[^2]: Lumley, T., Diehr, P., Emerson, S., & Chen, L. (2002). Tthe importance of the normality assumption in large public health data sets. *Annu Rev Public Health, 23*, 151-69. doi: 10.1146/annurev.publheath.23.100901.140546 http://rctdesign.org/techreports/arphnonnormality.pdf 
[^3]: van Geloven, N. (25 september2013). *Wilcoxon signed rank toets*.  https://wikistatistiek.amc.nl/index.php/Wilcoxon_signed_rank_toets
[^4]: Laerd statistics (2018). *Testing for Normality using SPSS Statistics*. https://statistics.laerd.com/spss-tutorials/testing-for-normality-using-spss-statistics.php  
[^5]: Universiteit van Amsterdam (14 juli 2014). *Normaliteit*. https://wiki.uva.nl/methodologiewinkel/index.php/Normaliteit  
[^6]: Marshall, E., & Boggis, E. (2016). *The statistics tutor’s quick guide to commonly used statistical tests*. http://www.statstutor.ac.uk/resources/uploaded/tutorsquickguidetostatistics.pdf 
