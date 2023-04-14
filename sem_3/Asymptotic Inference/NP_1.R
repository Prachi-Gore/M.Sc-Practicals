#one sample problem
x=c(203,168,187,235,197,163,214,233,179,185,197,216)
y=sum(x>195)
binom.test(y,length(x),alternative = "greater")
# example 2
x=c(15.4,16.4,17.3,18.2,19.2,20.9,22.7,23.6,24.5)
wilcox.test(x,mu=20)
# example 3
x=c(0.59,0.72,0.47,0.43,.31,.56,.22,.9,.96,.78)
ks.test(x,"punif")

# Normality test
# shapiro wilk test

# shapiro francia test
 # anderson darling test
# the cramer won test
# D'Agostino Normality test
# Lilliefors test for Normality

