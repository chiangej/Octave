n = 15;
x = zeros(n,1);
pade = zeros(n,n);
fd=zeros(n,1);
f=zeros(n,1);
h=3/14;

for q=2:n;
  x(q,1)=x((q-1),1)+3/14;
endfor;

#build a pade matrix
for i=1:n;
  for j=1:n;
    if j==i-1;
      pade(i,j)=1;
    endif;
    if j==i;
      pade(i,j)=4;
    endif;
    if j==i+1;
      pade(i,j)=1;
    endif;
  endfor;
endfor;

pade(1,1)=1;
pade(1,2)=2;
pade(n,n-1)=2;
pade(n,n)=1;

for k=2:n-1;
  f(k,1)=3*(sin(5*x(k+1))-sin(5*x(k-1)));
endfor;

#define the boundaries
f(1,1)=(-5*sin(5*x(1))/2+2*sin(5*x(2))+sin(5*x(3))/2);
f(n,1)=(5*sin(5*x(15))/2-2*sin(5*x(14))-sin(5*x(13))/2);

f=f/h;
fd=pade\f;
#fd is found
y=5*cos(x*5);

plot(x,fd,'.-','MarkerSize',15)
hold on;
plot(x,y,'-.');
set(gca,'FontSize',15);
xlabel("x",'FontSize',20);
ylabel("first derivative",'FontSize',20);
title("Pade scheme differentiation",'FontSize',20);
legend('Computed','Exact');
