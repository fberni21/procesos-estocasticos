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
var_X = var(X);

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
