close all; clear; clc;

Ac = 1; A1 = 1; A2 = 1;
f1 = 100;   f2 = 200;
fc = 2000;
fs = 50000;                 %Sampling Frequency
df = 1;                     %frequency gap
t = [0:fs-1]*1/fs;          %Time vector

m1 = A1*cos(2*pi*f1*t);
m2 = A2*cos(2*pi*f2*t);
m_t = m1 + m2;
c_t = Ac*cos(2*pi*fc*t);

%<====== 2(c) ======>
fftM = fftshift(fft(m_t))/length(m_t);      %Calculate fft of the signals
fftC = fftshift(fft(c_t))/length(c_t);

f = [-fs/2:fs/2-1]*df;

subplot(2, 1, 1);                   %Plot the frequency spectrum
plot(f, abs(fftM));
xlabel('---> Frequency(Hz)');    ylabel('---> M(f)');
title('2(c) Frequency Spectrum of Message Signal');
xlim([-500 500]);
grid on;

subplot(2, 1, 2);                   %Plot the frequency spectrum
plot(f, abs(fftC));
xlabel('---> Frequency(Hz)');    ylabel('---> C(f)');
title('2(c) Frequency Spectrum of Carrier Signal');
xlim([-3000 3000]);
grid on;

