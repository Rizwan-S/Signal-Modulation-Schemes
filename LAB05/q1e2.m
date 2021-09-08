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

r2 = Ac*cos(2*pi*fc*t + pi/2);

m2ssbl = r2.*ssbl;
m2ssbu = r2.*ssbu;
    
m2ssbl = lowpass(m2ssbl, 150, fs); 
m2ssbu = lowpass(m2ssbu, 150, fs); 

m2ssbl = m2ssbl/(Ac^2/2);
m2ssbu = m2ssbu/(Ac^2/2);

m2ssbl = imag(hilbert(m2ssbl));
m2ssbu = -imag(hilbert(m2ssbu));

fftM2ssbl = fftshift(fft(m2ssbl))/length(m2ssbl);
fftM2ssbu = fftshift(fft(m2ssbu))/length(m2ssbu);

sgtitle('Plots for 1(e) for receiver signal phase 90^o');

subplot(2,2,1);
plot(t, m2ssbl, 'LineWidth', 1.7);
xlabel('---> time(s)');    ylabel('---> m(t)');
title('Demodulated signal: m(t) - LSB');
xlim([0 0.04]);        ylim([-3 3]);
yticks(-5:1:5);
grid on;

subplot(2,2,2);
plot(f, abs(fftM2ssbl), 'LineWidth', 1.7);
xlabel('---> Frequency(Hz)');    ylabel('---> |M(f)|');
title('Frequency spectrum of m(t) - LSB');
xlim([-200 200]); ylim([0 1.5]);
grid on;


subplot(2,2,3);
plot(t, m2ssbu, 'LineWidth', 1.7);
xlabel('---> time(s)');    ylabel('---> m(t)');
title('Demodulated signal: m(t) - USB');
xlim([0 0.04]);        ylim([-3 3]);
yticks(-5:1:5);
grid on;

subplot(2,2,4);
plot(f, abs(fftM2ssbu), 'LineWidth', 1.7);
xlabel('---> Frequency(Hz)');    ylabel('---> |M(f)|');
title('Frequency spectrum of m(t) - USB');
xlim([-200 200]); ylim([0 1.5]);
grid on;


