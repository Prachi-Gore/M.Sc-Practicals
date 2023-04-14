#compound poisson process
lambda=1;time=15;
inter=rexp(30,rate = lambda);inter
arr=cumsum(inter);arr
arr=arr[arr<time];arr
n=length(arr)
x=rnorm(n,1000,20);x#amount diposited or withdrawn
zt=c(10000,10000+cumsum(x));zt#initial amt is 10k 
t1=c(0,arr);t1
t2=c(arr,time);t2
data.frame(t1,".."=rep("<=t<",n+1),t2,Nt=seq(0,n),zt)
