# Example_1
# One sample problem
x=c(203,168,187,235,197,163,214,233,179,185,197,216)
y=sum(x>195)
binom.test(y,length(x),alternative = "greater")
# Example 2
x=c(15.4,16.4,17.3,18.2,19.2,20.9,22.7,23.6,24.5)
wilcox.test(x,mu=20)
# Example 3
x=c(0.59,0.72,0.47,0.43,0.31,0.56,0.22,0.90,0.96,0.78)
ks.test(x,"punif")

#.................. test for normality........
x=c(5,5,5.3,4.9,5,5.2,5.2,4.9,4.9,5,4.7,5,5,5.1,5.2,4.9,5.1,5.4,5.1,5.1,
    4.9,5.1,5.1,5.3,5.2,5.3,5,5.1,5,5.2)
par(mfrow=c(1,2))
hist(x)
boxplot(x)
par(mfrow=c(1,1))
qqnorm(x)
qqline(x)
# Shapiro-Wilk test
shapiro.test(x)
# Shapiro-Francia Test 
sf.test(x)
# The Cramer-von Mises test
cvm.test(x)
# Anderson-Darling Test
ad.test(x)
# D'Agostino Normality Test
install.packages("fBasics")
library(fBasics)
dagoTest(x)

# Lilliefors Test for Normality
install.packages("nortest")
library(nortest)
lillie.test(x)

# Example 4
# Comparing two populations
# 1. Two independent samples
x=c(1011.07,1066.82,610.8,1111.44,955.68,1203.84,1600.32,555.9,1302.95,182.34,1233.2,1402.09)
y=c(496.44,541.76,1562.01,2515.12,1133.99,300.33,482.55,503.22,2744.23,1232.22)
wilcox.test(x,y)
ks.test(x,y)
wilcox.test(x,y,alt="greater")

# Example_5
# Paired data
x=c(1.83,0.50,1.62,2.48,1.68,1.88,1.55,3.06,1.30)
y=c(0.878,0.647,0.598,2.05,1.06,1.29,1.06,3.14,1.29)
# Wilcoxon signed rank test
wilcox.test(x,y,paired = T, alt="greater")

# sign test
#library(BSDA)
#SIGN.test(x,y,md=0,alternative = "greater", conf.level = 0.95)

#shapiro.test(x-y)
#t.test(x,y,paired = T, alternative = "greater")

# Example_6
# Testing equality of two DFs
x=c(40,30,40,45,55,30)
y=c(50,50,45,55,60,40)
ks.test(x,y)

# Example_7
y=c(17,19,20,21,18,16,16,19,21,23,22,20,19)
University=as.factor(c(rep("A",5),rep("B",3),rep("C",5)));University
d=data.frame(y,University);d
kruskal.test(y~University,data=d)

# Example_8
A=as.table(rbind(c(10,8),c(15,17),c(30,20)));A
dimnames(A)=list(Income=c("less than 30,000", "30,000-50,000", "more than 50,000"),
                 Res_Status=c("Homeowner","Renter"))
chisq.test(A)
chisq.test(A)$observed
chisq.test(A)$expected


a=c(5,3,1,2,4)
b=c(3,1,5,4,2)
cor(a,b,method="kendall")

cor.test(a,b,method="kendall")

# Some other nonparametric tests
# Nonparametric test for two way ANOVA with one observations per cell
y=c(8,10,6,8,3,4,5,4,7,8,6,7)
Fertilizer=as.factor(rep(1:4,each=3))
Variety=as.factor(rep(c("A","B","C"),times=4))
d=data.frame(y,Fertilizer,Variety)
friedman.test(y,Fertilizer,Variety)

friedman.test(y~Fertilizer|Variety)

#.....Test for equality of variances

x=c(0,14,18,0,31,0,0,0,11,0)
y=c(37,42,12,32,105,84,15,47,51,65)
d=stack(list(x=x,y=y))
names(d)
# Levene's test
library(car)
leveneTest(d$values,d$ind)

# Fligner-Killeen Test of homogeneity 
fligner.test(d$values~d$ind, data=d)