%<===== 2(a) =====>
n11 = -2;       n12 = 2;
n21 = -2;       n22 = 2;
subplot(3,4,1);
[y1, ny1] = FindConvolution(n11, n12, n21, n22);
stem(ny1, y1);
xlabel('---> n');    ylabel('---> convolution');
yticks(0:1:6);
title('2(a) Discrete-Time');
grid on;

subplot(3,4,2);
plot(ny1, y1);
xlabel('---> t');    ylabel('---> convolution');
yticks(0:1:6);       ylim([0 6]);
title('2(a) Continuous-Time');
grid on;

%<===== 2(d(a)) =====>
x1 = ones(1, n12 - n11 + 1);
x2 = ones(1, n22 - n21 + 1);
ny1 = (n11+n21):1:(n12+n22);
subplot(3,4,3);
stem(ny1, conv(x1, x2));
xlabel('---> n');    ylabel('---> convolution');
yticks(0:1:6);
title('2(d(a)) Discrete-Time');
grid on;

y1 = conv(x1, x2);
subplot(3,4,4);
plot(ny1, y1);
xlabel('---> t');    ylabel('---> convolution');
yticks(0:1:6);       ylim([0 6]);
title('2(d(a)) Continuous-Time');
grid on;

%<===== 2(b) =====>
n11 = -2;      n12 = 2;
n21 = 0;       n22 = 4;
subplot(3,4,5);
[y1, ny1] = FindConvolution(n11, n12, n21, n22);
stem(ny1, y1);
xlabel('---> n');    ylabel('---> convolution');
yticks(0:1:6);      
title('2(b) Discrete-Time');
grid on;

subplot(3,4,6);
plot(ny1, y1);
xlabel('---> t');    ylabel('---> convolution');
yticks(0:1:6);       ylim([0 6]);
title('2(b) Continuous-Time');
grid on;

%<===== 2(d(b)) =====>
x1 = ones(1, n12 - n11 + 1);
x2 = ones(1, n22 - n21 + 1);
ny1 = (n11+n21):1:(n12+n22);
subplot(3,4,7);
stem(ny1, conv(x1, x2));
xlabel('---> n');    ylabel('---> convolution');
yticks(0:1:6);
title('2(d(b)) Discrete-Time');
grid on;

y1 = conv(x1, x2);
subplot(3,4,8);
plot(ny1, y1);
xlabel('---> t');    ylabel('---> convolution');
yticks(0:1:6);       ylim([0 6]);
title('2(d(b)) Continuous-Time');
grid on;

%<===== 2(c) =====>
n11 = -5;      n12 = 5;
n21 = -1;       n22 = 6;
subplot(3,4,9);
[y1, ny1] = FindConvolution(n11, n12, n21, n22);
stem(ny1, y1);
xlabel('---> n');    ylabel('---> convolution');
yticks(0:1:8);       xticks(-6:2:12);
xlim([-6 11]);
title('2(c) Discrete-Time');
grid on;

subplot(3,4,10);
plot(ny1, y1);
xlabel('---> t');    ylabel('---> convolution');
yticks(0:1:8);       xticks(-6:2:12);
xlim([-6 11]);
title('2(c) Continuous-Time');
grid on;

%<===== 2(d(c)) =====>
x1 = ones(1, n12 - n11 + 1);
x2 = ones(1, n22 - n21 + 1);
ny1 = (n11+n21):1:(n12+n22);
subplot(3,4,11);
stem(ny1, conv(x1, x2));
xlabel('---> n');    ylabel('---> convolution');
yticks(0:1:8);       xticks(-6:2:12);
xlim([-6 11]);
title('2(d(c)) Discrete-Time');
grid on;

y1 = conv(x1, x2);
subplot(3,4,12);
plot(ny1, y1);
xlabel('---> t');    ylabel('---> convolution');
yticks(0:1:8);       xticks(-6:2:12);
xlim([-6 11]);
title('2(d(c)) Continuous-Time');
grid on;

%<===Function to find discrete time convolution ===>
function [y, ny] = FindConvolution(n11, n12, n21, n22)
    x1 = ones(1, n12 - n11 + 1);       
    x2 = ones(1, n22 - n21 + 1);
    ny = (n11+n21):1:(n12+n22);         
    y = zeros(1, (n12+n22)-(n11+n21)+1);
    
    n1 = length(x1);
    n2 = length(x2);
    for n = 1:(n1+n2-1)                 
        for k = 1:n1
            if(n-k >= 0 && n-k < n2)
                y(n) = y(n) + x1(k)*x2(n-k+1);
            end
        end
    end
end


