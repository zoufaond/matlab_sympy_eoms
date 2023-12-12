% Integrate the equations over from 0 to 5 seconds with 50 steps.
timeSpan = linspace(0,4,10000);

% Set initial angles in radians and the initial speeds to zero.
initialConditions_moje = [0,0,0,0,0,0];

% Define particles' mass, pendulums' length, and the acceleration due to
% gravity.
g = 9.80665;
I = [5.75482e-05, 6.05521e-05, 1.05345e-05,-1.27405e-05, 1.65861e-05, 4.50136e-06];
com = [-0.0110972, 0.00637508, 0.0541825];
m = 0.0370005;
c = [1,1,1]*1e-4;

f = @(t, x) clvc(t, x, g,m, I, com, c);

% Integrate the equations of motion with default integration settings.
[t, x] = ode45(f, timeSpan, initialConditions_moje);
% Plot the results.
fig = figure();
plot(t, x(:,1),t,x(:,2),t,x(:,3))
title('Upper')
xlabel('Time [s]')
legend('q1 [rad]','q2 [rad]', 'q3 [rad]')
% 
