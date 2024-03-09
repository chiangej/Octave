clc;
clear all;

%initializing x,y,z,t
x(1)=1;
y(1)=1;
z(1)=1;
t(1)=0;

a=10;
rho=20;
b=(8.0/3.0);
h=0.001;
t=0:h:25;
f=@(t,x,y,z) a*(y-x);  %ode
g=@(t,x,y,z) x*rho-x.*z-y;
p=@(t,x,y,z) x.*y-b*z;
for i=1:(length(t)-1) %loop
    p1=f(t(i),x(i),y(i),z(i));
    q1=g(t(i),x(i),y(i),z(i));
    r1=p(t(i),x(i),y(i),z(i));
      p2=f(t(i)+h/2,(x(i)+0.5*p1*h),(y(i)+(0.5*q1*h)),(z(i)+(0.5*r1*h)));
      q2=g(t(i)+h/2,(x(i)+0.5*p1*h),(y(i)+(0.5*q1*h)),(z(i)+(0.5*r1*h)));
      r2=p(t(i)+h/2,(x(i)+0.5*p1*h),(y(i)+(0.5*q1*h)),(z(i)+(0.5*r1*h)));
      p3=f(t(i)+h/2,(x(i)+0.5*p2*h),(y(i)+(0.5*q2*h)),(z(i)+(0.5*r2*h)));
      q3=g(t(i)+h/2,(x(i)+0.5*p2*h),(y(i)+(0.5*q2*h)),(z(i)+(0.5*r2*h)));
      r3=p(t(i)+h/2,(x(i)+0.5*p2*h),(y(i)+(0.5*q2*h)),(z(i)+(0.5*r2*h)));
      p4=f(t(i)+h,(x(i)+p3*h),(y(i)+q3*h),(z(i)+r3*h));
      q4=g(t(i)+h,(x(i)+p3*h),(y(i)+q3*h),(z(i)+r3*h));
      r4=p(t(i)+h,(x(i)+p3*h),(y(i)+q3*h),(z(i)+r3*h));
      x(i+1) = x(i) + h*(p1 +2*p2 +2*p3 +p4)/6;
      y(i+1) = y(i) + h*(q1 +2*q2 +2*q3 +q4)/6;
      z(i+1) = z(i) + h*(r1 +2*r2 +2*r3 +r4)/6;
end
figure(1)
plot3(x,y,z)

figure(2)
plot(x,y)
hold on;
xlabel("x","fontsize",20)
ylabel("y","fontsize",20)
title("r =20, xy projection","fontsize",20)

figure(3)
plot(x,z)
hold on;
xlabel("x","fontsize",20)
ylabel("z","fontsize",20)
title("r =20, xz projection","fontsize",20)

figure(4)
plot(y,z)
hold on;
xlabel("y","fontsize",20)
ylabel("z","fontsize",20)
title("r =28, yz projection","fontsize",20)

figure(5)
plot(t,x)
hold on;
plot(t,y)
hold on;
plot(t,z)
xlabel("t","fontsize",20)
ylabel("x, y and z","fontsize",20)
title("r =20, x,y and z versus t","fontsize",20)
legend("x","y","z","fontsize",20,"location","northwest")
