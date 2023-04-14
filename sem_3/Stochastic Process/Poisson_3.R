td=c(1.23,2.21,2.83,6.05,7.08,17.8)
lambda=1.5
Nt=rep(0,length(td))
Nt[1]=rpois(1,1.5*(td[1]))
for (i in 2:length(td)) {
  Nt[i]=Nt[i-1]+rpois(1,lambda*(td[i]-td[i-1]))
  
}
data.frame(td,Nt)