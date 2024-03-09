h=7/8
x=1:h:8
y=0
I=2.1620386

for i = 1:9
  if i == 1 || i == 9
    y=y+(h/3*log(x(i))/x(i))
  endif
  if rem(i,2) == 0
    y=y+(4*h/3*log(x(i))/x(i))
  endif
  if i != 1 && i != 9 && rem(i,2) != 0
    y=y+(2*h/3*log(x(i))/x(i))
  endif
endfor
y
errory = abs(I-y);
errory
