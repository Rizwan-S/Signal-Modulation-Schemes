clear all; close all; clc;

Am = 1;         Ac = 2;     %Parameters
fm = 50;        fc = 250;
fs = 10000;      df = 1;
kf = 100;
t = [0:fs-1]*1/fs;          %Time vector

%<====== 1(c) ======>
mt = Am*cos(2*pi*fm*t);
phi_t = 2*fmmod(mt, fc, fs, kf*Am);

subplot(2, 1, 1);           %Plot the frequency modulated signal
plot(t, phi_t, 'LineWidth', 1.5);
xlabel('---> time(s)');    ylabel('---> \phi_{FM}(t)');
title('1(c) Frequency modulated signal \phi_{FM}(t)');
xlim([0 0.1]);
ylim([-3 3]);
grid on;

f = [-fs/2:fs/2-1]*df;
fftphi = fftshift(fft(phi_t))/length(phi_t);

subplot(2,1,2);
plot(f, real(fftphi), 'LineWidth', 1.7);
xlabel('---> Frequency(Hz)');    ylabel('---> \phi_{FM}(f)');
title('1(c) Frequency spectrum of \phi_{FM}(t)');
xlim([-600 600]); ylim([-0.7 0.7]);
xticks(-800:100:800);
grid on