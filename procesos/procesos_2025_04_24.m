close all;
clear all;
clc;

pkg load statistics;

% Actividad 1

rand('seed', 42);

M = 1000;
N = 100;

p = 0.7;

mu_X_exact = 2 * p - 1;
var_X_exact = 4 * p * (1 - p);

Z = rand(M, N) < p;

X = 2*Z - 1;

mu_X = mean(X)
var_X = var(X)

figure();

subplot(2, 1, 1);
stem(X(1,:));
hold on;
plot(mu_X);
plot([0 N], [mu_X_exact mu_X_exact], '--');
ylim([-1.2 1.2]);
legend(['Realización'; 'Media estimada'; 'Media teórica']);
title('Realización y media del proceso');
xlabel('n');
ylabel('X(n)');

subplot(2, 1, 2);
plot(var_X);
hold on;
plot([0 N], [var_X_exact var_X_exact], '--');
xlabel('n');
ylabel('\sigma^2(n)');
legend(['Varianza estimada'; 'Varianza teórica']);
title('Varianza del proceso');

% Actividad 2

rand('seed', 42);

M = 1000;

Ts = 0.01;

t = 0:Ts:(2-Ts);
N = length(t);

a = 0;
b = 1;
A = unifrnd(a, b, M, 1);
B = unifrnd(a, b, M, 1);

X = A .* t + B;

mu_X = mean(X)
var_X = var(X)

mu_X_exact = (a + b) / 2 * (t + 1);
var_X_exact = (b - a)^2 / 12 * (t .^ 2  + 1);

figure();

subplot(2, 1, 1);
plot(t, X(1:100,:)', 'color', 'b');
hold on;
plot(t, mu_X, 'linewidth', 4, 'color', 'r');
plot(t, mu_X_exact, '--', 'color', 'k', 'linewidth', 3);
title('Realizaciones y media del proceso');
xlabel('t / s');
ylabel('X(t)');

subplot(2, 1, 2);
plot(t, var_X);
hold on;
plot(t, var_X_exact, '--');
xlabel('t / s');
ylabel('\sigma^2(t)');
legend(['Varianza estimada'; 'Varianza teórica']);
title('Varianza del proceso');

% Actividad 3

rand('seed', 42);

M = 20;
N = 50;

n = 0:N;

probs = [0.2 0.5 0.8];

for p = probs
  Z = rand(M, N) < p;

  X = 2*Z - 1;

  Y = [zeros(M, 1) cumsum(X, 2)];

  mu_Y_exact = n * (2 * p - 1);
  var_Y_exact = n * 4 * p * (1 - p);

  mu_Y = mean(Y);
  var_Y = var(Y);

  figure();
  subplot(2, 1, 1);
  stairs(n, Y', 'color', 'b');
  hold on;
  h1 = plot(n, mu_Y, 'linewidth', 4, 'color', 'r');
  h2 = plot(n, mu_Y_exact, '--', 'color', 'k', 'linewidth', 3);
  title(['Realizaciones y media del proceso para p = ' num2str(p)]);
  xlabel('n');
  ylabel('Y(n)');
  legend([h1 h2], ['Media estimada'; 'Media teórica']);

  subplot(2, 1, 2);
  plot(n, var_Y);
  hold on;
  plot(n, var_Y_exact, '--');
  xlabel('n');
  ylabel('\sigma^2(n)');
  legend(['Varianza estimada'; 'Varianza teórica']);
  title('Varianza del proceso');
endfor

% Actividad 4

rand('seed', 42);

N = 400;
M = 20;

omega = 0.015*pi;

mu_A = 1;
var_A = 0.16;

A = normrnd(mu_A, sqrt(var_A), M, 1);

n = 0:N-1;

X = A * cos(omega * n);

mu_X = cos(omega * n);

mu_X_est = mean(X);

figure();
plot(n, X', 'color', 'b');
hold on;
h1 = plot(n, mu_X_est, 'linewidth', 4, 'color', 'r');
h2 = plot(n, mu_X, '--', 'color', 'k', 'linewidth', 3);
title('Realizaciones y media del proceso');
xlabel('n');
ylabel('X(n)');
legend([h1 h2], ['Media estimada'; 'Media teórica']);
grid on;

M = 200;

A = normrnd(mu_A, sqrt(var_A), M, 1);

n = 0:N-1;

X = A * cos(omega * n);

mu_X = cos(omega * n);
var_X = var_A * cos(omega * n).^2;

mu_X_est = mean(X);
var_X_est = var(X);

figure();
subplot(1, 2, 1);
plot(n, mu_X_est, 'linewidth', 2, 'color', 'r');
hold on;
plot(n, mu_X, '--', 'color', 'k', 'linewidth', 2);
title('Media del proceso');
xlabel('n');
ylabel('\mu_X(n)');
legend(['Media estimada'; 'Media teórica']);
grid on;

subplot(1, 2, 2);
plot(n, var_X_est, 'linewidth', 2, 'color', 'r');
hold on;
plot(n, var_X, '--', 'color', 'k', 'linewidth', 2);
title('Varianza del proceso');
xlabel('n');
ylabel('\sigma^2_X(n)');
legend(['Varianza estimada'; 'Varianza teórica']);
grid on;

% Actividad 5

N = 400;
M = 20;

omega = 0.015 * pi;

theta = unifrnd(0, 2*pi, M, 1);

n = 0:N-1;

A = 1;

X = A * cos(omega * n + theta);

mu_X = zeros(N, 1);

mu_X_est = mean(X);

figure();
plot(n, X', 'color', 'b');
hold on;
h1 = plot(n, mu_X_est, 'linewidth', 4, 'color', 'r');
h2 = plot(n, mu_X, '--', 'color', 'k', 'linewidth', 3);
title('Realizaciones y media del proceso');
xlabel('n');
ylabel('X(n)');
legend([h1 h2], ['Media estimada'; 'Media teórica']);
ylim([-1 1]);
grid on;

M = 2000;

theta = unifrnd(0, 2*pi, M, 1);

n = 0:N-1;

X = A * cos(omega * n + theta);

mu_X = zeros(N, 1);
var_X = ones(N, 1) * (A^2 / 2);

mu_X_est = mean(X);
var_X_est = var(X);

figure();
subplot(1, 2, 1);
plot(n, mu_X_est, 'linewidth', 2, 'color', 'r');
hold on;
plot(n, mu_X, '--', 'color', 'k', 'linewidth', 2);
title('Media del proceso');
xlabel('n');
ylabel('\mu_X(n)');
legend(['Media estimada'; 'Media teórica']);
ylim([-1 1]);
grid on;

subplot(1, 2, 2);
plot(n, var_X_est, 'linewidth', 2, 'color', 'r');
hold on;
plot(n, var_X, '--', 'color', 'k', 'linewidth', 2);
title('Varianza del proceso');
xlabel('n');
ylabel('\sigma^2_X(n)');
legend(['Varianza estimada'; 'Varianza teórica']);
ylim([0 1]);
grid on;
