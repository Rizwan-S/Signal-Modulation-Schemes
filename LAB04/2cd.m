close all; clear; clc;

Ac = 1; A1 = 1; A2 = 1;
f1 = 250;   f2 = 350;
fc = 2500;  df = 1;
fs = 50000;                 %Sampling Frequency
t = [0:fs-1]*1/fs;          %Time vector

m1 = A1*cos(2*pi*f1*t);
m2 = A2*cos(2*pi*f2*t);
m_t = m1 + m2;
c_t = Ac*cos(2*pi*fc*t);
dsbsc = c_t .* m_t;

%<====== 2(c) ======>
fftM = fftshift(fft(m_t))/length(m_t);      %Calculate fft of the signals
fftC = fftshift(fft(c_t))/length(c_t);
fftD = fftshift(fft(dsbsc))/length(dsbsc);

f = [-fs/2:fs/2-1]*df;

subplot(3, 1, 1);                   %Plot the frequency spectrum
plot(f, abs(fftM));
xlabel('---> Frequency(Hz)');    ylabel('---> M(f)');
title('2(c) Frequency Spectrum of Message Signal');
xlim([-600 600]);
grid on;

subplot(3, 1, 2);                   %Plot the frequency spectrum
plot(f, abs(fftC));
xlabel('---> Frequency(Hz)');    ylabel('---> C(f)');
title('2(c) Frequency Spectrum of Carrier Signal');
xlim([-4000 4000]);
grid on;

%<====== 2(d) ======>
subplot(3, 1, 3);                   %Plot the frequency spectrum
plot(f, abs(fftD));
xlabel('---> Frequency(Hz)');    ylabel('---> \phi(f)');
title('2(d) Frequency Spectrum of DSB-SC signal');
text(-2000, 0.1, 'Tone of message signal at 2150, 2250, 2750, 2850 Hz');
xlim([-4000 4000]);
grid on;
