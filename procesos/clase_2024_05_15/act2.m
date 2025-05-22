close all;
clear all;
clc;

# Actividad 2

N = 100;
n = 0:N-1;

X1 = sin(0.42*pi*n);

nfft = 1024;

transf = fftshift(fft(X1, nfft));

S = 1/N*(abs(transf).^2);

figure();
plot(linspace(-1,1,nfft), S);
xlim([0.3 0.5]);
title('PSD de X_1(k)');
xlabel('\omega / \pi');
ylabel('S_{X_1}(\omega)');
grid on;

N = 200;
n = 0:N-1;

X1 = sin(0.42*pi*n);
X2 = sin(0.43*pi*n);

X = X1 + X2;

nfft = 2048;

transf = fftshift(fft(X, nfft));

S = 1/N*(abs(transf).^2);

figure();
plot(linspace(-1,1,nfft), S);
xlim([0.3 0.5]);
title('PSD de X(k)');
xlabel('\omega / \pi');
ylabel('S_{X}(\omega)');
grid on;
