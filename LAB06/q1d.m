clear all; close all; clc;

Am = 1;         Ac = 2;     %Parameters
fm = 50;        fc = 250;
fs = 10000;      df = 1;
t = [0:fs-1]*1/fs;          %Time vector

%<====== 1(d) ======>
kfs = [12.5 41.66 70.83 100];

f = [-fs/2:fs/2-1]*df;

plotNo = 1;
for i=1:4
    phi_t = Ac*fmmod(Am*cos(2*pi*fm*t), fc, fs, kfs(i)*Am);
    subplot(4,2,plotNo);
    plot(t, phi_t, 'LineWidth', 1.7);
    xlabel('---> Time(s)');    ylabel('---> \phi_{FM}(t)');
    title(sprintf('1(d) phi_{FM}(t) for k_f = %.2f', kfs(i)));
    xlim([0 0.1]);  ylim([-3 3]);
    grid on;
    plotNo = plotNo + 1;
    fftphi = fftshift(fft(phi_t))/length(phi_t);
    subplot(4,2,plotNo);
    plot(f, real(fftphi), 'LineWidth', 1.7);
    xlabel('---> Frequency(Hz)');    ylabel('---> \phi_{FM}(f)');
    title(sprintf('1(d) Frequency spectrum of phi_{FM}(t) for k_f = %.2f', kfs(i)));
    xlim([-500 500]); 
    xticks(-800:50:800);  yticks(-1:0.5:1);
    if i == 1
        ylim([-0.5 1.25]);
    elseif i == 2
        ylim([-0.5 1]);
    elseif i == 3
        ylim([-0.75 0.75]);
    else
        ylim([-1 1]);
    end
    grid on
    plotNo = plotNo + 1;
end


