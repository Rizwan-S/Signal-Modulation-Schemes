clear all; close all; clc;

Am = 2;         Ac = 2;     %Parameters
fm = 100;       fc = 2000;
fs = 50000;     df = 1;
t = [0:fs-1]*1/fs;          %Time vector

m_t = Am*cos(2*pi*fm*t);
c_t = Ac*cos(2*pi*fc*t);
m_ht = imag(hilbert(m_t));

ssbl = m_t.*c_t + m_ht.*Ac.*sin(2*pi*fc*t);
ssbu = m_t.*c_t - m_ht.*Ac.*sin(2*pi*fc*t);

%<====== 1(c) ======>
subplot(2,1,1);
plot(t, ssbl, 'LineWidth', 1.5);
xlabel('---> time(s)');    ylabel('---> \phi(t) - LSB');
title('SSB-SC signal - LSB');
xlim([0 0.04]);
ylim([-5 5]);
yticks(-5:1:5);
grid on;

subplot(2,1,2);
plot(t, ssbu,  'LineWidth', 1.5);
xlabel('---> time(s)');    ylabel('---> \phi(t) - USB');
title('SSB-SC signal - USB');
xlim([0 0.04]);
ylim([-5 5]);
yticks(-5:1:5);
grid on;

sgtitle('Plots for 1(c)') 