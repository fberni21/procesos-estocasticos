close all;
clear all;
clc;

rand('seed', 3984);

N = 1000;

sigma = sqrt(20);
mu_X = 0;
mu_Y = 3;

X = normrnd(mu_X, sigma, 1, N);
Y = normrnd(mu_Y, sigma, 1, N);

R_Xb = xcorr(X, 'biased');
R_Xu = xcorr(X, 'unbiased');
R_Xteo = zeros(2*N-1, 1);
R_Xteo(N) = sigma^2;

n = -(N-1):(N-1);

figure();
hold on;
grid on;
plot(n, R_Xu, 'linewidth', 2);
plot(n, R_Xb, 'linewidth', 2);
plot(n, R_Xteo, 'linewidth', 2);
legend(['Estimador insesgado'; 'Estimador sesgado'; 'Teórico']);
title('Autocorrelación de X(n)');
xlabel('k');
ylabel('R_X(k)');

R_Yb = xcorr(Y, 'biased');
R_Yu = xcorr(Y, 'unbiased');
R_Yteo = zeros(2*N-1, 1) + mu_Y^2;
R_Yteo(N) += sigma^2;

figure();
hold on;
grid on;
plot(n, R_Yu, 'linewidth', 2);
plot(n, R_Yb, 'linewidth', 2);
plot(n, R_Yteo, 'linewidth', 2);
legend(['Estimador insesgado'; 'Estimador sesgado'; 'Teórico']);
title('Autocorrelación de Y(n)');
xlabel('k');
ylabel('R_Y(k)');

v = zeros(2*N-1, 1);
v(N) = 1;
for i = 1:(N-1)
  v(N+i) = (N - i) / N;
  v(N-i) = (N - i) / N;
endfor

figure();
plot(n, R_Yu'.*v, 'linewidth', 2);
grid on;
xlabel('k');
ylabel('R_Y(k) v(k)');
title('Autocorrelación de Y(n) escalada por una ventana');
