close all; clear; clc;

Ac = 1; A1 = 1; A2 = 1;
f1 = 100;   f2 = 200;
fc = 2000;  df = 1;
fs = 50000;                 %Sampling Frequency
t = [0:fs-1]*1/fs;          %Time vector

m1 = A1*cos(2*pi*f1*t);
m2 = A2*cos(2*pi*f2*t);
m_t = m1 + m2;
c_t = Ac*cos(2*pi*fc*t);
m_ht = imag(hilbert(m_t));

ssbu = m_t.*c_t - Ac.*m_ht.*sin(2*pi*fc*t);
ssbl = m_t.*c_t + Ac.*m_ht.*sin(2*pi*fc*t);

subplot(2,1,1);
plot(t, ssbl, 'LineWidth', 1.5);
xlabel('---> time(s)');    ylabel('---> \phi(t) - LSB');
title('SSB-SC signal - LSB');
xlim([0 0.02]);
ylim([-3 3]);
yticks(-5:1:5);
grid on;

subplot(2,1,2);
plot(t, ssbu,  'LineWidth', 1.5);
xlabel('---> time(s)');    ylabel('---> \phi(t) - USB');
title('SSB-SC signal - USB');
xlim([0 0.02]);
ylim([-3 3]);
yticks(-5:1:5);
grid on;

sgtitle('Plots for 2(c)') 