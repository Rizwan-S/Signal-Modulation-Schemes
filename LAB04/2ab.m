close all; clear; clc;

Ac = 1; A1 = 1; A2 = 1;
f1 = 250;   f2 = 350;
fc = 2500;  df = 1;
fs = 50000;                 %Sampling Frequency
t = [0:fs-1]*1/fs;          %Time vector

m1 = A1*cos(2*pi*f1*t);
m2 = A2*cos(2*pi*f2*t);
m_t = m1 + m2;
c_t = Ac*cos(2*pi*fc*t);

%<====== 2(a) ======>
subplot(3, 1, 1);           %Plot the signals
plot(t, m1);
xlabel('---> time(s)');    ylabel('---> Signal');
title('2(a) A_1cos(2\pif_1t) signal');
xlim([0 0.02]);
grid on;

%<====== 2(b) ======>
subplot(3, 1, 2);
plot(t, m2);
xlabel('---> time(s)');    ylabel('---> Signal');
title('2(b) A_2cos(2\pif_2t) signal');
xlim([0 0.02]);
grid on;

subplot(3, 1, 3);
plot(t, c_t);
xlabel('---> time(s)');    ylabel('---> Signal');
title('2(b) Carrier signal: A_ccos(2\pif_ct)');
xlim([0 0.02]);
grid on;

