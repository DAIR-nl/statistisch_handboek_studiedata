## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## One sample T-toets.R
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R code voor Student Analytics Vrije Universiteit Amsterdam
## Copyright 2019 VU
## Web Page: http://www.vu.nl
## Contact: Theo Bakker (t.c.bakker@vu.nl)
## Project: Versnellingsagenda - Statistisch Handboek HO
##
## Doel: Index bestand voor het uitvoeren van statistische toetsen
##
## Afhankelijkheden: Geen
##
## Datasets: Geen
##
## Opmerkingen: 
## 1) Geen.
## 2) ___
##
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Geschiedenis:
## 26-07-2019: IvdS: Aanmaak bestand
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## http://r-statistics.co/Statistical-Tests-in-R.html

## T-toets
set.seed(100)
x <- rnorm(50, mean = 10, sd = 0.5)
t.test(x, mu = 10) # testing if mean of x could be

# One Sample t-test
# 
# data:  x
# t = 0.70372, df = 49, p-value = 0.4849
# alternative hypothesis: true mean is not equal to 10
# 95 percent confidence interval:
#   9.924374 10.157135
# sample estimates:
#   mean of x 