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

subplot(2, 1, 2);
plot(var_X);
hold on;
plot([0 N], [var_X_exact var_X_exact], '--');
xlabel('n');
legend(['Varianza estimada'; 'Varianza estimada'; 'Media teórica']);
title('Varianza del proceso');

