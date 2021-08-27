clear all; close all; clc;

ka = 1;                     %Parameters
fm = 100;       fc = 2000;
Am = 1;         Ac = 1;
fs = 50000;                 %Sampling Frequency
t = [0:fs-1]*1/fs;          %Time vector

m_t = Am*cos(2*pi*fm*t);    %Message Signal
c_t = Ac*cos(2*pi*fc*t);    %Carrier signal

%<====== 1(a) ======>
subplot(2, 1, 1);           %Plot the message signal
plot(t, m_t);
xlabel('---> time(s)');    ylabel('---> m(t)');
title('1(a) Message Signal: A_mcos(2\pif_mt)');
xlim([0 0.02]);
grid on;

%<====== 1(b) ======>
subplot(2, 1, 2);           %Plot the carrier signal
plot(t, c_t);
xlabel('---> time(s)');    ylabel('---> c(t)');
title('1(b) Carrier Signal: A_ccos(2\pif_ct)');
xlim([0 0.02]);
grid on;
