filename = 'hw1AB.dat'
[xj,yj]=textread(filename,'%f %f','HeaderLines',1)

d = length(x0); #x0的行數
delta = zeros(1,d);
g=zeros(d,d);
g(1,1)=1;
g(d,d)=1;
f=zeros(d,1)
f(1,1)=0
f(d,1)=0

for i=1:(d-1)
  delta(1,i)=x0(i+1)-x0(i);
endfor

for j=2:d-1
  for k=1:d
    if k==j-1
       g(j,k)=delta(j-1)./6;
    endif
    if k==j
       g(j,k)=(delta(j)+delta(j-1))./3;
    endif
    if k==j+1
       g(j,k)=delta(j)./6;
    endif
  endfor
 endfor

for l=2:d-1
  f(l,1)=((y0(l+1).-y0(l))./delta(l)).-((y0(l).-y0(l-1))./delta(l-1));
endfor

s=g\f
t=s'

q=ones(10,2001)
for m=1:10
x=x0(m):0.0001:x0(m+1)
q(m,:)=q(m,:).*((t(m)/6)*((((x0(m+1)-x).^3)/delta(m))-(delta(m)*(x0(m+1)-x)))+((t(m+1)/6)*((((x-x0(m)).^3)/delta(m))-(delta(m)*(x-x0(m)))))+y0(m)*((x0(m+1)-x)/delta(m))+y0(m+1)*((x-x0(m))/delta(m)));
plot(x,q(m,:))
hold on;
endfor;


