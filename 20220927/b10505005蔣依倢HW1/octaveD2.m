filename = 'hw1CD.dat'
[xj,yj]=textread(filename,'%f %f','HeaderLines',1)

d = length(x0); #x0的行數

g=zeros(d,d);
g(1,1)=1;
g(d,d)=1;
f=zeros(d,1)
f(1,1)=0
f(d,1)=0

delta = diff(x0)

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

q=ones(10,5000)
for h=1:10
  set(gca,'FontSize',20);
xlabel("X",'FontSize',20);
ylabel("g(x)",'FontSize',20);
title("g(x) with 11 datas in hw1CD",'FontSize',20);
grid on;
x = linspace(x0(h), x0(h+1), 5000)
q(h,:)=q(h,:).*((t(h)/6)*((((x0(h+1)-x).^3)/delta(h))-(delta(h)*(x0(h+1)-x)))+((t(h+1)/6)*((((x-x0(h)).^3)/delta(h))-(delta(h)*(x-x0(h)))))+y0(h)*((x0(h+1)-x)/delta(h))+y0(h+1)*((x-x0(h))/delta(h)));
plot(x,q(h,:))
hold on;
endfor;


