close all;
clear all;
clc;

rand('seed', 35);

lambda = 0.5;

T = 10;

n = 1000;

M = 2000;

delta = T / n;

p = lambda * delta;

arribos = rand(M, n) < p;

N = cumsum(arribos, 2);

t = linspace(0,T,n);

figure();
stairs(t, N(1:5,:)', 'linewidth', 2);
grid on;
title(['Realizaciones de N(t) para p = ' num2str(p)]);
xlabel('t / s');
ylabel('N(t)');

[h, xc] = hist(sum(arribos, 2), 0:15);

mu = lambda*T;
m = 0;

figure();
stem(xc, h / (sum(h) * (xc(2) - xc(1))), 'linewidth', 2, 'filled');
hold on;
grid on;
stem(xc, e^(-mu)*mu.^xc ./ factorial(xc), 'linewidth', 2, 'filled');
xlim([-1, 16])

mu_est = mean(N);

figure();
plot(t, lambda * t, 'linewidth', 2, t, mu_est, 'linewidth', 2);
grid on;
legend(['Media teórica'; 'Media estimada']);
xlabel('t / s');
ylabel('\mu_N(t)');

primer_arribo = zeros(M, 1);

for i = 1:M
  idx = find(arribos(i,:) ~= 0, 1, 'first');
  if ~isempty(idx)
    primer_arribo(i) = idx * delta;
  else
    primer_arribo(i) = T;
  endif
endfor

[h, xc] = hist(sum(primer_arribo, 2), 20);

figure();
bar(xc, h / (sum(h) * (xc(2) - xc(1))));
hold on;
grid on;
plot(t, lambda * e.^(-lambda*t), 'linewidth', 2);
legend(['Estimación'; 'Teórico']);
ylabel('f_{T_1}(t)');
xlabel('t / s');
title('Densidad de tiempo hasta el primer arribo');
