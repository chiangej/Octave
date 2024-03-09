filename = "hw1E.dat";
[datax,datay] = textread(filename, "%f %f",'headerlines',1);
x0 = datax;
y0 = datay;
n = size(x0,1)




 for i = 1:n
   z0(i, 1) = 3.6 *sin(2*x0(i));
 endfor

for i = 1:n
   q0(i, 1) = cos(x0(i));
endfor

disp(q0)
disp(z0)

p0 = y0 .- z0

a = p0./q0

w1=linspace(0,6.28,500)
w2 = 1.2*cos(w1)+3.6*sin(2*w1)

figure
plot(w1,w2)

