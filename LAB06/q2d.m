clear all; close all; clc;

Am = 1;         Ac = 2;     %Parameters
fm = 50;        fc = 250;
fs = 10000;      df = 1;
t = 0:1/fs:1;          %Time vector

%<====== 2(d) ======>
kps = [0.25 0.83 1.42 2];

f = -fs/2:1:fs/2

plotNo = 1;
for i=1:4
    phi_t = Ac*pmmod(Am*cos(2*pi*fm*t), fc, fs, kps(i)*Am);
    subplot(4,2,plotNo);
    plot(t, phi_t, 'LineWidth', 1.7);
    xlabel('---> Time(s)');    ylabel('---> \phi_{PM}(t)');
    title(sprintf('2(d) phi_{PM}(t) for k_p = %.2f', kps(i)));
    xlim([0 0.1]);  ylim([-3 3]);
    grid on;
    plotNo = plotNo + 1;
    
    
    fftphi = fftshift(fft(phi_t))/length(phi_t);
    subplot(4,2,plotNo);
    plot(f, real(fftphi), 'LineWidth', 1.7);
    xlabel('---> Frequency(Hz)');    ylabel('---> \phi_{PM}(f)');
    title(sprintf('2(d) Frequency spectrum of phi_{PM}(t) for k_p = %.2f', kps(i)));
    xlim([-500 500]); 
    xticks(-800:50:800);  yticks(-1:0.5:1);
    if i == 1
        ylim([-0.25 1.25]);
    elseif i == 2
        ylim([-0.25 1]);
    elseif i == 3
        ylim([-0.5 0.75]);
    else
        ylim([-0.5 0.5]);
    end
    grid on
    plotNo = plotNo + 1;
end


