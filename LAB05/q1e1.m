clear all; close all; clc;

Am = 2;         Ac = 2;     %Parameters
fm = 100;       fc = 2000;
fs = 50000;     df = 1;
t = [0:fs-1]*1/fs;          %Time vector
f = [-fs/2:fs/2-1]*df;

m_t = Am*cos(2*pi*fm*t);
c_t = Ac*cos(2*pi*fc*t);
m_ht = imag(hilbert(m_t));

ssbl = m_t.*c_t + m_ht.*Ac.*sin(2*pi*fc*t);
ssbu = m_t.*c_t - m_ht.*Ac.*sin(2*pi*fc*t);

r1 = Ac*cos(2*pi*fc*t);

m1ssbl = r1.*ssbl;
m1ssbu = r1.*ssbu;

m1ssbl = lowpass(m1ssbl, 150, fs);          
m1ssbu = lowpass(m1ssbu, 150, fs);  


m1ssbl = m1ssbl/(Ac^2/2);
m1ssbu = m1ssbu/(Ac^2/2);

fftM1ssbl = fftshift(fft(m1ssbl))/length(m1ssbl);
fftM1ssbu = fftshift(fft(m1ssbu))/length(m1ssbu);

sgtitle('Plots for 1(e) for receiver signal phase 0^o');

subplot(2,2,1);
plot(t, m1ssbl, 'LineWidth', 1.7);
xlabel('---> time(s)');    ylabel('---> m(t)');
title('Demodulated signal: m(t) - LSB');
xlim([0 0.04]);        ylim([-3 3]);
yticks(-5:1:5);
grid on;

subplot(2,2,2);
plot(f, abs(fftM1ssbl), 'LineWidth', 1.7);
xlabel('---> Frequency(Hz)');    ylabel('---> |M(f)|');
title('Frequency spectrum of m(t) - LSB');
xlim([-200 200]); ylim([0 1.5]);
grid on;


subplot(2,2,3);
plot(t, m1ssbu, 'LineWidth', 1.7);
xlabel('---> time(s)');    ylabel('---> m(t)');
title('Demodulated signal: m(t) - USB');
xlim([0 0.04]);        ylim([-3 3]);
yticks(-5:1:5);
grid on;

subplot(2,2,4);
plot(f, abs(fftM1ssbu), 'LineWidth', 1.7);
xlabel('---> Frequency(Hz)');    ylabel('---> |M(f)|');
title('Frequency spectrum of m(t) - USB');
xlim([-200 200]); ylim([0 1.5]);
grid on;


