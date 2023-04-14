clc;clear all;close all
% Q 2 
p=5;n=300;
s=[4.308 1.683 1.803 2.155 -0.253;
    1.683 1.768 0.588 0.177 0.176;
    1.803 0.588 0.81 1.0650 -0.158;
    2.155 0.177 1.065 1.970 -0.357;
    -0.253 0.176 -0.158 -0.357 0.504];
m=zeros(p,1);
% manipulation %
q=1;
s11=s(1:q,1:q);  s12=s(1:q,q+1:p);
s21=s12';        s22=s(q+1:p,q+1:p);
% sample and estimation %
x=mvnrnd(m,s,n)';
s_hat=cov(x')*(n-1)/n;  % mle of s
s11_hat=s_hat(1:q,1:q);
s22_hat=s_hat(q+1:p,q+1:p);
% calculation and output %
r1_2345=sqrt(1-(det(s)/(s11*det(s22))));
sr1_2345=sqrt(1-(det(s_hat)/(s11_hat*det(s22_hat))));
fprintf('\n\t MCC r1.2345=%f\n',r1_2345);
fprintf('\n\t sample MCC r1.2345=%f\n',sr1_2345);
% PCC Calculation and output %
q=2;
s11=s(1:q,1:q);  s12=s(1:q,q+1:p);
s21=s12';        s22=s(q+1:p,q+1:p);
s11_2=s11-s12*inv(s22)*s21;
r12_345=s11_2(1,2)/sqrt(s11_2(1,1)*s11_2(2,2));
fprintf('\n\t  partial corr coefficient r12.345=%f\n',r12_345);

s11_h=s_hat(1:q,1:q);  s12_h=s_hat(1:q,q+1:p);
s21_h=s12_h';        s22_h=s_hat(q+1:p,q+1:p);
s11_2_h=s11_h-s12_h*inv(s22_h)*s21_h;
r12_345_h=s11_2_h(1,2)/sqrt(s11_2_h(1,1)*s11_2_h(2,2));
fprintf('\n\t  sample partial corr coefficient r12.345=%f\n',r12_345_h);

