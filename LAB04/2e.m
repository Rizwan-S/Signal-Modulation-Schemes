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


%<====== 2(e) ======>
x_t = dsbsc.*Ac.*c_t;                   %Multiply with Ac*Cos(2*pi*fc*t)
m1t = lowpass(x_t, 400, fs);            %Pass through low pass filter   
m1t = m1t/(Ac^2);                       %Divide the signal by Ac^2
subplot(2, 1, 1);
plot(t, m1t);
xlabel('---> time(s)');    ylabel('---> m(t)');
title('2(e) Demodulated Signal');
xlim([0 0.025]);
grid on;

fftS = fftshift(fft(m1t))/length(m1t); %Find fft of the signal
f = [-fs/2:fs/2-1]*df;
subplot(2, 1, 2);                 %Plot frequency spectrum
plot(f, abs(fftS));
xlim([-500 500]);
xlabel('---> Frequency(Hz)');    ylabel('---> M(f)');
title('2(e) Frequency Spectrum of the demodulated signal');
grid on;

