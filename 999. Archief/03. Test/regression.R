set.seed(12345)
x1 <- rnorm(100,3,4)
x2 <- rnorm(100,2,5)
y <- 0.3*x1 + 0.4*x2 + rnorm(100,0,1)

model <- lm(y ~ x1 + x2)

plot(cooks.distance(model))

mahalanobis(cbind(x1,x2),
            c(mean(x1),mean(x2)),
            cov(cbind(x1,x2)))

?lm
rstandard(model)
