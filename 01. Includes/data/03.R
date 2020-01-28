RNGkind(sample.kind = "Rounding")
set.seed(1)

mu <- 6.3
sigma <- 1.2
Cijfers_2010 <- rnorm(180, mu, sigma)
Cijfers_2010 <- Cijfers_2010[Cijfers_2010 <= 10 & Cijfers_2010 >= 1]
Cijfers_2010 <- sapply(Cijfers_2010, round, 3)

mu <- 6.3
sigma <- 1.2
Cijfers_2010_n30 <- rnorm(30, mu, sigma)
Cijfers_2010_n30 <- Cijfers_2010_n30[Cijfers_2010_n30 <= 10 & Cijfers_2010_n30 >= 1]
Cijfers_2010_n30 <- sapply(Cijfers_2010_n30, round, 3)

mu <- 6.45
sigma <- 1.2
Cijfers_2011 <- rnorm(160, mu, sigma)
Cijfers_2011 <- Cijfers_2011[Cijfers_2011 <= 10 & Cijfers_2011 >= 1]
Cijfers_2011 <- sapply(Cijfers_2011, round, 3)

mu <- 6.45
sigma <- 1.2
Cijfers_2011_n30 <- rnorm(30, mu, sigma)
Cijfers_2011_n30 <- Cijfers_2011_n30[Cijfers_2011_n30 <= 10 & Cijfers_2011_n30 >= 1]
Cijfers_2011_n30 <- sapply(Cijfers_2011, round, 3)

Cijfers <- c(Cijfers_2010, Cijfers_2011)
Cohort <- c(replicate(180, 2010), replicate(160, 2011))
Cijfers_gem <- data.frame(Cijfers, Cohort)