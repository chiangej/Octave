%會用到的值
f = @(x) sin(3*x) + 3*cos(6*x);
f_d = @(x) 3*cos(3*x)-18*sin(6*x);
N=32;
h=2*pi/N;

%正確的微分
x = [0:0.01:2*pi];
plot(x, f_d(x));
hold on;

%central difference
n=[1:N-1];
f_central = (f(h*(n+1))-f(h*(n-1)))/(2*h);
plot((n*h), f_central, '^','MarkerSize',3);
hold on;

%FFT
k=[[0:N/2-1]';[-N/2:-1]']'
k(1)=0;
x=[0:h:2*pi-h];
f_hat = fft(f(x));
f_hat_d = i*k.*f_hat;
f_FFT = ifft(f_hat_d);
plot(x,f_FFT,'ks','MarkerSize',3);

%圖的裝飾
xlabel('x', 'Fontsize', 20);
ylabel('f(x)', 'Fontsize', 20)
title('Derivative of B1 when N=32', 'Fontsize', 20)
legend('exact', 'central diff', 'FFT', 'location','northeastoutside')
