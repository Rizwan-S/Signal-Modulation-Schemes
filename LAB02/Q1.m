fs = 50;
Ts = 1/fs;

tc = 0:1/10000:5*Ts;
td = 0:1/2000:5*Ts;
xc = -1*(tc >= 0 & tc <= 5*Ts);
xd = -1*(td >= 0 & td <= 5*Ts);

%<====== 1(a) ======>
x1 = findCycle(xc, 50, Ts, tc);
subplot(3,2,1);
plot(tc, x1);              ylim([-1.5 1.5]);
xlabel('---> time(s)');    ylabel('---> x(t)');
title('1(a1) Continuous Time, Duty Cycle = 50%');
grid on;

x1 = findCycle(xd, 50, Ts, td);
subplot(3,2,2);
stem(td, x1);               ylim([-1.5 1.5]);
xlabel('---> time(s)');     ylabel('---> x(t)');
title('1(a2) Discrete Time, Duty Cycle = 50%');
grid on;

%<====== 1(b) ======>
x1 = findCycle(xc, 25, Ts, tc);
subplot(3,2,3);
plot(tc, x1);              ylim([-1.5 1.5]);
xlabel('---> time(s)');    ylabel('---> x(t)');
title('1(b1) Continuous Time, Duty Cycle = 25%');
grid on;

x1 = findCycle(xd, 25, Ts, td);
subplot(3,2,4);
stem(td, x1);              ylim([-1.5 1.5]);
xlabel('---> time(s)');    ylabel('---> x(t)');
title('1(b2) Discrete Time, Duty Cycle = 25%');
grid on;


%<====== 1(c) ======>
x1 = findCycle(xc, 75, Ts, tc);
subplot(3,2,5);
plot(tc, x1);              ylim([-1.5 1.5]);
xlabel('---> time(s)');    ylabel('---> x(t)');
title('1(c1) Continuous Time, Duty Cycle = 75%');
grid on;

x1 = findCycle(xd, 75, Ts, td);
subplot(3,2,6);
stem(td, x1);               ylim([-1.5 1.5]);
xlabel('---> time(s)');     ylabel('---> x(t)');
title('1(c2) Discrete Time, Duty Cycle = 75%');
grid on;

%<====== Function to find signal vector based on duty cycle =====>
function [x] = findCycle(x, Duty, Ts, t)
   T_ = Ts*Duty/100;
   TP = Ts;
   mul = -1;
   for i = 1:length(t)
       x(i) = x(i) * mul;
       if t(i) >= TP
           TP = TP + Ts;
           mul = mul * -1;
       end
       if t(i) >= T_
           T_ = T_ + Ts;
           mul = mul * -1;
       end
   end
end

