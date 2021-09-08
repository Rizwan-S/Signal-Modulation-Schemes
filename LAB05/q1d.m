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

f = [-fs/2:fs/2-1]*df;

fftM = fftshift(fft(m_t))/length(m_t);
fftC = fftshift(fft(c_t))/length(c_t);
fftSSBL = fftshift(fft(ssbl))/length(ssbl);
fftSSBU = fftshift(fft(ssbu))/length(ssbu);

%<=====1(d)=====>
subplot(2,2,1);
plot(f, abs(fftM), 'LineWidth', 1.7);
xlabel('---> Frequency(Hz)');    ylabel('---> |M(f)|');
title('Frequency spectrum of m(t)');
xlim([-200 200]);   ylim([0 1.2]);
grid on;

subplot(2,2,2);
plot(f, abs(fftC), 'LineWidth', 1.7);
xlabel('---> Frequency(Hz)');    ylabel('---> |C(f)|');
title('Frequency spectrum of c(t)');
xlim([-2500 2500]); ylim([0 1.2]);
grid on;

subplot(2,2,3);
plot(f, abs(fftSSBL), 'LineWidth', 1.7);
xlabel('---> Frequency(Hz)');    ylabel('---> |\phi_{SSB}(f)|');
title('Frequency spectrum of \phi_{SSB}(t) - LSB');
xlim([-2500 2500]); ylim([0 2.5]);
grid on

subplot(2,2,4);
plot(f, abs(fftSSBU), 'LineWidth', 1.7);
xlabel('---> Frequency(Hz)');    ylabel('---> |\phi_{SSB}(f)|');
title('Frequency spectrum of \phi_{SSB}(t) - USB');
xlim([-2500 2500]); ylim([0 2.5]);
grid on

sgtitle('Plots for 1(d)');


