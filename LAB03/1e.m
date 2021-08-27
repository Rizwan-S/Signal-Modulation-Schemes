clear all; close all; clc;

ka = 1;                     %Parameters
fm = 100;       fc = 2000;
Am = 1;         Ac = 1;
fs = 50000;                 %Sampling Frequency
df = 1;                     %frequency gap
t = [0:fs-1]*1/fs;          %Time vector

m_t = Am*cos(2*pi*fm*t);    %Message Signal
c_t = Ac*cos(2*pi*fc*t);    %Carrier signal

%<====== 1(e) ======>
mu = [0.5 1 2];
plotNo = 1;
for i = 1:length(mu)
    Ac = 1/mu(i);
    s_t = Ac.*c_t.*(1 + mu(i).*m_t/Am);    %Transmission signal
    x_t = s_t.*Ac.*c_t;                    %Multiply with Ac*Cos(2*pi*fc*t)
    m1t = lowpass(x_t, 150, fs);           %Pass through low pass filter   
    m1t = m1t - (Ac*Ac)/2;                 %Subtract Ac^2/2 
    m1t = m1t/(mu(i)*Ac^2/2);              %Divide the signal by Ac^2/2*mu 
    subplot(3, 2, plotNo);
    plot(t, m1t);
    xlabel('---> time(s)');    ylabel('---> m(t)');
    title(sprintf('1(e) Demodulated Signal for mu = %.1f', mu(i)));
    xlim([0 0.02]);
    grid on;
    plotNo = plotNo + 1;
    
    fftS = fftshift(fft(m1t))/length(m1t); %Find fft of the signal
    f = [-fs/2:fs/2-1]*df;
    subplot(3, 2, plotNo);                 %Plot frequency spectrum
    plot(f, abs(fftS));
    xlim([-250 250]);
    xlabel('---> Frequency(Hz)');    ylabel('---> M(f)');
    title(sprintf('1(e) Frequency Spectrum of the Signal for mu = %.1f', mu(i)));
    grid on;
    text(115,0.35, 'Tone at 100 Hz');
    plotNo = plotNo + 1;
end