
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 06.R ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R code voor Student Analytics Vrije Universiteit Amsterdam
## Copyright 2020 VU
## Web Page: http://www.vu.nl
## Contact: Theo Bakker (t.c.bakker@vu.nl)
## Verspreiding buiten de VU: Ja
##
## Doel: Doel
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
## 29-06-2020: EG: Aanmaak bestand
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set.seed(123)

#Jaarlijks_inkomen <- rnorm()

Mogelijkheden <- c(1616:7000)
p_2014 <- c(
  rep(0.4,  385),     #1616-2000
  rep(0.55, 400),     #2000-2400 %>%
  rep(0.7,  400),     #2401-2800
  rep(0.8,  400),     #2801-3200
  rep(0.65, 400),     #3201-3600
  rep(0.45, 400),     #3601-4000
  rep(0.2,  1000),    #4001-5000
  rep(0.1,  1000),    #5001-6000
  rep(0.01, 1000)     #6001-7000
)
Jaarlijks_inkomen <- replicate(2314, 13*(sample(Mogelijkheden, 1, replace = TRUE, p_2014)))


# Maken grafieken assumpties verdelingen

#vvv <- rnorm(1000, 0, 2)
#vvv <- vvv - median(vvv)
#plot(density(vvv), ylab = "Frequentiedichtheid", xlab = "Waarden", 
#     main = "Symmetrische verdeling met nul als mediaan")

#hist(vvv, breaks=20)
#median(vvv)

#ranks <- sign(vvv)*rank(abs(vvv))
#hist(ranks, breaks=10, xlab = "Rangschikkingen", ylab = "Frequentie",
#     main = "Histogram met rangschikkingen symmetrische verdelingen")
#mean(ranks)
#median(ranks)

#lll <- rnorm(1000, 0, 2)
#hist(lll, breaks = 20)
#lll[sign(lll) == 1] <- 2*lll[sign(lll) == 1]
#lll <- lll - median(lll)
#plot(density(lll), ylab = "Frequentiedichtheid", xlab = "Waarden", 
#     main = "Scheve verdeling met nul als mediaan")
#hist(lll, breaks=20)
#median(lll)

#ranks <- sign(lll)*rank(abs(lll))
#hist(ranks, breaks=10, xlab = "Rangschikkingen", ylab = "Frequentie",
#     main = "Histogram met rangschikkingen scheve verdeling")
#mean(ranks)
#median(ranks)


#median(lll)
#lll <- 10 * (lll - median(lll))
#hist(lll)
#median(lll)

# wilcoxon test
#wilcox.test(vvv, mu = 0)
#wilcox.test(lll, mu = 0)

rm(
  Mogelijkheden,
  p_2014
)