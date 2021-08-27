clear all; close all; clc;

ka = 1;
fm = 100;       fc = 2000;
Am = 1;         Ac = 1;
fs = 50000;                 %Sampling Frequency
t = [0:fs-1]*1/fs;          %Time vector

m_t = Am*cos(2*pi*fm*t);    %Message Signal
c_t = Ac*cos(2*pi*fc*t);    %Carrier signal

%<====== 1(c) ======>
mu = [0.5 1 2];

for i=1:length(mu)
    Ac = 1/mu(i);
    s_t = Ac.*c_t.*(1 + mu(i).*m_t/Am);  %Generate the transmission signal
    subplot(length(mu), 1, i);           %Plot the signal
    plot(t, s_t);
    xlabel('---> time(s)');    ylabel('---> s(t)');
    xlim([0 0.02]);
    title(sprintf('1(c) Amplitude Modulated Signal for mu = %.1f', mu(i)));
    grid on;
end
