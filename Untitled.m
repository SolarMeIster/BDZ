clear
clc
clf
%--------------------------------Дано--------------------------------------
E = 14;
T = [42 21 84];
tao = [14 7 14];
Ampl = 0;
%------------------------------Векторы-------------------------------------
t = (0:.01:100);
w = 0:0.01:64/2/pi;
w_dot = 0:1:64/2/pi;
%--------------------------------------------------------------------------

%------------------------------Задание 1-----------------------------------
for i = 1:4
    figure(i)
    if (i == 4)
        hold on, grid on
        t1 = -10:.01:40;
        x = E.*rectpuls(t1, 14);
        plot(t1, x)
        axis([-10 40 -10 25])
    else
        q = T(i)/tao(i);
        d = (0:T(i):50);
        x = E.*pulstran(t, d, @rectpuls, tao(i));
        hold on, grid on
        plot(t, x)
        axis([0 50 -10 40])
    end
    title('Временная диаграмма сигнала')
end

figure(5)
hold on, grid on
y = (2./(pi.*w)).*abs(sin(pi.*w./3));
y_dot = (2./(pi.*w_dot)).*abs(sin(pi.*w_dot./3));
plot(w,y, '--')
plot(w_dot,y_dot, 'k*')
for k = 1:11
    plot([w_dot(k) w_dot(k)], [0 y_dot(k)], 'k')
end
xlabel('F, Гц'), ylabel('C_k/E')
title('Амплитудный спектр сигнала')

figure(6)
hold on, grid on
y = (2./(pi.*w)).*abs(sin(pi.*w./6));
y_dot = (2./(pi.*w_dot)).*abs(sin(pi.*w_dot./6));
plot(w,y, '--')
plot(w_dot,y_dot, 'k*')
for k = 1:11
    plot([w_dot(k) w_dot(k)], [0 y_dot(k)], 'k')
end
xlabel('F, Гц'), ylabel('C_k/E')
title('Амплитудный спектр сигнала')

figure(7)
hold on, grid on
w = 0:0.01:18/2/pi;
w_dot = 0:1:18/2/pi;
y = (2./w).*abs(sin(7*w));
y_dot = (2./w_dot).*abs(sin(7*w_dot));
plot(w,y, '--')
plot(w_dot,y_dot, 'k*')
for k = 1:3
    plot([w_dot(k) w_dot(k)], [0 y_dot(k)], 'k')
end
xlabel('F, Гц'), ylabel('C_k/E')
title('Амплитудный спектр сигнала')
%--------------------------------------------------------------------------

%------------------------------Задание 2-----------------------------------
for i = 1:3
    q = T(i)/tao(i);
    w = 2*pi/T(i);
    d = (0:T(i):50);
    x = E.*pulstran(t, d, @rectpuls, tao(i));
    figure(2*i+6)
    hold on, grid on
    plot(t, x)
    plot([0 50], [E/q E/q], 'r')
    axis([0 50 -10 40])
    for k = 1:5
        if (k ~= 3 || i == 3)
            figure(6+2*i)
            syms t
            A = (2.*E)./(k.*pi).*sin(k.*pi./q).*cos(k.*w.*t);
            Ampl = Ampl + A;
            t = (0:.01:100);
        	U = subs(A);
            plot(t, U)
        end
        if (k == 5)
            if (i == 3)
                legend('Сигнал', 'Постоянная составляющая', 'Гармоника 1', 'Гармоника 2', 'Гармоника 3', 'Гармоника 4', 'Гармоника 5')
            else    
                legend('Сигнал', 'Постоянная составляющая', 'Гармоника 1', 'Гармоника 2', 'Гармоника 4', 'Гармоника 5')
            end
            figure(7+2*i)
            hold on, grid on
            U = E/q + subs(Ampl);
            plot(t, x)
            plot(t, U)
            axis([0 50 -4 20])
            legend('Сигнал', 'Сумма гармоник 1-5')
            Ampl = 0;
        end
    end
end
%--------------------------------------------------------------------------












