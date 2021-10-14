clear all; close all; clc;

Am = 1;         Ac = 2;     %Parameters
fm = 50;        fc = 250;
fs = 10000;      df = 1;
kf = 100;
t = [0:fs-1]*1/fs;          %Time vector

phi_t = 2*fmmod(Am*cos(2*pi*fm*t), fc, fs, kf*Am);

%<====== 1(e) ======>
mt = fmdemod(phi_t, fc, fs, kf*Am)

plot(t, mt, 'LineWidth', 1.7);
xlabel('---> time(s)');    ylabel('---> m(t)');
title('1(e) Demodulated signal');
xlim([0 0.1]);  ylim([-2 2]);
grid on;