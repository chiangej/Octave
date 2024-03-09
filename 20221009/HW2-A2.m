x = 4;
h = [1; 0.5; 0.1; 0.05; 0.01; 0.005];
n = size(h, 1)
yexact = (x*cos(x)-3*sin(x))/(x^4);
yforward = zeros(n, 1);
ysoc = zeros(n, 1);
yfoc = zeros(n, 1);

for i = 1:n
  yt1(i) = ((sin(x.+h(i))./((x.+h(i)).^3).-sin(x)./((x).^3))./h(i)); #forward difference
  yforward(i) = abs(yt1(i)-yexact); #the absolute values of error
endfor

for j = 1:n
  yt2(j) = ((sin(x.+h(j))./((x.+h(j)).^3).-sin(x.-h(j))./((x.-h(j)).^3))./(2*h(j))); #second-order central difference
  ysoc(j) = abs(yt2(j)-yexact)
endfor

for k = 1:n
  yt3(k) = (8.*(sin(x.+h(k))./((x.+h(k)).^3)).-8.*(sin(x.-h(k))./((x.-h(k)).^3)).-(sin(x.+2.*h(k))./((x.+2.*h(k)).^3)).+(sin(x.-2.*h(k))./((x.-2.*h(k)).^3)))./(12.*h(k));
  #forth-order central difference
  yfoc(k) = abs(yt3(k)-yexact)
endfor

figure(1),clf;
loglog(h,yforward,'o-');
hold on;
loglog(h,ysoc,'rx-');
loglog(h,yfoc,'s-');
set(gca,'FontSize',15);
xlabel("h--grid spacing",'FontSize',20);
