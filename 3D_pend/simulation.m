t_end = 20;
initialConditions_moje = [1,0.5,0.4,0,0,0];

force = -60;
%% brick solid constants
mass = 10.0;
l = 5;
a = 0;
b = 0;
g = 9.80665;
IB = [84.1667, 84.1667, 1.66667,0, 0, 0];
c = [1,1,1]*1;
k = [1,1,1]*1;
%% simulation

out = sim("pend_3D_sim.slx",t_end); % run simscape first
f = @(t, x) pend(t, x, g, l, mass, IB, a,b,c,k,force); 

% Integrate the equations of motion with default integration settings.
options = odeset('AbsTol',1e-10,'RelTol',1e-10);
[t, x] = ode89(f, out.x_sim.time, initialConditions_moje); %run ODE with the same timeSpan and step as Simscape did
% Plot the results.
fig = figure();
plot(t, x(:,1),t,out.x_sim.signals.values(:))
title('3d pend X')
xlabel('Time [s]')
legend('x sympy [rad]','x simulink [rad]')

fig = figure();
plot(t, x(:,2),t,out.y_sim.signals.values(:))
title('3d pend Y')
xlabel('Time [s]')
legend('y sympy [rad]','y simulink [rad]')

fig = figure();
plot(t, x(:,3),t,out.z_sim.signals.values(:))
title('3d pend Z')
xlabel('Time [s]')
legend('z sympy [rad]','z simulink [rad]')