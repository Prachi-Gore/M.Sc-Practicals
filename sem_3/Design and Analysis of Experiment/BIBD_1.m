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
N=del'*dd;
[v b]=size(N);
n=length(y);
R=del'*del;
K=dd'*dd;
G=sum(y)
T=del'*y
B=dd'*y
D=K-N'*inv(R)*N;
P=B-N'*inv(R)*T
beta_hat=pinv(D)*P;
SSt_unadj=T'*inv(R)*T-G^2/n
SSb_adj=beta_hat'*P
SS_total=y'*y-G^2/n
SSE=SS_total-SSt_unadj-SSb_adj
MSb_adj=SSb_adj/(b-1);
MSE=SSE/(n-v-b+1);
Fb_adj=MSb_adj/MSE;
Pb_adj=1-fcdf(Fb_adj,b-1,n-v-b+1);

ANOVA2=[v-1  SSt_unadj 0 0  0
       b-1  SSb_adj MSb_adj Fb_adj  Pb_adj
       n-v-b+1 0    MSE 0   0
       n-1  0   0   0   0];
 fprintf('\n\t Ho:B1=B2=....=Bb\n\n\n')
 format short g ;  
 disp(ANOVA2) ;
   



