x=c(165,167,180,155,212,175,190,210,200,149,158,169,170,172,159,168,174,183,215,195,180,143,240,235,192,187)
y=c(130,133,150,128,151,146,150,140,148,125,133,135,150,153,128,132,149,158,150,163,156,124,170,165,160,159)
plot(x,y,xlab="Weight",ylab="BP",main="Scatter plot")
cor(x,y)
cor.test(x,y,method = "pearson")
model=lm(y~x) # to get parameters 
model
summary(model)
confint(model,level=0.95)