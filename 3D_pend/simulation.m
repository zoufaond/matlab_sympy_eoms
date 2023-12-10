% Integrate the equations over from 0 to 5 seconds with 50 steps.
timeSpan = linspace(0.0, 10.0, 100);

% Set initial angles in radians and the initial speeds to zero.
initialConditions_moje = [0.1,0.2,0.3,0,0,0];

% Define particles' mass, pendulums' length, and the acceleration due to
% gravity.
mass = 10.0;
l = 5.0;
a = 0.5;
b = -0.5;
g = 9.81;
IB = [84.1667, 84.1667, 1.66667];

f = @(t, x) pend(t, x, g, l, mass, IB, a,b);

% Integrate the equations of motion with default integration settings.
[t, x] = ode45(f, timeSpan, initialConditions_moje);
% Plot the results.
fig = figure();
plot(t, x(:,1),t,x(:,2),t,x(:,3))
title('3d pend')
xlabel('Time [s]')
legend('q1 [rad]','q2 [rad]', 'q3 [rad]')