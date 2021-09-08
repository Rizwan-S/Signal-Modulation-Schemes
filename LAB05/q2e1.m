close all; clear; clc;

Ac = 1; A1 = 1; A2 = 1;
f1 = 100;   f2 = 200;
fc = 2000;  df = 1;
fs = 50000;                 %Sampling Frequency
t = [0:fs-1]*1/fs;          %Time vector
f = [-fs/2:fs/2-1]*df;

m1 = A1*cos(2*pi*f1*t);
m2 = A2*cos(2*pi*f2*t);
m_t = m1 + m2;
c_t = Ac*cos(2*pi*fc*t);
m_ht = imag(hilbert(m_t));

ssbu = m_t.*c_t - Ac.*m_ht.*sin(2*pi*fc*t);
ssbl = m_t.*c_t + Ac.*m_ht.*sin(2*pi*fc*t);

r1 = Ac*cos(2*pi*fc*t);

m1ssbl = r1.*ssbl;
m1ssbu = r1.*ssbu;

m1ssbl = lowpass(m1ssbl, 150, fs);          
m1ssbu = lowpass(m1ssbu, 150, fs); 

m1ssbl = m1ssbl/(Ac^2/2);
m1ssbu = m1ssbu/(Ac^2/2);

fftM1ssbl = fftshift(fft(m1ssbl))/length(m1ssbl);
fftM1ssbu = fftshift(fft(m1ssbu))/length(m1ssbu);

sgtitle('Plots for 2(e) for receiver signal phase 0^o');

subplot(2,2,1);
plot(t, m1ssbl, 'LineWidth', 1.7);
xlabel('---> time(s)');    ylabel('---> m(t)');
title('Demodulated signal: m(t) - LSB');
xlim([0 0.02]);        ylim([-2 2]);
yticks(-5:1:5);
grid on;


subplot(2,2,2);
plot(f, abs(fftM1ssbl), 'LineWidth', 1.7);
xlabel('---> Frequency(Hz)');    ylabel('---> |M(f)|');
title('Frequency spectrum of m(t) - LSB');
xlim([-400 400]); ylim([0 0.6]);
grid on;


subplot(2,2,3);
plot(t, m1ssbu, 'LineWidth', 1.7);
xlabel('---> time(s)');    ylabel('---> m(t)');
title('Demodulated signal: m(t) - USB');
xlim([0 0.02]);        ylim([-2 2]);
yticks(-5:1:5);
grid on;

subplot(2,2,4);
plot(f, abs(fftM1ssbu), 'LineWidth', 1.7);
xlabel('---> Frequency(Hz)');    ylabel('---> |M(f)|');
title('Frequency spectrum of m(t) - USB');
xlim([-400 400]); ylim([0 0.6]);
grid on;


