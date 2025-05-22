close all;
clear all;
clc;

pkg load statistics;

rand('seed', 69);

N = 1e4;
M = 100;

for p = [0.1 0.5 0.9]

  Z = rand(N, M-1) < p;

  U = 2 * Z - 1;

  X = [zeros(N, 1) cumsum(U, 2)];

  figure();
  stairs(X(1:10,:)');
  title('Realizaciones de X(n)');
  xlabel('n');
  ylabel('X(n)');

  n = 0:M-1;

  F_est = []

  for x = [-100:100]
    F_est = [F_est; mean(X <= x)];
  endfor

  figure();
  mesh(n, [-100:100], F_est);
  xlabel('n');
  ylabel('x');
  zlabel('F_{X(n)}(x)');
  title('Distribución de primer orden de X(n)');

  mu_est = mean(X);
  mu_teo = n * (2 * p - 1);

  figure();
  subplot(2, 1, 1);
  plot(mu_est, 'r-', 'linewidth', 3);
  hold on;
  plot(mu_teo, 'k--', 'linewidth', 3);
  title('Media de X(n)');
  legend(['Media estimada'; 'Media teórica']);
  xlabel('n');
  ylabel('\mu_X(n)');

  var_est = var(X);
  var_teo = 4 * n * p * (1 - p);

  subplot(2, 1, 2);
  plot(var_est, 'r-', 'linewidth', 3);
  hold on;
  plot(var_est, 'k--', 'linewidth', 3);
  title('Varianza de X(n)');
  legend(['Varianza estimada'; 'Varianza teórica']);
  xlabel('n');
  ylabel('\sigma^2_X(n)');
endfor
