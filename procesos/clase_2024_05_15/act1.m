close all;
clear all;
clc;

# Actividad 1

N = 1000;

V = normrnd(0, 2, 1, N);

R = xcorr(V, 'biased');

figure();
plot(-(N-1):(N-1), R);
title('Autocorrelación de V(n)');
xlabel('n');
ylabel('R_V(n)');
grid on;

nfft = 20480;

transf = fftshift(fft(V, nfft));
S = 1/N*(abs(transf).^2);

figure();
hold on;
plot(linspace(-pi,pi,nfft), S);
plot([-pi pi], [4 4]);
title('PSD de V(k)');
xlabel('\omega');
ylabel('S_V(\omega)');
xlim([-pi pi]);
grid on;

N = 10000;

V = normrnd(0, 2, 1, N);

nfft = 20480;

transf = fftshift(fft(V, nfft));
S = 1/N*(abs(transf).^2);

figure();
hold on;
plot(linspace(-pi,pi,nfft), S);
plot([-pi pi], [4 4]);
title('PSD de V(k)');
xlabel('\omega');
ylabel('S_V(\omega)');
xlim([-pi pi]);
grid on;
