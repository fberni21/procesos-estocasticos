close all;
clear all;
clc;

# Actividad 5

N = 1000;

V = normrnd(0, 1, 1, N);

X = V(1);
for n = 1:N-1
  X(n+1) = 0.6*X(n) + V(n+1);
endfor

R = xcorr(X, 'biased');

figure();
hold on;
grid on;
plot(-(N-1):(N-1), R);
xlim([-45 45]);

nfft = 4096;

w = linspace(-pi, pi, 2*N-1);
H = freqz([1], [-0.6 1], w);

figure();
plot(w, H);
plot(

