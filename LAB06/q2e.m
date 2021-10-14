clear all; close all; clc;

Am = 1;         Ac = 2;     %Parameters
fm = 50;        fc = 250;
fs = 10000;      df = 1;
kp = 2;
t = [0:fs-1]*1/fs;          %Time vector

%<====== 2(e) ======>
phi_t = Ac*pmmod(Am*cos(2*pi*fm*t), fc, fs, kp*Am);
mt = pmdemod(phi_t, fc, fs, kp*Am);

plot(t, mt, 'LineWidth', 1.7);
xlabel('---> time(s)');    ylabel('---> m(t)');
title('2(e) Demodulated signal');
xlim([0 0.1]);  ylim([-2 2]);
grid on;