#poisson process

lambda=3# rate=mean
n=25
inter=rexp(n,lambda);inter
arrival=cumsum(inter);arrival#waiting time
t=5;
arrival=arrival[arrival<t];arrival
