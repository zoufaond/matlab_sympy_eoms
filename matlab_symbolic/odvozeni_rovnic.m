syms t y1 y2 real

y = [y1 y2]';
dydt = [y(2);(1-y(1)^2)*y(2)-y(1)];

matlabFunction(dydt,'file','myfun','vars',{t,y});


[t,y] = ode45(@myfun,[0 20],[2; 0]);
plot(t,y(:,1),'-o',t,y(:,2),'-o')
title('Solution of van der Pol Equation (\mu = 1) with ODE45');
xlabel('Time t');
ylabel('Solution y');
legend('y_1','y_2')