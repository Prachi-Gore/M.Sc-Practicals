# Q 1
lambda=5;n=50
x=rpois(n,lambda)
lam=seq(3,7,length.out=500)  # different values of lambda
lik_lamda=exp(-n*lam)*lam^(sum(x))
plot(lam,lik_lamda,main="likelihood fn for poisson dist",col='pink',lwd=1)
abline(v=mean(x),col='green') # at this pt our fn is max
abline(v=5,col='brown')  # pink,red


# Q 5
# theta=2.5;
n=10
x=runif(n,0,theta)
theta=seq(2,7,length.out =100 )
L_theta=ifelse(max(x)<theta,(1/theta)^n,0)
plot(theta,L_theta,main="likelihood fn for poisson dist",col='purple',lwd=1)
abline(v=max(x),col='green')
abline(v=2*mean(x),col='red')

# Q 3 a)
n=20;
#mu=10;sigma=1
mu=seq(7,13,length.out =200);mu
#length(mu);length(x)
x=rnorm(n,mean=mu,sd=1);x
log_L_mu=exp(-.5*(-2*mu*sum(x)+n*mu^2))
plot(mu,log_L_mu,main="likelihood fn for Normal(when sigma known) dist",col='purple',lwd=1)
abline(v=10,col='green')
abline(v=mean(x),col='red') #at this pt our fn is max


# Q 3 b)

n=20;
#mu=10;sigma=1
sigma=seq(0.1,1.1,length.out =500);sigma
x=rnorm(n,mean = 10,sd=1);x
L_Log_sigma=-n*log(sigma)-0.5*sigma^-2*(sum(x^2)-2*10*sum(x)+n*10^2);L_Log_sigma
plot(sigma,L_Log_sigma,main="likelihood fn for Normal(when mu known) dist",col='purple',lwd=1)
abline(v=1,col='green')  # v:verticle line
abline(v=sqrt(var(x)*(n-1)/n),col='red') #at this pt our fn is max

