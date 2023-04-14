x1=c(80,93,100,82,90,99,81,96,94,93,97,95,100,85,86,87) # temp
x2=c(8,9,10,12,11,8,8,10,12,11,13,11,8,12,9,12)
y=c(2256,2340,2426,2293,2330,2368,2250,2409,2364,2379,2440,2364,2404,2317,2309,2328)#catalyst
data=data.frame(y,x1,x2)
# a)
pairs(data)
Model_1=lm(y~x1+x2)
Model_1
summary(Model_1)
one=rep(1,16)
X=matrix(c(one,x1,x2),byrow = FALSE,nrow=16)
S=t(X)%*%X;S
library(MASS)
cov_beta_hat=solve(S)*16.36*16.36  # MSres is available in anova()
cov_beta_hat
anova(Model_1)
# to check normality assumption
qqnorm(Model_1$residuals)
ks.test(Model_1$residuals,"pnorm")
shapiro.test(Model_1$residuals)
library(nortest)
ad.test(Model_1$residuals)
par(mfrow=c(2,2))
plot(Model_1)

library(lmtest)
bptest(Model_1)
library(PASWR)
EDA(Model_1$residuals)

