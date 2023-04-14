n=50;lambda=2;
x=rpois(n,lambda);
a=qnorm(0.025,0,1,lower.tail=FALSE)
#VST
ll_1=(sqrt(mean(x))-a/(2*sqrt(n)))^2;
ul_1=(sqrt(mean(x))+a/(2*sqrt(n)))^2;
length_1=ul_1-ll_1;
