filename = "hw1AB.dat";
[datax,datay] = textread(filename, "%f %f",'headerlines',1);
x0 = datax;
y0 = datay;
x = linspace(-1,1,5000)


function[y] = lagrange(x, x0, y0)
a = size(x0, 1)
y=0;
for j = 1:a
  p = 1;
  for i = 1:a
    if j  == i
      continue;
    endif
    p.*=(x-x0(i))/(x0(j)-x0(i));
  endfor
  y += y0(j)*p;
endfor
endfunction
y = lagrange(x,x0,y0);

figure
plot(x,y)

