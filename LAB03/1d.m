clear all; close all; clc;

ka = 1;                     %Parameters
fm = 100;       fc = 2000;
Am = 1;         Ac = 1;
fs = 50000;                 %Sampling Frequency
df = 1;                     %frequency gap
t = [0:fs-1]*1/fs;          %Time vector

m_t = Am*cos(2*pi*fm*t);    %Message Signal
c_t = Ac*cos(2*pi*fc*t);    %Carrier signal

%<====== 1(d) ======>
fftM = fftshift(fft(m_t))/length(m_t);      %Find ffts of the signals
fftC = fftshift(fft(c_t))/length(c_t);

f = [-fs/2:fs/2-1]*df;

subplot(2, 1, 1);                           %Plot frequency spectrum
plot(f, abs(fftM));
xlabel('---> Frequency(Hz)');    ylabel('---> M(f)');
title('1(d) Frequency Spectrum of Message Signal');
text(130, 0.3, 'Tone at 100 Hz');
xlim([-500 500]);
grid on;

subplot(2, 1, 2);                           %Plot frequency spectrum
plot(f, abs(fftC));
xlabel('---> Frequency(Hz)');    ylabel('---> C(f)');
title('1(d) Frequency Spectrum of Carrier Signal');
text(2100, 0.3, 'Tone at 2000 Hz');
xlim([-3000 3000]);
grid on;

