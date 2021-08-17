fs = 10000;                     %Sampling frequency
t = -1:1/fs:1;                  %Time vector
x = 1*(t >= -0.5 & t <= 0.5);   %Signal vector

%<------3(a)------>
subplot(2,2,1:2);
plot(t,x);                  %Plot rectangular pulse
xlabel('---> time(s)');   ylabel('---> x(t)');
title('(a) Rectangular Pulse');
grid on;

%<------3(b)------>
syms t f
X(f) = int(1*exp(-1i*2*pi*f*t), t, -0.5, 0.5);  %Find Fourier transform

display(X);
subplot(2,2,3);
fplot(X, [-1 1]*4*pi);       %Plot frequency spectrum
xticks(-16:2:16);
xlabel('---> Frequency(Hz)'); ylabel('---> X(f)');
title('(b) Frequency Spectrum of Signal');
grid on;

% %<------3(c)------>
subplot(2,2,4);
fplot(angle(X), [-1 1]*4*pi); %Plot phase spectrum
xticks(-8:2:8);
xlim([-10 10]);
set(gca,'ytick',[0:pi/4:2*pi]); 
set(gca,'yticklabels',{'0','\pi/4','\pi/2', '3\pi/4', '\pi'});
xlabel('---> Frequency(Hz)');   ylabel('---> Phase(rad)');
title('(c) Phase Spectrum of Signal');
grid on;
