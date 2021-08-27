close all; clear; clc;

Ac = 1; A1 = 1; A2 = 1;
f1 = 100;   f2 = 200;
fc = 2000;
fs = 50000;                 %Sampling Frequency
df = 1;                     %frequency gap
t = [0:fs-1]*1/fs;          %Time vector

m_t = A1*cos(2*pi*f1*t) + A2*cos(2*pi*f2*t);
c_t = Ac*cos(2*pi*fc*t);

%<====== 2(e) ======>
s_t = c_t.*(1 + m_t);                  %Transmission signal
x_t = s_t.*Ac.*c_t;                    %Multiply with Ac*Cos(2*pi*fc*t)
m1t = lowpass(x_t, 200, fs);           %Pass through low pass filter   
m1t = m1t - (Ac*Ac)/2;                 %Subtract Ac^2/2 
m1t = m1t/(Ac^2/2);                    %Divide the signal by Ac^2/2
subplot(2, 1, 1);
plot(t, m1t);
xlabel('---> time(s)');    ylabel('---> m(t)');
title('2(e) Demodulated Signal');
xlim([0 0.02]);
grid on;

fftS = fftshift(fft(m1t))/length(m1t); %Find fft of the signal
f = [-fs/2:fs/2-1]*df;
subplot(2, 1, 2);                      %Plot frequency spectrum
plot(f, abs(fftS));
xlim([-250 250]);
xlabel('---> Frequency(Hz)');    ylabel('---> M(f)');
title('2(e) Frequency Spectrum of the Demodulated Signal');
grid on;
text(110, 0.17, 'Tone at 100 Hz');
text(202, 0.17, 'Tone at 200 Hz');

