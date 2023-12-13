% Integrate the equations over from 0 to 5 seconds with 50 steps.
timeSpan = linspace(0.0, 10.0, 1000);

% Set initial angles in radians and the initial speeds to zero.
initialConditions_pydy = [0, 0, 0.0, 0.0];
initialConditions_moje = [0, 0, 0.0, 0.0];

% Define particles' mass, pendulums' length, and the acceleration due to
% gravity.
m = 1.0;
l = 10.0;
g = 9.81;
% koeficienty tlumeni minus, protoze v pythonu jsou momenty s opacnym
% znamenkem
c1 = -500;
c2 = -500;

% % Create a function handle to an anonymous function which which can pass the
% % parameters.
% f = @(t, x) fun_pydy(t, x, m, l, g);
% 
% % Integrate the equations of motion with default integration settings.
% [t, x] = ode45(f, timeSpan, initialConditions_pydy);
% % Plot the results.
% fig = figure();
% plot(t, x(:,1),t,x(:,2))
% title('pydy')
% xlabel('Time [s]')
% legend('q1 [rad]','q2 [rad]')
% Create a function handle to an anonymous function which which can pass the
% parameters.
f = @(t, x) fun_moje(t, x, m, l, g, c1, c2);

% Integrate the equations of motion with default integration settings.
[t, x] = ode45(f, out.tout, initialConditions_moje);
% Plot the results.
fig = figure();
plot(t, x(:,1),t,out.q1.signals.values(:))
title('3d pend X')
xlabel('Time [s]')
legend('q1 sympy [rad]','q1 simulink [rad]')

fig = figure();
plot(t, x(:,2),t,out.q2.signals.values(:))
title('3d pend Y')
xlabel('Time [s]')
legend('q2 sympy [rad]','q2 simulink [rad]')