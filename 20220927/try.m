xarray= -1:0.2000:1
yarray=[0.0385 0.588 0.1000 0.2000 0.5000 1.0000 0.5000 0.2000 0.1000 0.588 0.0385];
l = linspace(-1,1,5432)
function[t] = lagrange(l, xarray, yarray)
s= size(xarray, 1)
t=0;
for j = 1:s
 n = 1;
 for i = 1:s
  if j  == i
   continue;
  endif
  n.*=(l-xarray(i))/(xarray(j)-xarray(i));
 endfor
 t += yarray(j)*n;
endfor
endfunction
t = lagrange(l,xarray,yarray);
figure
plot(l,t)
