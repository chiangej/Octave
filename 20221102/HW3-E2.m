a=1
b=8
n=9
y=0
I=2.1620386

if (a < b)
    p(1,1)  =1;
    p(2,1:2)=[1 0];

    for k=2:n
        p(k+1,1:k+1)=((2*k-1)*[p(k,1:k) 0]-(k-1)*[0 0 p(k-1,1:k-1)])/k;
    end

    Pn       = p(n+1,:);
    Pn_deriv = polyder(Pn);

    x = roots(Pn);
    w = 2./((1-x.^2).*(polyval(Pn_deriv,x)).^2);
    x = (b+a)/2 + (b-a).*x/2;
    w = (b-a)/2 * w;

else
    disp('a >= b !!');
endif

for i = 1:9
  y=y+(w(i)*log(x(i))/x(i))
endfor
y
errory = abs(I-y);
errory
