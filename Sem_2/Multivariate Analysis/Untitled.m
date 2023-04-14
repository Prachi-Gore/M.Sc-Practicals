clc;clear all;
load iris
n1=50;n2=50
n=n1+n2;p=4
x=z(:,1:50);
y=z(:,51:100);
xbar=mean(x,2);
ybar=mean(y,2);
s1=cov(x');
s2=cov(y');
s=(n1-1)*s1+(n2-1)*s2;
d=inv(s)*(xbar-ybar);
fprintf('co-efficient vector of FLDF is:\n');
disp(d);
c=d'*(xbar+ybar)/2;


for i=1:n1+n2;
    if d'*z(:,i)>=c
        pop(i)=1;
    else
        pop(i)=2;
    end
end
n2_1=sum(pop(1:n1)==2)
n1_2=sum(pop(n1+1:n1+n2)==1)
n_miss=n2_1+n1_2;
p2_1=n2_1/n1
p1_2=n1_2/n2



