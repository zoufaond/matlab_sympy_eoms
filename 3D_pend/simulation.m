% Integrate the equations over from 0 to 5 seconds with 50 steps.
t_end = 25;
out = sim("pend_3D_sim.slx",t_end);

% Set initial angles in radians and the initial speeds to zero.
initialConditions_moje = [0.3,0.3,0.3,0,0,0];

% Define particles' mass, pendulums' length, and the acceleration due to
% gravity.

%% brick solid
mass = 10.0;
l = 5.0;
a = 0.5;
b = -0.5;
g = 9.80665;
IB = [84.1667, 84.1667, 1.66667,0, 0, 0];

f = @(t, x) pend(t, x, g, l, mass, IB, a,b);

% Integrate the equations of motion with default integration settings.
[t, x] = ode45(f, out.x_sim.time, initialConditions_moje);
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