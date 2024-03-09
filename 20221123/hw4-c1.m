%要用到的東西
f = @(x) sin(2*x)+0.1*sin(15*x);
g = @(x) sin(2*x)+0.1*cos(15*x);
N = 32;
h = 2*pi/N;
x = [0:h:2*pi-h];
f_x = f(x);
g_x = g(x);

%算H
H = f_x.*g_x;
H_hat = fft(H);
H = ifft(H_hat);

%算h
f_hat = fft(f_x);
g_hat = fft(g_x);
f_hat = [f_hat(N/2+1:N), f_hat(1:N/2)]; %轉換成課本的順序
g_hat = [g_hat(N/2+1:N), g_hat(1:N/2)];

h_hat = zeros(1,N);
for k = [1:N]
  for m = [1:N]
    if and (0<(k-m+(N/2+1)), (k-m+(N/2+1))<N+1)
      h_hat(k) = h_hat(k) + f_hat(m).*g_hat(k-m+N/2+1)/N;
    endif
  endfor
endfor

h_hat = [h_hat(N/2+1:N), h_hat(1:N/2)];
h = ifft(h_hat);

%算E
f_E = @(x) sin(2*x).^2 + 0.1*sin(2*x).*(sin(15*x)+cos(15*x)) + 0.01*sin(15*x).*cos(15*x);
E = f_E(x);
E_hat = fft(E);
E = ifft(E_hat);

%畫圖！
%{
plot(x, H_hat, 'o', 'Markersize', 3);
hold on
plot(x, h_hat, '^', 'Markersize', 3);
hold on
plot(x, E_hat);
xlabel('x', 'Fontsize', 20);
ylabel('?hat', 'Fontsize', 20)
title('FFT coefficient', 'Fontsize', 20)
legend('H', 'h', 'E', 'Fontsize', 20)
%}

plot(x, H, 'o', 'Markersize', 3);
hold on
plot(x, h, '^', 'Markersize', 3);
hold on
plot(x, E);
xlabel('x', 'Fontsize', 20);
ylabel('y', 'Fontsize', 20)
title('iFFT coefficient', 'Fontsize', 20)
legend('H', 'h', 'E', 'Fontsize', 20)

