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
title: Gepaarde t-toets
date: "versie 0.5.1, 23-10-2019"
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
Gebruik de *t-toets* om te toetsen of de gemiddeldes van twee groepen aan elkaar gelijk zijn. Gebruik de *gepaarde t-toets* bij een herhaalde meting van dezelfde groep.[^6] 

<!-- 2. Onderwijscasus -->
[//Onderwijscasus]: # Onderwijscasus
# Onderwijscasus
<div id = "casus">
Ter voorbereiding op een visitatie vraagt de opleidingsdirecteur van de lerarenopleiding zich af of het gemiddelde tentamencijfer veranderd na een tutorgesprek. Ze bekijkt het gemiddelde tentamencijfer van de onderwijsperiode voor het tutorgesprek (T~0~) en het gemiddelde cijfer van de onderwijsperiode na het tutorgesprek (T~1~). 

H~0~: Het gemiddelde tentamencijfer per onderwijsperiode verandert niet na het tutorgesprek, ï¿½~T0~ = ï¿½~T1~  

H~A~: Het gemiddelde tentamencijfer per onderwijsperiode verandert na het tutorgesprek, ï¿½~T0~ ? ï¿½~T1~
</div>

<!-- 3. Assumpties -->
[//Assumpties]: # Assumpties
# Assumpties
Voor een betrouwbaar resultaat moet de data aan een aantal voorwaarden voldoen voordat de toets uitgevoerd kan worden.

## Normaliteit
De *t-toets* gaat ervan uit dat de data normaal verdeeld is. Ga er bij een *n* > 100 vanuit dat de *t-toets* robuust genoeg is om uit te voeren zonder dat de data een normale verdeling volgt.[^7] 

Controleer deze assumptie met de volgende stappen: 
 
1. Controleer de data visueel met een histogram, een boxplot of een Q-Q plot.   
2. Toets of de data normaal verdeeld is met de *Kolmogorov-Smirnov test* of bij een kleinere steekproef (n < 50[^3]) met de *Shapiro-Wilk test*.[^4]  
3. Als blijkt dat de data niet normaal verdeeld is, transformeer de data eventueel en bepaal daarna of deze wel normaal verdeeld is.
 Als er geen sprake is van normaliteit en *n* is niet groter dan 100, gebruik de *Wilcoxon Signed Rank Test*.[^8]

[//Toetsen van homogeniteit van varianties]: # Toetsen van homogeniteit van varianties



<!-- 4. Effectmaat -->
[//Effectmaat]: # Effectmaat
# Effectmaat
Bereken de effectmaat om te bepalen of de gevonden p-waarde betekenisvol is. 
Een veel gebruikte effectmaat is Cohen's *d*. Cohen's *d* geeft de sterkte van het effect van een onafhankelijke variabele op een afhankelijke variabele weer.  

Een indicatie om *d* te interpreteren is: rond 0,3 is een klein effect, rond 0,5 is een gemiddeld effect en rond 0,8 is een groot effect.[^9]  

<!-- 5. Uitvoering in R -->
[//Uitvoering in R]: # Uitvoering in R
# Uitvoering in R
Er is een dataset ingeladen met de variabele `Tentamencijfer_voor_tutorgesprek` (T~0~) en `Tentamencijfer_na_tutorgesprek` (T~1~). 

[//Gemiddelde en standaarddeviatie]: # Gemiddelde en standaarddeviatie 
## Gemiddelde en standaarddeviatie 
Inspecteer de data met `length()`, `mean()`en `sd()` om meer inzicht te krijgen in de data.

<!-- ## BLOK: Toets-datainspectie.R -->

```r
## Aantallen, gemiddelde en standaarddeviatie voor tutorgesprek
length(Tentamencijfer_voor_tutorgesprek)
## [1] 234
mean(Tentamencijfer_voor_tutorgesprek)
## [1] 6.837269
sd(Tentamencijfer_voor_tutorgesprek)
## [1] 1.662847

## Aantallen, gemiddelde en standaarddeviatie na tutorgesprek
mean(Tentamencijfer_na_tutorgesprek)
## [1] 7.039671
sd(Tentamencijfer_na_tutorgesprek)
## [1] 1.431434
```
<!-- ## /BLOK: Toets-datainspectie.R -->

[//Visuele inspectie van normaliteit]: # Visuele inspectie van normaliteit
## Visuele inspectie van normaliteit
Geef de data visueel weer met een histogram, Q-Q plot of boxplot.

[//Histogram]: # Histogram
### Histogram
<!-- ## BLOK: Toets-histogram.R -->

```r
## Histogram Tentamencijfer_voor_tutorgesprek
ggplot(
    data.frame(
        Tentamencijfer_voor_tutorgesprek),
    aes(x = Tentamencijfer_voor_tutorgesprek)) +
    geom_histogram(aes(y = ..density..),
                   binwidth = 0.5,
                   color = "grey30",
                   fill = "#0089CF") +
    geom_density(alpha = .2, adjust = 1) +
    ylab("Frequentiedichtheid") +
    xlab("Tentamencijfer_voor_tutorgesprek") +
    scale_x_continuous(
        labels = as.character(seq(1, 10, 0.5)),
        breaks = seq(1, 10, 0.5)) +
    coord_fixed(ylim = c(0, 0.3),
                xlim = c(1, 10),
                ratio = 18) +
    labs(title = expression(paste("Tentamencijfers (", T[0], ")")))
```

![](images/histogram-1.png)<!-- -->

```r
## Histogram Tentamencijfer_na_tutorgesprek
ggplot(
    data.frame(
        Tentamencijfer_na_tutorgesprek),
    aes(x = Tentamencijfer_na_tutorgesprek)) +
    geom_histogram(aes(y = ..density..),
                   binwidth = 0.5,
                   color = "grey30",
                   fill = "#0089CF") +
    geom_density(alpha = .2, adjust = 1) +
    ylab("Frequentiedichtheid") +
    xlab("Tentamencijfer_na_tutorgesprek") +
    scale_x_continuous(
        labels = as.character(seq(1, 10, 0.5)),
        breaks = seq(1, 10, 0.5)) +
    coord_fixed(ylim = c(0, 0.3),
                xlim = c(1, 10),
                ratio = 18) +
    labs(title = expression(paste("Tentamencijfers (", T[1], ")")))
```

![](images/histogram-2.png)<!-- -->
<!-- ## /BLOK: Toets-histogram.R -->
 Beide histogrammen laten een belcurve zien vergelijkbaar aan een normale verdeling. Veel waardes liggen rondom de gemiddeldes. Opvallend is dat het histogram `Tentamencijfer_voor_tutorgesprek` veel waardes in de linkerstaart van de verdeling heeft liggen.

[//Q-Q plot]: # Q-Q plot
### Q-Q plot
Gebruik `qqnorm()` en `qqline()` met `pch = 1` om gevulde datapunten  Q-Q plot te maken met kleine cirkels. 

Als over het algemeen de meeste datapunten op de lijn liggen, kan aangenomen worden dat de data normaal verdeeld is. 
<!-- ## BLOK: Toets-qqplot.R -->

```r
## Q-Q plot Tentamencijfer_voor_tutorgesprek
qqnorm(Tentamencijfer_voor_tutorgesprek,
       pch = 1,
       main = "Normaal Q-Q plot van tentamencijfers voor tutorgesprek",
       ylab = "Kwantielen in data",
       xlab = "Theoretische kwantielen")
qqline(Tentamencijfer_voor_tutorgesprek)
```

![](images/qqplot-1.png)<!-- -->

```r
## Q-Q plot Tentamencijfer_na_tutorgesprek
qqnorm(Tentamencijfer_na_tutorgesprek,
       pch = 1,
       main = "Normaal Q-Q plot van tentamencijfers na tutorgesprek",
       ylab = "Kwantielen in data",
       xlab = "Theoretische kwantielen")
qqline(Tentamencijfer_na_tutorgesprek)
```

![](images/qqplot-2.png)<!-- -->
<!-- ## /BLOK: Toets-qqplot.R -->
 Bij beide groepen liggen de meeste punten op de lijn behalve bij de uiteinden. De punten bij de uiteinden liggen niet ver van de lijn vandaan, waardoor vermoedelijk de data normaal verdeeld is.

[//Boxplot]: # Boxplot
### Boxplot
Controleer de data visueel met een boxplot. De boxplotten geven de spreiding weer van het gemiddelde tentamencijfer per periode voor de Lerarenopleiding. De box geeft de middelste 50% van de tentamencijfers weer. De zwarte lijn binnen de box is de mediaan. In de staarten zitten de eerste 25% en de laatste 25%. Cirkels visualiseren uitbijters.
<!-- ## BLOK: Toets-boxplot.R -->

```r
## Boxplot Tentamencijfer_voor_na_tutorgesprek
boxplot(Tentamencijfer_voor_tutorgesprek, Tentamencijfer_na_tutorgesprek,
        names = c("Voor tutorgesprek", "Na tutorgesprek"),
        main = "Boxplot van tentamencijfers lerarenopleiding",
        ylab = "Tentamencijfer")
```

![](images/boxplot-1.png)<!-- -->
<!-- ## /BLOK: Toets-boxplot.R -->
 De boxplotten geven de spreiding weer van het gemiddelde tentamencijfer per periode voor de lerarenopleiding. De boxplot en de staarten van T~0~ zijn niet helemaal symmetrisch. Dit kan een teken zijn dat de data niet normaal verdeeld is. Het gaat om een kleine afwijking, daarom is de data vermoedelijk normaal verdeeld. Er zijn een aantal uitbijters. Uitbijters kunnen veel invloed uitoefenen op de uitkomst van toetsen [^10], kijk of de uitbijters bepalend zijn en bepaal wat je met een uitbijter doet. De boxplot van T~1~ ziet er symmetrisch uit en er zijn geen uitbijters.    


[//Toetsen van normaliteit]: # Toetsen van normaliteit
## Toetsen van normaliteit
Om te controleren of de data, ondanks eventuele afwijkende punten of een scheef lijkende verdeling, normaal verdeel is, kan de normaliteit getoets worden. Hierbij een toelichting bij twee veel gebruikte toetsen: de *Kolmogorov-Smirnov* test en de *Shapiro-Wilk test*.
 
[//Kolmogorov-Smirnov test]: # Kolmogorov-Smirnov test
### Kolmogorov-Smirnov test
De *Kolmogorov-Smirnov test* toetst het verschil in vorm tussen twee verdelingen. In deze casus toetst deze test het verschil tussen een normale verdeling en de verdeling van de steekproef. De Lilliefors correctie wordt gebruikt als het gemiddelde niet 0 is en de standaardafwijking niet 1 is. Als de p-waarde < 0,05 is de verdeling van de data significant verschillend van de normale verdeling.
<!-- ## BLOK: Toets-kolmogorovsmirnov.R -->

```r
## Kolmogorov-Smirnov test
library(nortest)
lillie.test(Tentamencijfer_voor_tutorgesprek)
```

```
## 
## 	Lilliefors (Kolmogorov-Smirnov) normality test
## 
## data:  Tentamencijfer_voor_tutorgesprek
## D = 0.048971, p-value = 0.1869
```

```r
lillie.test(Tentamencijfer_na_tutorgesprek)
```

```
## 
## 	Lilliefors (Kolmogorov-Smirnov) normality test
## 
## data:  Tentamencijfer_na_tutorgesprek
## D = 0.055488, p-value = 0.07754
```
<!-- ## /BLOK: Toets-kolmogorovsmirnov.R -->
 Bij deze casus is van beide groepen de p-waarde > 0,05; er is geen significant verschil gevonden tussen de verdeling van de steekproef en de normale verdeling. De *gepaarde t-toets* kan uitgevoerd worden.

[//Shapiro-Wilk test]: # Shapiro-Wilk test
### Shapiro-Wilk test
De *Shapiro-Wilk test* is een soortgelijke test als de *Kolmogorov-Smirnov test* en wordt vooral gebruikt bij kleine steekproeven. Als de p-waarde < 0,05 is de verdeling van de data significant verschillend van de normale verdeling.

<!-- ## BLOK: Toets-shapirowilk.R -->

```r
## Shapiro Wilk test
shapiro.test(Tentamencijfer_voor_tutorgesprek_n30)
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  Tentamencijfer_voor_tutorgesprek_n30
## W = 0.98584, p-value = 0.9554
```

```r
shapiro.test(Tentamencijfer_na_tutorgesprek_n30)
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  Tentamencijfer_na_tutorgesprek_n30
## W = 0.97216, p-value = 0.5998
```
<!-- ## /BLOK: Toets-shapirowilk.R -->
 In dit voorbeeld, met een kleine *n*, hebben beide groepen een p-waarde > 0,05. De verdeling van beide groepen is niet significant verschillend van de normale verdeling. Er wordt aan de assumptie van normaliteit voldaan. De *gepaarde t-toets* kan uitgevoerd worden.  


<!-- 6. Levenes Test -->
[//Levenes Test]: # Levenes Test

[//Levenes Test Inleiding]: # Levenes Test Inleiding

<!-- ## BLOK: Toets-levenestest.R -->

<!-- ## /BLOK: Toets-levenestest.R -->

<!-- 7. Toets -->
[//Toets]: # Toets
## Toets
[//Toets Inleiding]: # Inleiding
Gebruik `t.test()` met `paired = TRUE`. 

[//Toets Interpretatie output]: # Interpretatie output
<!-- ## BLOK: Toets-test.R -->

```r
## T-test
t.test(Tentamencijfer_voor_tutorgesprek, Tentamencijfer_na_tutorgesprek, paired = TRUE)
```

```
## 
## 	Paired t-test
## 
## data:  Tentamencijfer_voor_tutorgesprek and Tentamencijfer_na_tutorgesprek
## t = -9.9591, df = 233, p-value < 2.2e-16
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -0.2424427 -0.1623607
## sample estimates:
## mean of the differences 
##              -0.2024017
```
<!-- ## /BLOK: Toets-test.R -->

<!-- ## BLOK: Toets-testinterpretatie.R -->
**Interpretatie output** 

* Het gemiddelde Tentamencijfer voor het tutorgesprek is 6,84.  
* Het gemiddelde Tentamencijfer na het tutorgesprek is 7,04.  
* Het verschil tussen beide groepen: MD = -0.202401709401709. 
* Vrijheidsgraden, *df = n* -1 = 234 -1 = 233. 
* p-waarde < 0,05, dus de H~0~ wordt verworpen en de H~A~ wordt aangenomen. 
* *t* (233) = -9,96, *p* < 0,01. 
* 95%-betrouwbaarheidsinterval: bij het herhalen van het onderzoek zal in 95% van de gevallen de Âµ binnen het interval vallen. In deze casus is het interval tussen -0,24 en -0,16. 
<!-- ## /BLOK: Toets-testinterpretatie.R -->

<!-- 8. Cohens d -->
[//Cohens d]: # Cohens d
### Cohen's d
De sterkte van het effect van de tutor op het cijfer is minimaal, *d* = -0,09. 
<!-- ## BLOK: Toets-cohensd.R -->

```r
## Cohen's d
library(effsize)
cohen.d(Tentamencijfer_voor_tutorgesprek, Tentamencijfer_na_tutorgesprek, paired = TRUE)
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
<!-- ## /BLOK: Toets-cohensd.R -->

<!-- 9. Rapportage -->
[//Rapportage]: # Rapportage
# Rapportage
Een *gepaarde t-toets* is uitgevoerd om te toetsen of het gemiddelde tentamencijfer van de studenten gelijk is gebleven na een gesprek met hun tutor.
<!-- ## BLOK: Toets-rapportage.R -->
Het verschil tussen het gemiddelde van T~0~ (*M~T0~* = 6,84, *SD~T0~* = 1,66) en het gemiddelde van T~1~ (*M~T1~* = 7,04, *SD~T1~* = 1,43) is significant, *t* (233) = -9,96, *p* < 0,01.). Het 95% betrouwbaarheidsinterval voor het verschil tussen het gemiddelde van beide groepen is van -0,24 en -0,16. Het valt op dat het gemiddelde van T~1~ hoger is dan van T~0~. Het effect is minimaal, *d* = 0,09.
<!-- ## /BLOK: Toets-rapportage.R -->
 Aan de hand van de resultaten kan geconcludeerd worden dat de studenten, na een gesprek met de tutor, de opleiding beter beoordelen dan daarvoor. Het effect is echter minimaal. 

<!-- Noten -->
[//Noten]: # Noten
[^3]: Laerd statistics. (2018). [Testing for Normality using SPSS Statistics](https://statistics.laerd.com/spss-tutorials/testing-for-normality-using-spss-statistics.php).
[^4]: Normaliteit. (14 juli 2014). [UvA Wiki Methodologiewinkel](https://wiki.uva.nl/methodologiewinkel/index.php/Normaliteit).
[^6]: Van Geloven, N. (25 mei 2016). *T-toets* [Wiki Statistiek Academisch Medisch Centrum](https://wikistatistiek.amc.nl/index.php/T-toets#gepaarde_t-toets).
[^7]: Lumley, T., Diehr, P., Emerson, S., & Chen, L. (2002). The importance of the normality assumption in large public health data sets. *Annu Rev Public Health, 23*, 151-69. doi: 10.1146/annurev.publheath.23.100901.140546 http://rctdesign.org/techreports/arphnonnormality.pdf 
[^8]: Van Geloven, N. (25 september 2013). *Wilcoxon signed rank toets*  [Wiki Statistiek Academisch Medisch Centrum](https://wikistatistiek.amc.nl/index.php/Wilcoxon_signed_rank_toets).
[^9]: Marshall, E., & Boggis, E. (2016). *The statistics tutor’s quick guide to commonly used statistical tests*. http://www.statstutor.ac.uk/resources/uploaded/tutorsquickguidetostatistics.pdf 
[^10]: Van Geloven, N. (25 mei 2016). *One-way ANOVA* [Wiki Statistiek Academisch Medisch Centrum]( https://wikistatistiek.amc.nl/index.php/One-way_ANOVA).
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
