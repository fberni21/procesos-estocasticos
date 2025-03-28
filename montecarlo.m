pkg load statistics;

% Actividad 1

N = 1000;

%% Cada fila es una realización de un VecA de dos componentes (en columnas).
X = [raylrnd(3, N, 1) raylrnd(2, N, 1)];

B = [0.6 -0.2; 0.4 0.7];
H = [0.6 -0.2; 0.4 0.2];

%% Transformación V = B * X si cada fila fuera una VA,
%% pero a Octave le gusta trabajar con las VA en columnas (traspuesto).
%% Propiedad (B * X)' = X' * B'. Pero en nuestro caso X ya está traspuesta
%% por construcción, así que es V = X * B'.
V = X * B';

U = X * H';

X1 = X(:, 1);
X2 = X(:, 2);

%% Implementación de 'cov' a mano
%% X debe tener VAs en sus columnas, y realizaciones de cada VA en sus filas
function retval = autocov(X)
  mu = mean(X);
  [n d] = size(X);
  retval = 1/(n-1) * ((X - mu)'*(X - mu));
end

figure();
scatter(X1, X2);
title("Scatterplot de X_1 y X_2");
axis([-2 12 0 14]);
rho = corrcoef(X)(2, 1);
text(0, 12, ['\rho = ' num2str(rho)]);

V1 = V(:, 1);
V2 = V(:, 2);

figure();
scatter(V1, V2);
title("Scatterplot de V_1 y V_2");
axis([-2 12 0 14]);
rho = corrcoef(V)(2, 1);
text(0, 12, ['\rho = ' num2str(rho)]);

U1 = U(:, 1);
U2 = U(:, 2);

figure();
scatter(U1, U2);
title("Scatterplot de U_1 y U_2");
axis([-2 12 0 14]);
rho = corrcoef(U)(2, 1);
text(0, 12, ['\rho = ' num2str(rho)]);

% Actividad 2

display('Autocovarianza de X');
display(autocov(X));

display('Autocovarianza de V');
display(autocov(V));

display('Autocovarianza de U');
display(autocov(U));

% Actividad 3

N = 1000;

thetas = [0 pi/10 pi/4];

X = [unifrnd(0, 2, N, 1) unifrnd(0, 3, N, 1)];
X1 = X(:, 1);
X2 = X(:, 2);

figure();
scatter(X1, X2);
title('Scatterplot de X1, X2');
axis([-2 3 -1 4]);
axis square;

for theta = thetas
  R = [cos(theta) -sin(theta); sin(theta) cos(theta)];

  Y = X * R';
  Y1 = Y(:, 1);
  Y2 = Y(:, 2);

  figure();
  scatter(Y1, Y2);
  title(['Scatterplot de Y1, Y2 for \theta = ' num2str(theta)]);
  axis([-2 3 -1 4]);
  axis square;

  rho = corrcoef(Y)(1, 2);

  disp(['Autocovarianza para ' num2str(theta)]);
  disp(autocov(Y));

  text(2.5, 2, ['\rho = ' num2str(rho)]);
end

% Actividad 4

I_exp = (sqrt(pi)/2*erf(1))^10;

N = 100000;

X = unifrnd(0, 1, N, 10);

I_est = 1/N * sum(exp(- sum(X.^2, 2)));

display(['Expected = ' num2str(I_exp)]);
display(['Estimated = ' num2str(I_est)]);

% Actividad 5

%% Parte 1

N = 10000;

U = unifrnd(0, 1, N, 1);
X = 2 * U - 1;

%% Importante acá hacer `./` para dividir elemento a elemento,
%% la división normal `/` calcula la pseudo-inversa!
pi_est = 2/N * sum(1 ./ sqrt(1 - (X.^2)));

display(pi_est);

%% Parte 2

N = 1000;

U = unifrnd(0, 1, N, 1);

result = [];

for i = 1:N
  X = 2 * U(1:i) - 1;
  I_n = 2/i * sum(1 ./ sqrt(1 - (X.^2)));
  result = [result, I_n/pi];
end

figure();
plot(1:N, result);
title('I_n / \pi');
