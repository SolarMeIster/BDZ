clear
clc
clf
x = 0:0.01:10;
x_dot = 0:1:10;

%------------------------------Задание 1-----------------------------------
figure(1)
hold on, grid on
y = (28./(pi.*x)).*abs(sin(pi.*x./3));
y_dot = (28./(pi.*x_dot)).*abs(sin(pi.*x_dot./3));
plot(x,y)
plot(x_dot,y_dot, 'r*')
title('Амплитудный спектр для второго сигнала')

figure(2)
hold on, grid on
y = (28./(pi.*x)).*abs(sin(pi.*x./6));
y_dot = (28./(pi.*x_dot)).*abs(sin(pi.*x_dot./6));
plot(x,y)
plot(x_dot,y_dot, 'r*')
title('Амплитудный спектр для третьего сигнала')

figure(3)
hold on, grid on
x = 0:0.01:2;
x_dot = 0:1:2;
y = (28./x).*abs(sin(7*x));
y_dot = (28./x_dot).*abs(sin(7*x_dot));
plot(x,y)
plot(x_dot,y_dot, 'r*')
title('Амплитудный спектр для четвертого сигнала')
%--------------------------------------------------------------------------

%------------------------------Задание -----------------------------------
E = 14;
T = [42 21 84];
tao = [14 7 14];
k = 1:300;
head = {'Временная диаграмма для первого и третьего сигнала' 'Временная диаграмма для второго сигнала' 'Временная диаграмма для третьего сигнала'}
for i = 1:3
figure(3+i)
hold on, grid on
% q = T(i)/tao(i);
% x = 2*pi/T(i);
% syms t
% A = sum((2.*E)./(k.*pi).*sin(k.*pi./q).*cos(k.*x.*t));
% t = -10:0.1:50;
% U = E/q + subs(A);
% plot(t, U)

t = (-10:.01:50);
d = (0:T(i):50);
x = E.*pulstran(t, d, @rectpuls, tao(i));
plot(t, x)
axis([-10 50 -2 16])
title(head(i))
end

figure(11)
hold on, grid on 
x = E.*rectpuls(-10:0.01:10, 14);
plot(-10:0.01:10, x)
axis([-10 10 -2 16])
title('Временная диаграмма для единичного четверого сигнала')

% 
% for i = 1:3
% figure(6+i)
% hold on, grid on
% q = T(i)/tao(i);
% x = 2*pi/T(i);
% syms t
% A = sum((2.*E)./(k.*pi).*sin(k.*pi./q).*cos(k.*2.*x.*t));
% t = -10:0.1:50;
% U = E/q + subs(A)
% plot(t, U)
% 
% t = (-10:.01:50);
% d = (0:T(i):50)
% x = E.*pulstran(t, d, @rectpuls, tao(i));
% plot(t, x)
% end
% 
% for i = 1:3
% figure(9+i)
% hold on, grid on
% q = T(i)/tao(i);
% x = 2*pi/T(i);
% syms t
% A = sum((2.*E)./(k.*pi).*sin(k.*pi./q).*cos(k.*3.*x.*t));
% t = -10:0.1:50;
% U = E/q + subs(A)
% plot(t, U)
% 
% t = (-10:.01:50);
% d = (0:T(i):50)
% x = E.*pulstran(t, d, @rectpuls, tao(i));
% plot(t, x)
% end
%--------------------------------------------------------------------------












