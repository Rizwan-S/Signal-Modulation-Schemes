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



fftM = fftshift(fft(m_t))/length(m_t);
fftC = fftshift(fft(c_t))/length(c_t);
fftSSBL = fftshift(fft(ssbl))/length(ssbl);
fftSSBU = fftshift(fft(ssbu))/length(ssbu);
f = [-fs/2:fs/2-1]*df;

sgtitle('Plots for 2(d)');

subplot(2,2,1);
plot(f, abs(fftM), 'LineWidth', 1.7);
xlabel('---> Frequency(Hz)');    ylabel('---> |M(f)|');
title('Frequency spectrum of m(t)');
xlim([-300 300]);   ylim([0 0.7]);
grid on;

subplot(2,2,2);
plot(f, abs(fftC), 'LineWidth', 1.7);
xlabel('---> Frequency(Hz)');    ylabel('---> |C(f)|');
title('Frequency spectrum of c(t)');
xlim([-2500 2500]); ylim([0 0.7]);
grid on;

subplot(2,2,3);
plot(f, abs(fftSSBL), 'LineWidth', 1.7);
xlabel('---> Frequency(Hz)');    ylabel('---> |\phi_{SSB}(f)|');
title('Frequency spectrum of \phi_{SSB}(t) - LSB');
xlim([-2500 2500]); ylim([0 0.7]);
grid on

subplot(2,2,4);
plot(f, abs(fftSSBU), 'LineWidth', 1.7);
xlabel('---> Frequency(Hz)');    ylabel('---> |\phi_{SSB}(f)|');
title('Frequency spectrum of \phi_{SSB}(t) - USB');
xlim([-2500 2500]); ylim([0 0.7]);
grid on
