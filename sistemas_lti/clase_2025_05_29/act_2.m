close all;
clear all;
clc;

% Activdad 1

N = 1000;

X = normrnd(0, 1, 1, N);

a1 = [1 -0.5 -0.25];
a2 = [1 -0.5 0.2 -0.1];
a3 = [1 -0.3 0.5 -0.3];

Y1 = filter(1, a1, X);
Y2 = filter(1, a2, X);
Y3 = filter(1, a3, X);

n = 0:N-1;

R_X = xcorr(X, 'biased');
R_Y1 = xcorr(Y1, 'biased');
R_Y2 = xcorr(Y2, 'biased');
R_Y3 = xcorr(Y3, 'biased');

figure();
subplot(2, 2, 1);
plot(n, X);
xlim([0 100]);
grid;
subplot(2, 2, 2);
plot(n, Y1);
xlim([0 100]);
grid;
subplot(2, 2, 3);
plot(n, Y2);
xlim([0 100]);
grid;
subplot(2, 2, 4);
plot(n, Y3);
xlim([0 100]);
grid;

k=-(N-1):(N-1);

figure();
subplot(2, 2, 1);
stem(k, R_X);
xlim([-20 20]);
grid;
subplot(2, 2, 2);
stem(k, R_Y1);
xlim([-20 20]);
grid;
subplot(2, 2, 3);
stem(k, R_Y2);
xlim([-20 20]);
grid;
subplot(2, 2, 4);
stem(k, R_Y3);
xlim([-20 20]);
grid;

nfft = 10240;

% Puede usarse periodogram

S_X = 1/N * abs(fftshift(fft(X, nfft))).^2;
S_Y1 = 1/N * abs(fftshift(fft(Y1, nfft))).^2;
S_Y2 = 1/N * abs(fftshift(fft(Y2, nfft))).^2;
S_Y3 = 1/N * abs(fftshift(fft(Y3, nfft))).^2;

w = linspace(-pi, pi, nfft);

H1 = freqz(1, a1, w);
H1_magsq = abs(H1).^2;

H2 = freqz(1, a2, w);
H2_magsq = abs(H2).^2;

H3 = freqz(1, a3, w);
H3_magsq = abs(H3).^2;

S_Xteo = ones(1,nfft);
S_Y1teo = H1_magsq .* S_Xteo;
S_Y2teo = H2_magsq .* S_Xteo;
S_Y3teo = H3_magsq .* S_Xteo;

figure();
subplot(2, 2, 1);
plot(w/pi, S_X, w/pi, S_Xteo, '--', 'linewidth', 2);
xlabel('Frecuencia angular / \pi');
title('Periodograma de X');
grid;

subplot(2, 2, 2);
plot(w/pi, S_Y1, w/pi, S_Y1teo, '--', 'linewidth', 2);
xlabel('Frecuencia angular / \pi');
title('Periodograma de Y_1');
grid;

subplot(2, 2, 3);
plot(w/pi, S_Y2, w/pi, S_Y2teo, '--', 'linewidth', 2);
xlabel('Frecuencia angular / \pi');
title('Periodograma de Y_2');
grid;

subplot(2, 2, 4);
plot(w/pi, S_Y3, w/pi, S_Y3teo, '--', 'linewidth', 2);
xlabel('Frecuencia angular / \pi');
title('Periodograma de Y_3');
grid;
