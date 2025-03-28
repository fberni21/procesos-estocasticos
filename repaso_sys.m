close all;
clear all;
clc;
pkg load control signal;

%%% Actividad 1

%% Parte 1

M = 10;

n = 0 : M-1;

x = sin(2*pi*0.2*n);

clf;
stem(n, x);
title('Gráfico de x[n] = sin(2 \pi 0.2 n)');
xlabel('n');
ylabel('x[n]');

%% Parte 2

X = fftshift(fft(x));

omega = linspace(-pi, pi-2*pi/M, M);

figure();
plot(omega/pi, abs(X), 'o-');
title('FFT de x[n]');
xlabel('\Omega / \pi');
ylabel('|X(j\Omega)|');

%% Parte 3

nfft = [20, 40, 80];

figure();

for i = 1:3
  subplot(3, 1, i);
  M = nfft(i);
  X = fftshift(fft(x, M));
  omega = linspace(-pi, pi-2*pi/M, M);
  plot(omega/pi, abs(X), 'o-');
  title(['fft of x with nfft = ' num2str(nfft(i))]);
  xlabel('\Omega / \pi');
  ylabel('|X(j\Omega)|');
end

%%% Actividad 2

h = [4.0, 3.5, 3.3, 3.2, 3.0, 2.5, 1.5, 0.5, 0.2]

%% Parte 1

figure();
stem(h);
title('Respuesta al impulso');
xlabel('n');
ylabel('x[n]');

nfft = 256;
H = fftshift(fft(h, nfft));

figure();
omega = linspace(-pi, pi-2*pi/nfft, nfft);
plot(omega/pi, abs(H), 'o-');
title('Módulo de la respuesta al impulso');
xlabel('\Omega / \pi');
ylabel('|H(j\Omega)|');

%% Parte 2

figure();
zplane(h, 1);
title('Diagrama de polos y ceros');

%% Parte 3

M = 100;
n = 0:M-1;
x = square(2*pi*0.02*n);

y = conv(h, x);

figure();
stem(y);
title('Salida del sistema x[n] = square(2 \pi 0.02 n) usando conv()');
xlabel('n');
ylabel('y[n]');

nfft = length(y);
Y = fftshift(fft(y, nfft));
figure();
omega = linspace(-pi, pi-2*pi/nfft, nfft);
plot(omega/pi, abs(Y), 'o-');
title('FFT de la salida');
xlabel('\Omega / \pi');
ylabel('|Y(j\Omega)|');

y = filter(h, 1, x);

figure();
stem(y);
title('Salida del sistema x[n] = square(2 \pi 0.02 n) usando filter()');
xlabel('n');
ylabel('y[n]');

nfft = length(y);
Y = fftshift(fft(y, nfft));
figure();
omega = linspace(-pi, pi-2*pi/nfft, nfft);
plot(omega/pi, abs(Y), 'o-');
title('FFT de la salida');
xlabel('\Omega / \pi');
ylabel('|Y(j\Omega)|');

%%% Actividad 3

%% Parte 1

b = [3 1.5 2];
a = [1 -0.6];
n = 128;

[H, w] = freqz(b, a, n);

figure();
plot(w/pi, abs(H));
title('Respuesta en frecuencia');
xlabel('\omega / \pi');
ylabel('|H(j\omega)|');

%% Parte 2

figure();
zplane(b, a);
title('Diagrama de polos y ceros');

%% Parte 3

M = 100;
n = 0:M-1;
x = square(2*pi*0.02*n);

y = filter(b, a, x);
figure();
stem(y);
title('Salida del sistema x[n] = square(2 \pi 0.02 n) usando filter()');
xlabel('n');
ylabel('y[n]');

%% Parte 4

b = [3 1.5 2];
a = [1 -1.2];

[H, w] = freqz(b, a, n);

figure();
plot(w/pi, abs(H));
title('Respuesta en frecuencia');
xlabel('\omega / \pi');
ylabel('|H(j\omega)|');

figure();
zplane(b, a);
title('Diagrama de polos y ceros');

M = 100;
n = 0:M-1;
x = square(2*pi*0.02*n);

y = filter(b, a, x);
figure();
stem(y);
title('Salida del sistema x[n] = square(2 \pi 0.02 n) usando filter()');
xlabel('n');
ylabel('y[n]');
