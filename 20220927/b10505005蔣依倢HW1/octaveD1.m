filename = "hw1CD.dat";
[datax,datay] = textread(filename, "%f %f", 'headerlines', 1);

x0 = datax;
y0 = datay;
n = size(x0, 1)
matrix = zeros (n, n);
f = zeros (n, 1);

gsd = zeros(n, 1);

delta = diff(x0);

for k = 1+1:n-1
  for j = 1:n
    if k == j+1
      matrix(k, j) = delta(j, 1)./6
    elseif k == j
      matrix(k, j) = (delta(j, 1) +delta (j-1, 1))./3;
    elseif k ==j-1
      matrix(k, j) = delta(j-1, 1)./6;
    endif
  endfor
endfor

for q = 1+1:n-1
  f(q, 1) = (y0(q+1)-y0(q))./delta(q, 1)-(y0(q)-y0(q-1))./delta(q-1, 1)
endfor

gsd = matrix\f; ########
gsd(1, 1) = 0;
gsd(n, 1) = 0;

disp(gsd)


