close all;
clear all;
clc;

# Actividad 4

N = 100;

X = normrnd(0, sqrt(2), 1, N);

Y = X(1);
for n = 1:N-1
  Y(n+1) = 0.5*X(n+1) + 0.75*X(n);
endfor

figure();
hold on;
grid on;
stem(0:N-1, X);
stem(0:N-1, Y);
legend(['X(n)'; 'Y(n)']);

R_teo = zeros(2*N-1);
R_teo(N) = 0.8125*2;
R_teo(N-1) = 0.375*2;
R_teo(N+1) = 0.375*2;

R = xcorr(Y, 'biased');

figure();
hold on;
grid on;
stem(-(N-1):(N-1), R);
plot(-(N-1):(N-1), R_teo);
xlim([-15 15]);
legend(['Estimación'; 'Teórica']);


