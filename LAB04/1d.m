clear all; close all; clc;

Am = 2;         Ac = 2;
fm = 200;       fc = 2000;
fs = 50000;     df = 1;
t = [0:fs-1]*1/fs;          %Time vector

m_t = Am*cos(2*pi*fm*t);
c_t = Ac*cos(2*pi*fc*t);
dsbsc = c_t .* m_t;

%<====== 1(d) ======>
fftM = fftshift(fft(m_t))/length(m_t);      %Find ffts of the signals
fftC = fftshift(fft(c_t))/length(c_t);

f = [-fs/2:fs/2-1]*df;

subplot(2, 1, 1);                           %Plot frequency spectrum
plot(f, abs(fftM));
xlabel('---> Frequency(Hz)');    ylabel('---> M(f)');
title('1(d) Frequency Spectrum of Message Signal');
text(220, 0.8, 'Tone at 200 Hz');
xlim([-1000 1000]);
grid on;

subplot(2, 1, 2);                           %Plot frequency spectrum
plot(f, abs(fftC));
xlabel('---> Frequency(Hz)');    ylabel('---> C(f)');
title('1(d) Frequency Spectrum of Carrier Signal');
text(2100, 0.8, 'Tone at 2000 Hz');
xlim([-3000 3000]);
grid on;

