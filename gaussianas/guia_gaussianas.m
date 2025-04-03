pkg load symbolic;
pkg load statistics;

% Ejercicio 1
C_X = [2 1; 1 1];

mu_X = [1; -2];

syms x y real;

eqn = ([x y] - mu_X') * C_X^-1 * ([x; y] - mu_X);

N = 1000;

X = mvnrnd(mu_X, C_X, N);

hold on;
scatter(X(:,1), X(:,2), '.');
ezplot(eqn-1);
ezplot(eqn-2);
ezplot(eqn-4);
ezplot(eqn-8);

%Ejercicio 2

function ej2(rho)
  N = 100000;
  nbins = 30;

  mu = [0; 0];

  C = [1 rho; rho 1];

  X = mvnrnd(mu, C, N);

  Z = max(X, [], 2);

  [h, xc] = hist(Z, nbins);
  bar(xc, h / (sum(h) * (xc(2) - xc(1))));
  title('Max(X_1, X_2)');
end

figure();
hold on;
ej2(0);
ej2(0.1);
ej2(0.9);
legend(['\rho = 0'; '\rho = 0.1'; '\rho = 0.9']);
