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

r2 = Ac*cos(2*pi*fc*t + pi/2);

m2ssbl = r2.*ssbl;
m2ssbu = r2.*ssbu;

m2ssbl = lowpass(m2ssbl, 250, fs);          
m2ssbu = lowpass(m2ssbu, 250, fs);   

m2ssbl = m2ssbl/(Ac^2/2);
m2ssbu = m2ssbu/(Ac^2/2);

m2ssbl = imag(hilbert(m2ssbl));
m2ssbu = -imag(hilbert(m2ssbu));

fftM2ssbl = fftshift(fft(m2ssbl))/length(m2ssbl);
fftM2ssbu = fftshift(fft(m2ssbu))/length(m2ssbu);

sgtitle('Plots for 2(e) for receiver signal phase 90^o');

subplot(2,2,1);
plot(t, m2ssbl, 'LineWidth', 1.7);
xlabel('---> time(s)');    ylabel('---> m(t)');
title('Demodulated signal: m(t) - LSB');
xlim([0 0.02]);        ylim([-2 2]);
yticks(-5:1:5);
grid on;


subplot(2,2,2);
plot(f, abs(fftM2ssbl), 'LineWidth', 1.7);
xlabel('---> Frequency(Hz)');    ylabel('---> |M(f)|');
title('Frequency spectrum of m(t) - LSB');
xlim([-400 400]); ylim([0 0.6]);
grid on;


subplot(2,2,3);
plot(t, m2ssbu, 'LineWidth', 1.7);
xlabel('---> time(s)');    ylabel('---> m(t)');
title('Demodulated signal: m(t) - USB');
xlim([0 0.02]);        ylim([-2 2]);
yticks(-5:1:5);
grid on;

subplot(2,2,4);
plot(f, abs(fftM2ssbu), 'LineWidth', 1.7);
xlabel('---> Frequency(Hz)');    ylabel('---> |M(f)|');
title('Frequency spectrum of m(t) - USB');
xlim([-400 400]); ylim([0 0.6]);
grid on;


