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
title: Ongepaarde t-toets
date: "versie 0.4, 23-10-2019"
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

<!-- ![Caption](images/zone-logo.png) -->

<!-- 1. Toepassing -->
[//Toepassing]: # Toepassing
# Toepassing
Gebruik de *t-toets* om te toetsen of de gemiddeldes van twee groepen aan elkaar gelijk zijn. Gebruik de *ongepaarde t-toets* om de gemiddelden van twee onafhankelijke groepen te vergelijken.[^13]

<!-- 2. Onderwijscasus -->
[//Onderwijscasus]: # Onderwijscasus
# Onderwijscasus
<div id = "casus">
Vanaf 2011 heeft de opleiding Taalwetenschap een Bindend Studieadvies (BSA) die de selectiviteit van het eerste jaar moet vergroten. Zij vraagt zich af of het gemiddelde cijfer van de opleiding Taalwetenschap op 1 februari, na invoering van het BSA, gestegen is. De data is beschikbaar voor het cohort gestart in 2010 en voor het cohort gestart in 2011.

H~0~: Het gemiddelde tentamencijfer dat de studenten halen aan de opleiding Taalwetenschap is niet veranderd na de invoer van het BSA, ï¿½~0~ = ï¿½~1~  

H~A~: Het gemiddelde tentamencijfer dat de studenten halen aan de opleiding Taalwetenschap is veranderd na de invoer van het BSA, ï¿½~0~ ? ï¿½~1~ 
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
 Als er geen sprake is van normaliteit en *n* is niet groter dan 100, gebruik de *Mann-Whitney U toets*, ook bekend als de *Wilcoxon rank-sum toets*.[^14]

[//Toetsen van homogeniteit van varianties]: # Toetsen van homogeniteit van varianties
## Homogeniteit van varianties
Toets met de *Levene's Test (for equality of variance)* of de spreiding van iedere groep ongeveer hetzelfde is. Bij een *p* < 0,05 is de spreiding van de groepen significant verschillend. [^15]



<!-- 4. Effectmaat -->
[//Effectmaat]: # Effectmaat
# Effectmaat
Bereken de effectmaat om te bepalen of de gevonden p-waarde betekenisvol is. 
Een veel gebruikte effectmaat is Cohen's *d*. Cohen's *d* geeft de sterkte van het effect van een onafhankelijke variabele op een afhankelijke variabele weer.  

Een indicatie om *d* te interpreteren is: rond 0,3 is een klein effect, rond 0,5 is een gemiddeld effect en rond 0,8 is een groot effect.[^9]  

<!-- 5. Uitvoering in R -->
[//Uitvoering in R]: # Uitvoering in R
# Uitvoering in R
Er is een dataset ingeladen met gemiddelde cijfers van tweedejaarsstudenten bij de opleiding Taalwetenschap: `Cijfers_gem`. De data bevat cijfers van 180 studenten begonnen in 2010 en cijfers van 160 studenten begonnen in 2011.

[//Gemiddelde en standaarddeviatie]: # Gemiddelde en standaarddeviatie 
## Gemiddelde en standaarddeviatie 
Inspecteer de data met `length()`, `mean()`en `sd()` om meer inzicht te krijgen in de data.

```r
## Aantallen, gemiddelde en standaarddeviatie 2010
length(Cijfers_2010)
## [1] 180
mean(Cijfers_2010)
## [1] 6.369189
sd(Cijfers_2010)
## [1] 1.117662

## Aantallen, gemiddelde en standaarddeviatie 2011
length(Cijfers_2011)
## [1] 160
mean(Cijfers_2011)
## [1] 6.462363
sd(Cijfers_2011)
## [1] 1.199976
```

[//Visuele inspectie van normaliteit]: # Visuele inspectie van normaliteit
## Visuele inspectie van normaliteit
Geef de data visueel weer met een histogram, Q-Q plot of boxplot.

[//Histogram]: # Histogram
### Histogram

```r
## Histogram met ggplot2 en plotly
library(ggplot2)
ggplot(Cijfers_gem,
       aes(x = Cijfers)) +
  geom_histogram(aes(y = ..density..),
                 binwidth = 1,
                 color = "grey30",
                 fill = "#0089CF") +
  facet_wrap(~ Cohort) +
  geom_density(alpha = .2, adjust = 1) +
  ylab("Frequentiedichtheid") +
  scale_x_continuous(
    labels = as.character(seq(1, 10)),
    breaks = seq(1, 10)) +
  coord_fixed(ylim = c(0, 0.4),
              xlim = c(1, 10),
              ratio = 22) +
  labs(title = "Taalwetenschap gemiddelde cijfers jaar 1")
```

![](images/histogram-1.png)<!-- -->
 Beide histogrammen laten een belcurve zien vergelijkbaar aan een normale verdeling, veel waardes liggen rondom het gemiddelde.    

[//Q-Q plot]: # Q-Q plot
### Q-Q plot
Gebruik `qqnorm()` en `qqline()` met `pch = 1` om gevulde datapunten  Q-Q plot te maken met kleine cirkels. 

Als over het algemeen de meeste datapunten op de lijn liggen, kan aangenomen worden dat de data normaal verdeeld is. 

```r
## Q-Q-plot-2010
qqnorm(Cijfers_2010, pch = 1,
       main = "Normaal Q-Q plot van tentamencijfers 2010",
       ylab = "Kwantielen in data",
       xlab = "Theoretische kwantielen")
qqline(Cijfers_2010)
```

![](images/qqplot-1.png)<!-- -->

```r
## Q-Q-plot-2011
qqnorm(Cijfers_2011, pch = 1,
       main = "Normaal Q-Q plot van tentamencijfers 2011",
       ylab = "Kwantielen in data",
       xlab = "Theoretische kwantielen")
qqline(Cijfers_2011)
```

![](images/qqplot-2.png)<!-- -->
 Bij beide groepen liggen de meeste punten op de lijn behalve bij de uiteinden. De punten bij de uiteinden liggen niet ver van de lijn vandaan, waardoor vermoedelijk de data normaal verdeeld is.

[//Boxplot]: # Boxplot
### Boxplot
Controleer de data visueel met een boxplot. De boxplotten geven de spreiding weer van het gemiddelde tentamencijfer per periode voor de Lerarenopleiding. De box geeft de middelste 50% van de tentamencijfers weer. De zwarte lijn binnen de box is de mediaan. In de staarten zitten de eerste 25% en de laatste 25%. Cirkels visualiseren uitbijters.

```r
## Boxplot
library(graphics)
boxplot(Cijfers ~ Cohort, Cijfers_gem)
```

![](images/boxplot-1.png)<!-- -->
 De boxplotten geven de spreiding weer van het gemiddelde tentamencijfer voor de BSA en na de BSA. De boxplotten en de staarten lijken symmetrisch, dit kan een teken zijn van normaal verdeelde data. Het cohort van 2011 heeft een aantal uitbijters. Uitbijters kunnen invloed uitoefenen op de uitkomst van toetsen [^10]. Kijk of de uitbijters bepalend zijn voor de uitkomst van een toets en bepaal wat je met een uitbijter doet.

[//Toetsen van normaliteit]: # Toetsen van normaliteit
## Toetsen van normaliteit
Om te controleren of de data, ondanks eventuele afwijkende punten of een scheef lijkende verdeling, normaal verdeel is, kan de normaliteit getoets worden. Hierbij een toelichting bij twee veel gebruikte toetsen: de *Kolmogorov-Smirnov* test en de *Shapiro-Wilk test*.
 
[//Kolmogorov-Smirnov test]: # Kolmogorov-Smirnov test
### Kolmogorov-Smirnov test
De *Kolmogorov-Smirnov test* toetst het verschil in vorm tussen twee verdelingen. In deze casus toetst deze test het verschil tussen een normale verdeling en de verdeling van de steekproef. De Lilliefors correctie wordt gebruikt als het gemiddelde niet 0 is en de standaardafwijking niet 1 is. Als de p-waarde < 0,05 is de verdeling van de data significant verschillend van de normale verdeling.

```r
## Kolmogorov-Smirnov test
library(nortest)
lillie.test(Cijfers_2010)
```

```
## 
## 	Lilliefors (Kolmogorov-Smirnov) normality test
## 
## data:  Cijfers_2010
## D = 0.05404, p-value = 0.2244
```

```r
lillie.test(Cijfers_2011)
```

```
## 
## 	Lilliefors (Kolmogorov-Smirnov) normality test
## 
## data:  Cijfers_2011
## D = 0.061106, p-value = 0.1526
```
 Bij deze casus is van beide groepen de p-waarde > 0,05; er is geen significant verschil gevonden tussen de verdeling van de steekproef en de normale verdeling. De *ongepaarde t-toets* kan uitgevoerd worden.


[//Shapiro-Wilk test]: # Shapiro-Wilk test
### Shapiro-Wilk test
De *Shapiro-Wilk test* is een soortgelijke test als de *Kolmogorov-Smirnov test* en wordt vooral gebruikt bij kleine steekproeven. Als de p-waarde < 0,05 is de verdeling van de data significant verschillend van de normale verdeling.

```r
## Shapiro Wilk test
shapiro.test(Cijfers_2011_n30)
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  Cijfers_2011_n30
## W = 0.99057, p-value = 0.3678
```

```r
shapiro.test(Cijfers_2010_n30)
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  Cijfers_2010_n30
## W = 0.98796, p-value = 0.9765
```
 In dit voorbeeld, met een kleine *n*, hebben beide groepen een p-waarde > 0,05, dus is de verdeling van beide groepen niet significant verschillend van de normale verdeling. De *ongepaarde t-toets* kan uitgevoerd worden.


<!-- 6. Levenes Test -->
[//Levenes Test]: # Levenes Test
## Toetsen van Homogeniteit van varianties
[//Levenes Test Inleiding]: # Levenes Test Inleiding
Test met de Levene's test de homogeniteit van varianties. Als uit de *Levene's test* komt dat de steekproeven verschillen in variantie kan de *ongepaarde t-toets* met ongelijke varianties uitgevoerd worden. 

```r
## Levenes test
library(car)
leveneTest(Cijfers_gem$Cijfers, Cijfers_gem$Cohort)
```

```
## Warning in leveneTest.default(Cijfers_gem$Cijfers, Cijfers_gem$Cohort):
## Cijfers_gem$Cohort coerced to factor.
```

```
## Levene's Test for Homogeneity of Variance (center = median)
##        Df F value Pr(>F)
## group   1  0.9201 0.3381
##       338
```

<!-- 7. Toets -->
[//Toets]: # Toets
## Toets
[//Toets Inleiding]: # Inleiding
Voer een ongepaarde `t.test()` uit met `paired = FALSE` en `var.equal = TRUE`. Als uit de *Levene's test* komt dat de groepen verschillen in variantie, gebruik `var.equal = FALSE`

[//Toets Interpretatie output]: # Interpretatie output

```r
## T-test
t.test(Cijfers_2010, Cijfers_2011, paired = FALSE, var.equal = TRUE)
```

```
## 
## 	Two Sample t-test
## 
## data:  Cijfers_2010 and Cijfers_2011
## t = -0.74109, df = 338, p-value = 0.4592
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -0.3404741  0.1541269
## sample estimates:
## mean of x mean of y 
##  6.369189  6.462363
```
**Interpretatie output** 

* Het gemiddelde van het cohort uit 2010 is 6,37.  
* Het gemiddelde van het cohort uit 2011 is 6,46.  
* Vrijheidsgraden, *df* = *n~1~* + *n~2~* - 2 = 180 +160 -2 = 338. 
* p-waarde < 0,05, dus de H~0~ wordt verworpen en de H~A~ wordt aangenomen. 
* *t* (338) = -0,74, *p* < 0,01. 
* 95%-betrouwbaarheidsinterval: bij het herhalen van het onderzoek zal in 95% van de gevallen de Âµ binnen het interval vallen. In deze casus is het interval tussen -0,34 en 0,15. 

<!-- 8. Cohens d -->
[//Cohens d]: # Cohens d
### Cohen's d
De sterkte van het effect van de tutor op het cijfer is minimaal, *d* = -0,09.

```r
## Cohen's d
library(effsize)
cohen.d(Cijfers_2010, Cijfers_2011, paired = FALSE)
```

```
## 
## Cohen's d
## 
## d estimate: -0.08052247 (negligible)
## 95 percent confidence interval:
##      lower      upper 
## -0.2943307  0.1332858
```

<!-- 9. Rapportage -->
[//Rapportage]: # Rapportage
# Rapportage
Een *ongepaarde t-toets* is uitgevoerd om te toetsen of het gemiddelde tentamencijfer is veranderd na de invoer van het BSA.
Het verschil tussen het gemiddelde tentamencijfer van cohort 2010 (*M~2010~* = 6,37) en het gemiddelde tentamencijfer van cohort 2011 (*M~2011~* = 6,46) is significant, *t* (338) = -0,74, *p* < 0,01. Het 95% betrouwbaarheidsinterval voor het verschil tussen het gemiddelde van beide groepen is van -0,34 tot 0,15. Het effect is minimaal, *d* = -0,08
 TODO Aan de hand van de resultaten kan geconcludeerd worden dat de studenten, na een gesprek met de tutor, de opleiding beter beoordelen dan daarvoor. Het effect is echter minimaal. 

<!-- Noten -->
[//Noten]: # Noten
[^3]: Laerd statistics. (2018). [Testing for Normality using SPSS Statistics](https://statistics.laerd.com/spss-tutorials/testing-for-normality-using-spss-statistics.php).
[^4]: Normaliteit. (14 juli 2014). [UvA Wiki Methodologiewinkel](https://wiki.uva.nl/methodologiewinkel/index.php/Normaliteit).
[^7]: Lumley, T., Diehr, P., Emerson, S., & Chen, L. (2002). The importance of the normality assumption in large public health data sets. *Annu Rev Public Health, 23*, 151-69. doi: 10.1146/annurev.publheath.23.100901.140546 http://rctdesign.org/techreports/arphnonnormality.pdf 
[^9]: Marshall, E., & Boggis, E. (2016). *The statistics tutor’s quick guide to commonly used statistical tests*. http://www.statstutor.ac.uk/resources/uploaded/tutorsquickguidetostatistics.pdf 
[^10]: Van Geloven, N. (25 mei 2016). *One-way ANOVA* [Wiki Statistiek Academisch Medisch Centrum]( https://wikistatistiek.amc.nl/index.php/One-way_ANOVA).
[^13]: Van Geloven, N. (25 mei 2016). *T-toets* [Wiki Statistiek Academisch Medisch Centrum](https://wikistatistiek.amc.nl/index.php/T-toets#ongepaarde_t-toets).
[^14]: Van Geloven, N. (13 maart 2018). *Mann-Whitney U toets* [Wiki Statistiek Academisch Medisch Centrum](https://wikistatistiek.amc.nl/index.php/Mann-Whitney_U_toets).
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
