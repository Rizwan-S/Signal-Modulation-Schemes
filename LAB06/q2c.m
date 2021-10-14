clear all; close all; clc;

Am = 1;         Ac = 2;     %Parameters
fm = 50;        fc = 250;
fs = 10000;      df = 1;
kp = 2;
t = 0:1/fs:1          %Time vector

%<====== 2(c) ======>
phi_t = Ac*pmmod(Am*cos(2*pi*fm*t), fc, fs, kp*Am);

subplot(2, 1, 1);           %Plot the phase modulated signal
plot(t, phi_t, 'LineWidth', 1.5);
xlabel('---> time(s)');    ylabel('---> \phi_{PM}(t)');
title('2(c) Phase modulated signal \phi_{PM}(t)');
xlim([0 0.1]);
ylim([-3 3]);
grid on;

f = -fs/2:1:fs/2
fftphi = fftshift(fft(phi_t))/length(phi_t);

subplot(2,1,2);             %Plot frequency spectrum of phase modulated signal
plot(f, real(fftphi), 'LineWidth', 1.7);
xlabel('---> Frequency(Hz)');    ylabel('---> \phi_{PM}(f)');
title('2(c) Frequency spectrum of \phi_{PM}(t)');
xlim([-500 500]); ylim([-0.4 0.4]);
xticks(-800:50:800);       yticks(-0.5:0.1:0.5);
grid on