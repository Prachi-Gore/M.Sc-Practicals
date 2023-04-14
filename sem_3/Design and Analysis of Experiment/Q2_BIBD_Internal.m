clear all;close all;clc;
y=[1.11 1.7 1.6 ...
   1.22 1.11 1.22 ...
   0.95 1.52 1.54 ...
   0.82 0.97 1.18 ]';
F_A=[1 1 1 ...
    2 2 2 ...
    3 3 3 ...
    4 4 4 ]';
F_B=[1 2 3  ...
    2 3 4  ...
    1 3 4  ...
    1 2 4  ]';
del=dummyvar(F_A)
dd=dummyvar(F_B)
N=del'*dd
R=del'*del;
K=dd'*dd;
G=sum(y)
T=del'*y
B=dd'*y
lambda=2;k=3;v=4;b=4;r=3;n=12;
Q=T-N*inv(K)*B
P=B-N'*inv(R)*T;
CF=(G^2)/n
SStreatAdj=(Q'*Q)*k/(lambda*v);
SSblockUnadj=(B'*B/k)-CF;
SST=y'*y-CF;
SSEtreat=SST-SStreatAdj-SSblockUnadj;
MStreatAdj=SStreatAdj/(v-1);
MSEtreat=SSEtreat/(n-v-b+1);
F_CAL=MStreatAdj/MSEtreat;
p_value=1-fcdf(F_CAL,v-1,n-v-b+1)

fprintf('\n\t Ho:t1=t2=t3=t4\n\n\n');
ANOVA1=[v-1 SStreatAdj MStreatAdj F_CAL p_value 
      b-1  SSblockUnadj 0 0 0
      n-v-b+1 SSEtreat MSEtreat 0 0
      n-1 SST  0    0   0];
  format short g;
  disp (ANOVA1);

SStreatUnadj=(T'*T/r)-CF;
SSblockAdj=P'*P*k/(lambda*b);
SSEblock=SST-SStreatUnadj-SSblockAdj;
MSblockAdj=SSblockAdj/(b-1);
MSEblock=SSEblock/(n-v-b+1);
F_CAL_block =MSblockAdj/MSEblock;
p_value_block =1-fcdf(F_CAL,b-1,n-v-b+1);

fprintf('\n\n\t Ho:b1=b2=b3=b4\n\n\n');
ANOVA2=[v-1 SStreatUnadj 0 0 0
      b-1  SSblockAdj MSblockAdj F_CAL_block p_value_block 
      n-v-b+1 SSEblock MSEblock 0 0
      n-1 SST  0    0   0];
  format short g;
  disp (ANOVA2);


