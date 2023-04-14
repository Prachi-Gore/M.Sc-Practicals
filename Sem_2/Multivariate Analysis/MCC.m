x1=[191 195 181 183 176 208 189 197 188 192 179 183 174 190 188 163 195 186 181 175 192 174 176 197 190 195];
x2=[155 149 148 153 144 157 150 159 152 150 158 147 150 159 151 137 155 153 145 140 154 143 139 167 163 159];
x3=[179 201 185 188 171 192 190 189 197 187 176 174 185 195 187 161 183 173 182 165 185 178 176 200 187 168];
x4=[145 152 149 149 142 152 149 152 159 151 148 147 152 157 158 130 158 148 148 137 152 147 143 158 150 139];
X=[x1;x2;x3;x4];
p=4;
n=length(X);
mu_hat=mean(X,2);
s=cov(X')*(n-1)/n;  %....mle of sigma..%
corrcoef(s) ;      %....sample correlation coefficient matrix using s ...%
s11=s(1,1);
s22=s(2:p,2:p);
smcc=sqrt(1-det(s)/(s11*det(s22))) ; %...sample multiple correlation coefficient..%
fprintf('\n\tsample multiple correlation coefficient = %f\n',smcc)

SS=s([3 1 2 4],[3 1 2 4])