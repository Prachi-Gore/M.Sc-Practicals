n1=1977;n2=906;n3=904;n4=32;n=n1+n2+n3+n4;
theta=c(1-(4*n2/n),rep(0,9))#theta
for (i in 1:10) {
  u=theta[i];
  I=(2*u+1)/(2*u*(1-u)*(2+u));
  d_l=n1/(2+u)-(n2+n3)/(1-u)+(n4/u);
  theta[i+1]=theta[i]+d_l/(n*I);#SCORING METHOD
  
}
theta