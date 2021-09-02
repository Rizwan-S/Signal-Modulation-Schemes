clear all; close all; clc;

Am = 2;         Ac = 2;
fm = 200;       fc = 2000;
fs = 50000;     df = 1;
t = [0:fs-1]*1/fs;          %Time vector

m_t = Am*cos(2*pi*fm*t);
c_t = Ac*cos(2*pi*fc*t);
dsbsc = c_t .* m_t;

%<====== 1(e) ======>
x_t = dsbsc.*Ac.*c_t;                   %Multiply with Ac*Cos(2*pi*fc*t)
m1t = lowpass(x_t, 220, fs);            %Pass through low pass filter   
m1t = m1t/(Ac^2);                       %Divide the signal by Ac^2
subplot(2, 1, 1);
plot(t, m1t);
xlabel('---> time(s)');    ylabel('---> m(t)');
title('1(e) Demodulated Signal');
xlim([0 0.025]);
grid on;

fftS = fftshift(fft(m1t))/length(m1t); %Find fft of the signal
f = [-fs/2:fs/2-1]*df;
subplot(2, 1, 2);                 %Plot frequency spectrum
plot(f, abs(fftS));
xlim([-400 400]);
xlabel('---> Frequency(Hz)');    ylabel('---> M(f)');
title('1(e) Frequency Spectrum of the demodulated signal');
grid on;

