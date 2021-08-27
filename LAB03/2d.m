close all; clear; clc;

Ac = 1; A1 = 1; A2 = 1;
f1 = 100;   f2 = 200;
fc = 2000;
fs = 50000;                 %Sampling Frequency
df = 1;                     %frequency gap
t = [0:fs-1]*1/fs;          %Time vector

m_t = A1*cos(2*pi*f1*t) + A2*cos(2*pi*f2*t);
c_t = Ac*cos(2*pi*fc*t);

%<====== 2(d) ======>
AM = c_t.*(1+m_t);

fftAM = fftshift(fft(AM))/length(AM);   %Find fft
f = [-fs/2:fs/2-1]*df;

plot(f, abs(fftAM));        %Plot the frequency spectrum
xlabel('---> Frequency(Hz)');    ylabel('---> S(f)');
title('2(d) Frequency spectrum of amplitude modulated signal');
xlim([-4000 4000]);
text(2100, 0.5, 'Tone of carrier signal at 2000 Hz');
text(2100, 0.35, 'Tone of message signal at 1800, 1900, 2100 and 2200 Hz');
grid on;
