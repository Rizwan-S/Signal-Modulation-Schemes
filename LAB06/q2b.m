clear all; close all; clc;

Am = 1;         Ac = 2;     %Parameters
fm = 50;        fc = 250;
fs = 10000;      df = 1;
kp = 0.25;
t = 0:1/fs:1;          %Time vector
mt = Am*cos(2*pi*fm*t);
phi_t = Ac*pmmod(mt, fc, fs, kp*Am);

%<====== 2(b) ======>
subplot(2, 1, 1);           %Plot the phase modulated signal signal
plot(t, phi_t, 'LineWidth', 1.5);
xlabel('---> time(s)');    ylabel('---> \phi_{PM}(t)');
title('2(b) Phase modulated signal \phi_{PM}(t)');
xlim([0 0.1]);
ylim([-3 3]);
grid on;

f = -fs/2:1:fs/2;
fftphi = fftshift(fft(phi_t))/length(phi_t);

subplot(2,1,2);             %Plot spectrum of phase modulated signal
plot(f, real(fftphi), 'LineWidth', 1.7);
xlabel('---> Frequency(Hz)');    ylabel('---> \phi_{PM}(f)');
title('2(b) Frequency spectrum of \phi_{PM}(t)');
xlim([-500 500]); ylim([-0.2 1.1]);
grid on