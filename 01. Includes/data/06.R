RNGkind(sample.kind = "Rounding")
set.seed(1)
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
Jaarlijks_inkomen <- replicate(2314, 13*(sample(Mogelijkheden, 1, replace=TRUE, p_2014)))