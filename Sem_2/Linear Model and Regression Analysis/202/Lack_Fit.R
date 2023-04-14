# Q 1)
x=c(1,1,2,3.3,3.3,4,4,4,4.7,5,5.6,5.6,5.6,6,6,6.5,6.9);x
y=c(10.84,9.3,16.35,22.88,24.35,24.56,25.86,29.16,24.59,22.25,25.9,27.2,25.61,25.45,26.56,21.03,21.46)
plot(x,y) # one can observe that there are multiple response corresponding to one x value
Reduced=lm(y~x)
Reduced
Full=lm(y~0+as.factor(x))
Full
anova(Reduced,Full)

# Q 2)
y=c(26,24,175,160,163,55,62,100,26,30,70,71)
x1=c(1,1,1.5,1.5,1.5,1,2,0.5,1,1,1,1)
x2=c(1,1,4,4,4,2,5,3,2,2,3,3)
Reduced=lm(y~x1+x2)
Full=lm(y~0+as.factor(x1)+as.factor(x2))
anova(Reduced,Full)

# Q 4)
#data=read.table('clipboard',header = T)
y=c(16.68,11.5,12.03,14.88,13.75,18.11,8,17.83,79.24,21.50,40.33,21,13.5,19.75,24,29,15.35,19,9.5,35.10,17.9,52.32,18.75,19.83,10.75)
x1=c(7,3,3,4,6,7,2,7,30,5,16,10,4,6,9,10,6,7,3,17,10,26,9,8,4)
x2=c(560,226,340,80,150,330,110,210,146,605,688,215,255,462,448,776,200,132,36,770,140,810,450,635,150)
Reduced=lm(y~x1+x2)
Full=lm(y~0+as.factor(x1)+as.factor(x2))
anova(Reduced,Full)
fit=lm(y~x1+x2);fit
par(mfrow=c(2,2))
plot(fit)
hist(fit$residuals)
plot(x1,fit$residuals)
plot(x1,fit$residuals)