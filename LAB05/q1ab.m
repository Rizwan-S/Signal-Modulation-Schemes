clear all; close all; clc;

Am = 2;         Ac = 2;     %Parameters
fm = 100;       fc = 2000;
fs = 50000;     df = 1;
t = [0:fs-1]*1/fs;          %Time vector

m_t = Am*cos(2*pi*fm*t);
c_t = Ac*cos(2*pi*fc*t);

%<====== 1(a) ======>
subplot(2, 1, 1);           %Plot the message signal
plot(t, m_t, 'LineWidth', 1.5);
xlabel('---> time(s)');    ylabel('---> m(t)');
title('1(a) Message Signal: A_mcos(2\pif_mt)');
xlim([0 0.04]);
ylim([-3 3]);
grid on;

%<====== 1(b) ======>
subplot(2, 1, 2);           %Plot the carrier signal
plot(t, c_t, 'LineWidth', 1.5);
xlabel('---> time(s)');    ylabel('---> c(t)');
title('1(b) Carrier Signal: A_ccos(2\pif_ct)');
xlim([0 0.04]);
ylim([-3 3]);
grid on;
