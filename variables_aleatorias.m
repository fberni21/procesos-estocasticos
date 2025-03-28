pkg load statistics;

# Actividad 1

b = 0.5;

function plot_histogram(x, bins)
  [h, xc] = hist(x, bins);
  bar(xc, h / (sum(h) * (xc(2) - xc(1))));
end

N = [100, 100, 10000];
bins = [10, 30, 30];

for i = 1:3
  figure();
  x = raylrnd(b, N(i));
  plot_histogram(x, bins(i));
  title(['N = ' num2str(N(i)) '; bins = ' num2str(bins(i))]);
end

# Actividad 2

lambda = 0.5;
N = 10000;

u = unifrnd(0, 1, 1, N);

x = -1 / lambda * log(1 - u);

mu_est = mean(x);
var_est = var(x);

display(['mu_est = ', num2str(mu_est), '; mu = ', num2str(1/lambda)]);
display(['var_est = ', num2str(var_est), '; var = ', num2str(1/lambda^2)]);

bins = 30;

figure();
hold on;
[h, xc] = hist(x, bins);
bar(xc, h / (sum(h) * (xc(2) - xc(1))));

t = linspace(xc(1), xc(bins), 100);
plot(t, lambda*exp(-lambda*t), 'linewidth', 4);

title(['Histograma y pdf de X ~ Exp(\lambda = ' num2str(lambda) ')']);
legend(['Histograma de X'; 'pdf de X']);

# Actividad 3

N = 200;

u1 = unifrnd(0, 2, 1, N);
u2 = unifrnd(0, 3, 1, N);

u = [u1; u2];

x = [0.5*u1 - 0.3*u2; 0.7*u1 + 0.2*u2];
x1 = x(1, :);
x2 = x(2, :);

y = [1.2*u1 - 0.1*u2; 1.0*u1 + 0.1*u2];
y1 = y(1, :);
y2 = y(2, :);

function plot_ej3(x1, x2, name)
  figure();
  scatter(x1, x2);
  title(['Scatter de ' name]);
  axis([-1 3 -1 3]);
  rho = corrcoef(x1, x2)(1, 2);
  text(1, -0.5, ['\rho = ' num2str(rho)]);
end

plot_ej3(u1, u2, 'u1, u2');
plot_ej3(x1, x2, 'x1, x2');
plot_ej3(y1, y2, 'y1, y2');
