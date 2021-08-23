A1 = 2;  A2 = 6;           %Given Parameters
f1 = 50; f2 = 100;

fs = 10000;
t1 = 0:1/fs:0.1;

m1 = A1*cos(2*pi*f1*t1);
m2 = A1*cos(2*pi*f1*t1) + A2*cos(2*pi*f2*t1);

%<===== 3(a1) =====>
subplot(3,2,1);     plot(t1, m1);
xlabel('---> time(s)');    ylabel('---> m_1(t)');
title('3(a1) m_1(t) signal');
grid on;

%<===== 3(a2) =====>
subplot(3,2,2);     plot(t1, m2);
xlabel('---> time(s)');    ylabel('---> m_2(t)');
ylim([-8 10]);             yticks(-8:2:10);
title('3(a2) m_2(t) signal');
grid on;

%<===== 3(b1) =====>
N1 = length(fft(m1));        %Number of samples
ts1 = 10/fs;                 %time 
df1 = 1/(N1*ts1);            %frequency gap
t1 = [0:N1-1]*ts1;           %Time vector
m1 = A1*cos(2*pi*f1*t1);
m2 = A1*cos(2*pi*f1*t1) + A2*cos(2*pi*f2*t1);
Xf_shift1 = fftshift(fft(m1))/length(m1);  %perform zero-centered circular shift on fourier transform and normalize it      
Ff_shift1 = [-N1/2:N1/2-1]*df1; 

subplot(3,2,3);
plot(Ff_shift1, abs(Xf_shift1));
xlabel('---> Frequency(Hz)');    ylabel('---> M_1(f)');
title('3(b1) Frequency spectrum of m_1(t) signal');
xlim([-200 200]); 
grid on;

%<===== 3(b2) =====>
Xf_shift2 = fftshift(fft(m2))/length(m2);  %perform zero-centered circular shift on fourier transform and normalize it      

subplot(3,2,4);
plot(Ff_shift1, abs(Xf_shift2));
xlabel('---> Frequency(Hz)');    ylabel('---> M_2(f)');
title('3(b2) Frequency spectrum of m_2(t) signal');
xlim([-200 200]); 
grid on;

%<===== 3(c1) =====>
subplot(3,2,5);
plot(Ff_shift1, angle(Xf_shift1));
xlabel('---> Frequency(Hz)');    ylabel('---> Phase(rad)');
title('3(c1) Phase spectrum of m_1(t) signal');
set(gca,'ytick',[-pi:pi/2:pi]); 
set(gca,'yticklabels',{'-\pi','-\pi/2','0','\pi/2','\pi'});
xlim([-100 100]);
grid on;

%<===== 3(c2) =====>
subplot(3,2,6);
plot(Ff_shift1, angle(Xf_shift2));
xlabel('---> Frequency(Hz)');    ylabel('---> Phase(rad)');
title('3(c2) Phase spectrum of m_2(t) signal');
xlim([-200 200]);
set(gca,'ytick',[-pi:pi/2:pi]); 
set(gca,'yticklabels',{'-\pi','-\pi/2','0','\pi/2','\pi'});
grid on;