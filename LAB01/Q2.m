clear all;
close all;
clc;

x1_n = [-1 1 2 2 -2];
x2_n = [2 1 -1 -2 -1 1];

n1 = 0:length(x1_n)-1;
n2 = 0:length(x2_n)-1;

%<------2(a)------>
subplot(2,4,1);
stem(n1, x1_n);
xlabel('---> n');   ylabel('---> x_1[n]');
xticks(0:1:4);      yticks(-3:1:3);
title('(a) Signal x_1[n]');
grid on;

subplot(2,4,2);
stem(n2, x2_n);
xlabel('---> n');   ylabel('---> x_2[n]');
xticks(0:1:6);      yticks(-3:1:3);
title('(a) Signal x_2[n]');
grid on;

%<------2(b)------>
[y1, x1] = xcorr(x1_n);
subplot(2,4,3);
stem(x1, y1);
xlabel('---> Lag');   ylabel('---> Autocorrelation');
xticks(-4:1:4);       yticks(-4:2:14);
title('(b) Autocorrelation of x_1[n] signal');
grid on;

[y2, x2] = xcorr(x2_n);
subplot(2,4,4);
stem(x2, y2);
xlabel('---> Lag');   ylabel('---> Autocorrelation');
xticks(-10:1:10);     yticks(-16:2:20);
title('(b) Autocorrelation of x_2[n] signal');
grid on;

%<------2(c)------>
[y3, x3] = xcorr(x1_n, x2_n);
subplot(2,4,5);
stem(x3, y3);
xlabel('---> Lag');   ylabel('---> cross-correlation');
xticks(-6:1:6);       yticks(-10:2:10);
title('(c) Cross-correlation between x_1[n] and x_2[n]');
grid on;

%<------2(d)------>
y = conv(x1_n, x2_n);
ny = 0:(length(y)-1);
subplot(2,4,6:7);
stem(ny, y);
xlabel('---> n');     ylabel('---> Convolution');
xticks(0:1:10);       yticks(-10:2:10);
title('(d) Convolution between x_1[n] and x_2[n]');
grid on;

%<------2(e)------>
x2_n = flip(x2_n);
[y4, x4] = xcorr(x1_n, x2_n);
x4 = 0:1:length(x4)-1;
subplot(2,4,8);
stem(x4, y4);
xlabel('---> Lag');   ylabel('---> cross-correlation');
xticks(0:1:10);      yticks(-10:2:10);
title('(e) cross-correlation between x_1[n] and x_2[-n]');
grid on;
