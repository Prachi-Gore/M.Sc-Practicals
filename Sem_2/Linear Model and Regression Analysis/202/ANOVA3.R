
# Q 3 
y1=c(3.22,3.04,3.06,2.64,3.19,2.49)
y2=c(3.31,2.99,3.17,2.75,3.40,2.37)
y3=c(3.26,3.27,2.93,2.59,3.11,2.38)
y4=c(3.25,3.20,3.09,2.62,3.23,2.37)
boxplot(y1,y2,y3,y4) # vs field
n=length(y1)+length(y2)+length(y3)+length(y4)
Y=matrix(c(y1,y2,y3,y4),nrow = n)
Field=c(rep("1",6),rep("2",6),rep("3",6),rep("4",6))
m=c("A","B","C","D","E","F")
Variety=rep(m,4)
data=data.frame(Y,Field,Variety)
fit=aov(Y~Field+Variety,data=data)
fit
summary(fit)

