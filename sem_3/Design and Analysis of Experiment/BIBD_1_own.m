clc;close all;clear all;
y=[17 14 13 12  ...
    14 14 13 10 ...
    12 13 12 9  ...
    13 11 11 12 ...
    11 12 10 8]';
F_A=[1 1 1 1 ...
    2 2 2 2 ...
    3 3 3 3 ...
    4 4 4 4 ...
    5 5 5 5]';
F_B=[2 3 4 5 ...
    1 2 4 5  ...
    1 3 4 5 ...
    1 2 3 4 ...
    1 2 3 5 ]';
del=dummyvar(F_A);
dd=dummyvar(F_B);
n=length(del);
R=del'*del;
K=dd'*dd;
N=del'*dd;
[v b]=size(N);
k=4;r=4;
G=sum(y)
T=del'*y
B=dd'*y
Q=T-N*inv(K)*B;
P=B-N'*inv(R)*T
CF=G^2/n
lambda=3;     %replication of each pair of treatment%
SStreatUNADJ=(T'*T/r)-CF
SSblockADJ=k/(lambda*b)*(P'*P)
SST=(y'*y)-CF
SSE=SST-SStreatUNADJ-SSblockADJ



    