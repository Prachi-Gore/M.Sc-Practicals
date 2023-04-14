# Branching process

#offspring distribution
z=c(0,1,2,3);
pz=c(0.25,0.3,0,0.45);
x=rep(0,8);
x[1]=3;
for (i in 1:7) {
  x[i+1]=sum(sample(z,x[i],T,pz))
}
x
