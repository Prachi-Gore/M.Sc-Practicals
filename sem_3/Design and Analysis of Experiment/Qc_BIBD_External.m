clc;close all;clear all;
y=[35 42 31 30  ...
   41 45 32 40  ...
   40 42 33 39  ...
   32 33 35 36 ...
   40 38 35 37  ]'
F_A=[1 2 3 4  ...
    1 2 4 5  ...
    2 3 4 5  ...
    1 3 4 5  ...
    1 2 3 5  ]';
F_B=[1 1 1 1 ...
    2 2 2 2  ...
    3 3 3 3  ...
    4 4 4 4  ...
    5 5 5 5  ]';
del=dummyvar(F_A);
dd=dummyvar(F_B);
N=del'*dd;
R=del'*del;
K=dd'*dd;
G=sum(y);
T=del'*y;
B=dd'*y;
n=length(y);
[v b]=size(N);%
r=4;k=4;lambda=3;
CF=(G^2)/n;
Q=T-N*inv(K)*B;
%COMPARE 2ND AND 4TH Treatment%
Q2=Q(2);%
Q4=Q(4);%
SStreatAdj=Q'*Q*(k/(lambda*v));
SSblockUnadj=(B'*B)/k-CF;
SST=y'*y-CF;
SSE=SST-SStreatAdj-SSblockUnadj;
MSE=SSE/(n-v-b+1);
F_CAL=(Q2-Q4)*k/(lambda*v*MSE);
p_value=1-fcdf(F_CAL,1,n-v-b+1)
% DISK DRIVE D & B does not differ significantly (failed to reject H0 ) % 

