curve(rbeta(100,1,1))

p = seq(0,1, length=100)
plot(p, dbeta(p, 1.1, 1.1), ylab="density", type ="l", col=4)

vvv <- rbeta(100,1.1,1.1)*10
hist(vvv)

library(nortest)
shapiro.test(vvv)
lillie.test(vvv)

install.packages("msm")
library(msm)
vvv <- rtnorm(20, 6,2,4,8)
hist(vvv)

p = seq(0,10, length=100)
plot(p, dtnorm(p, 6,2,4,8), ylab="density", type ="l", col=4)


library(nortest)
shapiro.test(vvv)
lillie.test(vvv)


bbb <- 100 * runif(20,0,1)
shapiro.test(bbb)
lillie.test(bbb)
hist(bbb)

# combineer uniform en normaal verdeeld

ggg <- rnorm(100,100,20)
hist(ggg)

hhh <- runif(80,60,140)
hist(hhh)

ggg[ggg < 60 | ggg > 140]


jjj <- round(rnorm(50,5,2))
shapiro.test(jjj)
lillie.test(jjj)
hist(jjj)


#

ppp <- round(rtnorm(50, 7,4,3,10))
hist(ppp)

ppp <- round(rnorm(50,7,2))
hist(ppp)
shapiro.test(ppp)
lillie.test(ppp)


# three modes

n1 <- rnorm(100, 10, 5)
n2 <- rnorm(100, 25, 5)

N <- c(n1,n2)

hist(N,breaks = 20)

shapiro.test(N)
lillie.test(N)


# normaal met outliers

hhh <- rnorm(25, 50,5)
hist(hhh)

hhh <- c(hhh, 100,100,20,20)
hist(hhh)

shapiro.test(hhh)
lillie.test(hhh)
