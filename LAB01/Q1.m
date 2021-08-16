clear all;
close all;
clc;

t = 0:1/2000:0.1;           %Time vector
x = sin(2*pi*50*t);         %signal vector

%<------1(a)------>
subplot(3,2,1);
plot(t,x);              %Plot analog continuous signal
xlabel('---> time(s)');   ylabel('---> x(t)');
title('(a) Analog Continuous Signal');
grid on;

%<------1(b)------>
subplot(3,2,2);
stem(t,x);              %Plot analog discrete time signal
xlabel('---> time(s)');   ylabel('---> x(t)');
title('(b) Analog Discrete-Time Signal');
grid on;

%<------1(c1)------>
%<---Quantize the signal--->
xq = x;                 %xq contains quantized values of the signal
for i = 1:length(t)
    if x(i) >= 0
        xq(i) = 1;
    else
        xq(i) = -1;
    end
end

subplot(3,2,3);
stem(t,xq);             %Plot quantized digital discrete-time Signal
xlabel('---> time(s)');   ylabel('---> x(t)');
title('(c1) Quantized Digital Discrete-Time Signal');
grid on;

%<------1(c2)------>
subplot(3,2,4);
plot(t,xq);             %Plot quantized digital continuous signal
xlabel('---> time(s)');   ylabel('---> x(t)');
title('(c2) Quantized Digital Continuous Signal');
grid on;

%<------1(d)------>
N = 10000;              %Number of samples
ts = 0.0002;            %time 
df = 1/(N*ts);          %frequency gap
t = [0:N-1]*ts;         %Time vector
x = sin(2*pi*50*t);
Xf_shift = fftshift(fft(x))/length(x);  %perform zero-centered circular shift on fourier transform and normalize it      
Ff_shift = [-N/2:N/2-1]*df;      

subplot(3,2,5);
plot(Ff_shift, abs(Xf_shift));          %Plot amplitude spectrum
xlim([-100 100]);               yticks(0:0.1:1);
xlabel('---> Frequency(Hz)');   ylabel('---> Ampitude');
title('(d) Amplitude Spectrum');
grid on;

%<------1(e)------>
subplot(3,2,6);
plot(Ff_shift, angle(Xf_shift)*180/pi);  %Plot phase spectrum
xlim([-100 100]);               yticks(-360:90:360);
xlabel('---> Frequency(Hz)');   ylabel('---> Phase(degrees)');
title('(e) Phase Spectrum');
grid on;
