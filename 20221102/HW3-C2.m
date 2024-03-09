format long
Iexact = 2;
f = @(x) sin(x);

Interval = 4;
delta = pi/Interval;
x4 = linspace(0, pi, Interval + 1);
I4 = 0;
for i = 1:Interval
  I4 = I4 + delta^3*(f(x4(i)) + f(x4(i+1)))/24 + delta*(f(x4(i)) + f(x4(i+1)))/2;
endfor

Interval = 8;
delta = pi/Interval;
x8 = linspace(0, pi, Interval + 1);
I8 = 0;
for i = 1:Interval
  I8 = I8 + delta^3*(f(x8(i)) + f(x8(i+1)))/24 + delta*(f(x8(i)) + f(x8(i+1)))/2;
endfor

Interval = 16;
delta = pi/Interval;
x16 = linspace(0, pi, Interval + 1);
I16 = 0;
for i = 1:Interval
  I16 = I16 + delta^3*(f(x16(i)) + f(x16(i+1)))/24 + delta*(f(x16(i)) + f(x16(i+1)))/2;
endfor

Interval = 32;
delta = pi/Interval;
x32 = linspace(0, pi, Interval + 1);
I32 = 0;
for i = 1:Interval
  I32 = I32 + delta^3*(f(x32(i)) + f(x32(i+1)))/24 + delta*(f(x32(i)) + f(x32(i+1)))/2;
endfor

error = zeros(1, 4);
error(1) = abs(Iexact - I4);
error(2) = abs(Iexact - I8);
error(3) = abs(Iexact - I16);
error(4) = abs(Iexact - I32);
GridSpace = [pi/4 pi/8 pi/16 pi/32];
plot(log2(GridSpace), log2(error))
