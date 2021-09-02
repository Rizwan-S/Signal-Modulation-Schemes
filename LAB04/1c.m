clear all; close all; clc;

Am = 2;        Ac = 2;
fm = 200;       fc = 2000;
fs = 50000;     df = 1;
t = [0:fs-1]*1/fs;          %Time vector

m_t = Am*cos(2*pi*fm*t);
c_t = Ac*cos(2*pi*fc*t);
dsbsc = c_t .* m_t;

%<====== 1(c) ======>
subplot(2, 1, 1);           %Plot the carrier signal
plot(t, dsbsc);
xlabel('---> time(s)');    ylabel('---> \phi(t)');
title('1(c) DSB-SC signal: A_c m(t) cos(2\pif_ct)');
xlim([0 0.025]);
grid on;

fftD = fftshift(fft(dsbsc))/length(dsbsc);      %Find ffts of the signals
f = [-fs/2:fs/2-1]*df;

subplot(2, 1, 2);                           %Plot frequency spectrum
plot(f, abs(fftD));
xlabel('---> Frequency(Hz)');    ylabel('---> \phi(f)');
title('1(c) Frequency Spectrum of DSB-SC signal');
xlim([-3000 3000]);
grid on;

