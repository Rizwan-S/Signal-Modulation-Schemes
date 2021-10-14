clear all; close all; clc;

Am = 1;         Ac = 2;     %Parameters
fm = 50;        fc = 250;
fs = 10000;     df = 1;
kf = 12.5;      kp = 0.25;
t = 0:1/fs:1          %Time vector

%<====== 3 ======>
kfs = [12.5 41.66 70.83 100];
kps = [0.25 0.83 1.42 2];

plotNo = 1

for i=1:4
    phi_ft = Ac*fmmod(Am*cos(2*pi*fm*t), fc, fs, kfs(i)*Am);
    phi_pt = Ac*pmmod(Am*cos(2*pi*fm*t), fc, fs, kps(i)*Am);
    subplot(4,2,plotNo);
    plot(t, phi_ft, 'LineWidth', 1.5);
    xlabel('---> time(s)');    ylabel('---> \phi_{FM}(t)');
    title(sprintf('3) phi_{FM}(t) for k_f = %.2f', kfs(i)));
    xlim([0 0.1]);  ylim([-3 3]);
    grid on;
    plotNo = plotNo + 1;

    subplot(4,2,plotNo);
    plot(t, phi_pt, 'LineWidth', 1.5);
    xlabel('---> time(s)');    ylabel('---> \phi_{PM}(t)');
    title(sprintf('3) phi_{PM}(t) for k_p = %.2f', kps(i)));
    xlim([0 0.1]);  ylim([-3 3]);
    grid on;
    plotNo = plotNo + 1;
end



