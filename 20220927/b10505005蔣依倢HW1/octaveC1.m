filename = "hw1CD.dat";
[datax, datay] = textread(filename, "%f %f",'headerlines',1);
x0 = datax;
y0 = datay;
x = linspace(-1,1,500)
y = zeros(d, 500);
y=y+1;

for j = 1:d
  for i = 1:d
    if j == i
      continue;
          #skip and continue the loop
    endif
    y(j, :) .*= ((x-x0(i))/(x0(j)-x0(i)));
  endfor
 endfor

for k = 1:1:d
  subplot(4,3,k)
  plot(x,y(k,:))

  set(gca,'FontSize',10)
  xlabel("x",'FontSize',15);
  ylabel("Lj(x)",'FontSize',15);
  title(x0(k),'FontSize',15);
  grid on;

end

