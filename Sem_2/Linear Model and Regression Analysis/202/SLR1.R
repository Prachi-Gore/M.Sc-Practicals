x=c(2,7,9,4,12,6,9,3,3,2)
y=c(650,1200,1300,430,1400,900,1800,640,793,925)
plot(x,y,xlab="Household Size",ylab="Water Used",main = "scatter plot")
cor(x,y)
n=length(y)
cor.test(x,y,method = "pearson") # bydefault method
model=lm(y~x) # to get parameters 
model
summary(model)
confint(model,level=0.95)
# or confint.lm(model)

# model_1=glm(y~x,family='gaussian');model_1
# use of glm setup
X=matrix(c(rep(1,n),x),nrow=10,byrow = F);X
S=t(X)%*%X;S
library(MASS)
library(Matrix)
G=solve(S);G  #rgular inverse
Y=matrix(y,n,1)
beta_hat=G%*%t(X)%*%Y
beta_hat

#p_value=pf(14.58,1,8,lower.tail=F)

predict(model,data.frame(x=c(4,5,6))) # our qn is only for 5
predict(model,interval = "confidence")

predict(model,data.frame(x=c(4,5,6)),interval="confidence")
predict(model,data.frame(x=c(4,5,6)),interval = "prediction")

# to fit the line
abline(model)

names(model)
# model$
par(mfrow=c(2,2))
plot(model)

# Analysis of variance table
anova(model)
