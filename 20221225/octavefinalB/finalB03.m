eta = 0.4;
N = 6/eta;
x = [0:eta:6]';
a0 = x/6;
b0 = zeros(N+1,1);
ri = zeros(N+1,1);
z = zeros(N+1,1);

W = zeros(N+1,N+1);
for i=1:N+1;
  for j=1:N+1;
    if j==i-1;
      W(i,j)=1;
    endif;
    if j==i;
      W(i,j)=4;
    endif;
    if j==i+1;
      W(i,j)=1;
    endif;
  endfor;
endfor;
W(1,1)=1;
W(1,2)=2;
W(N+1,N)=2;
W(N+1,N+1)=1;
Y = zeros(N+1,N+1);
for i=1:N+1;
  for j=1:N+1;
    if j==i-1;
      Y(i,j)=-3;
    endif;
    if j==i+1;
      Y(i,j)=3;
    endif;
  endfor;
endfor;
Y(1,1)=-5/2;Y(1,2)=2;Y(1,3)=1/2;Y(N+1,N-1)=-1/2;Y(N+1,N)=-2;Y(N+1,N+1)=5/2;
D1=W\Y;
D1=D1/0.2
D2 = D1*D1;


p = 1;
while p > 0.0001
da0 = D1*a0;
dda0 = D2*a0;
db0 = D1*b0;


O = zeros(2*N+2,2*N+2);
for j = [1:N+1]
  for k = [1:N+1]
    O(j,k) = D1(j,k);
  endfor
endfor

for k = [N+2:2*N+2]
  for j = [1:N+1]
    if j = k - (N+1)
      O(j,k) = -1;
    else
      O(j,k) = 0;
    endif
  endfor
endfor

for j = [N+2:2*N+2]
  for k = [1:N+1]
    if j = k + (N+1)
      O(j,k) = da0(k,1);
    endif
  endfor
endfor
X = zeros(N+1,N+1);
for j = [1:N+1]
  for k = [1:N+1]
    if j = k
      X(j,k) = b0(k,1);
    endif
  endfor
endfor
XX = D2 + X*D1;

for j = [N+2:2*N+2]
  for k = [N+2:2*N+2]
    O(j,k) = XX(j-(N+1),k-(N+1));
  endfor
endfor
%定義T矩陣
T = zeros(N+1,1);
for j = [1:N+1]
  T(j,1) = a0(j)-db0(j);
endfor
for j = [N+2:2*N+2]
  T(j,1) = -b0(j-(N+1),1)*da0(j-(N+1),1)-dda0(j-(N+1),1);
endfor

O(1,:)=0;O(N+2,:)=0;O(2*N+2,:)=0;O(1,1)=1;O(N+2,N+2)=1;O(2*N+2,2*N+2)=1;
T(1)=0;T(N+2)=0;T(2*N+2)=0;
B = O\T;

for j = [1:N+1]
  ri(j,1) = B(j,1);
endfor
for j = [N+2:2*N+2]
  z(j-(N+1),1) = B(j,1);
endfor
b0 = b0 + ri;
a0 = a0 + z;
p = max(abs(ri),[],1)
endwhile
plot(x,b0)
hold on
plot(x,a0)
hold on
plot(x,da0)
dg0(1,1)
