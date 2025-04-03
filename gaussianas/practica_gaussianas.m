pkg load statistics;

# Actividad 1

N = 5000;

Z = normrnd(0, 1, N, 2);

figure();
scatter(Z(:, 1), Z(:, 2), '.');
title('Scatterplot de Z_1, Z_2');

nbins = 20;

figure();
subplot(2, 1, 1);
[h, xc] = hist(Z(:, 1), nbins);
bar(xc, h / (sum(h) * (xc(2) - xc(1))));
title('Histogram Z_1');

subplot(2, 1, 2);
[h, xc] = hist(Z(:, 2), nbins);
bar(xc, h / (sum(h) * (xc(2) - xc(1))));
title('Histogram Z_2');

C_Y = [0.7 0.9; 0.9 1.75];
mu_Y = [0.8; 1.9];

[P D] = eig(C_Y);

A = P * sqrt(D);
disp(A);

% Trabajo con todos los vectores traspuestos, esto es A*Z + b si las VA estuvieran en filas.
Y = Z*A' + mu_Y';

figure();
scatter(Y(:, 1), Y(:, 2), '.');
title('Scatterplot de Y_1, Y_2');
axis square equal;

figure();
subplot(2, 1, 1);
[h, xc] = hist(Y(:, 1), nbins);
bar(xc, h / (sum(h) * (xc(2) - xc(1))));
title('Histogram Y_1');

subplot(2, 1, 2);
[h, xc] = hist(Y(:, 2), nbins);
bar(xc, h / (sum(h) * (xc(2) - xc(1))));
title('Histogram Y_2');

% Actividad 2

C_X = [0.7 0.9; 0.9 1.75];
mu_X = [0.8; 1.9];

X = mvnrnd(mu_X, C_X, N);

figure();
scatter(X(:, 1), X(:, 2), '.');
title('Scatterplot de X_1, X_2');
axis square equal;

figure();
subplot(2, 1, 1);
[h, xc] = hist(X(:, 1), nbins);
bar(xc, h / (sum(h) * (xc(2) - xc(1))));
title('Histogram X_1');

subplot(2, 1, 2);
[h, xc] = hist(X(:, 2), nbins);
bar(xc, h / (sum(h) * (xc(2) - xc(1))));
title('Histogram X_2');

[P D] = eig(C_X);

A = P';
b = -A*mu_X;

Y = X*A' + b';

figure();
scatter(Y(:, 1), Y(:, 2), '.');
title('Scatterplot de Y_1, Y_2');
axis square equal;

figure();
subplot(2, 1, 1, 'align');
[h, xc] = hist(Y(:, 1), nbins);
bar(xc, h / (sum(h) * (xc(2) - xc(1))));
title('Histogram Y_1');

subplot(2, 1, 2);
[h, xc] = hist(Y(:, 2), nbins);
bar(xc, h / (sum(h) * (xc(2) - xc(1))));
title('Histogram Y_2');

