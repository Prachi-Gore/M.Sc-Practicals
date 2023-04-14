# Qn 1
x1=c(22,19,23,31,21,41,27,26,18,34,31,28,24,20,21,19,35) #Age
x2=c(175,152,165,162,193,137,182,162,172,160,172,160,163,185,190,168,137) #Height
x3=c(60,70,82,90,68,76,76,62,74,76,70,80,62,78,76,68,60) #DBP
x4=c(122,102,118,108,120,104,120,116,118,102,112,122,118,124,120,102,106) #SBP
y=c(3.1,3.4,3,3.2,4.9,2.4,4.5,3.1,4.4,2.9,4.2,3,3,4.7,4.8,4.1,2.3)#Volume
data=data.frame(y,x1,x2,x3,x4)
# a)
pairs(data) # plot command is there
Model_1=lm(y~x1+x2+x3+x4)
Model_1
summary(Model_1)
anova(Model_1)
# to test is dbp & sbp contributes significantly to the model
#H_0:beta_3=beta_4=0
Model_2=lm(y~x1+x2)    # Reduced Model
summary(Model_2)
SS_H=2.5207-1.9812
F_0=SS_H/2/0.1651
qf(0.05,2,12,lower.tail = F)
pf(F_0,4,12,lower.tail = F)
anova(Model_1,Model_2)
# to test is age & height contributes significantly to the model
#H_0:beta_1=beta_2=0
Model_3=lm(y~x3+x4) 
anova(Model_1,Model_3)

#b)
# 95% CI for regression coefficient 
confint(Model_1,level = .95)
# 95% CI for mean response 
predict.lm(Model_1,interval = "confidence")

# 95% CI for mean response when x1=24,x2=164,x3=75,x4=115
predict.lm(Model_1,data.frame(x1=24,x2=164,x3=75,x4=115),interval = "confidence")

# future prediction for mean response when x1=24,x2=164,x3=75,x4=115
predict.lm(Model_1,data.frame(x1=24,x2=164,x3=75,x4=115),interval = "prediction")

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
