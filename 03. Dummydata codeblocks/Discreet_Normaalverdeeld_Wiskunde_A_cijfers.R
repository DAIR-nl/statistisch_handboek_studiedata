library(nortest)
set.seed(0)
decimalen <- rnorm(20, 13.5, 2.2)
Wiskunde_cijfers <- (0.5 * round(decimalen))[decimalen <= 20 & decimalen >= 9]
lillie.test(Wiskunde_cijfers)
