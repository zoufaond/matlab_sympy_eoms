% Integrate the equations over from 0 to 5 seconds with 50 steps.
timeSpan = linspace(0,2,100);

% Set initial angles in radians and the initial speeds to zero.
initialConditions_moje = [0,0,0,0,0,0,0,0,0,0,0,0];

% Define particles' mass, pendulums' length, and the acceleration due to
% gravity.

% NENI ANI VE FUNKCI JESTE DOPSANA TRANSLACE PRO AC KLOUB
g = 9.80665;
cI = [5.75482e-05, 6.05521e-05, 1.05345e-05,-1.27405e-05, 1.65861e-05, 4.50136e-06];
ccom = [-0.0110972, 0.00637508, 0.0541825];
sI = [0.00020065, 0.000202939, 0.000227237,-4.55661e-05, -7.53511e-05, -7.42694e-05];
scom = [-0.0512948, -0.0367122, -0.0430756];
m = [0.0370005,0.12759];
c_SC = [1,1,1]*1;
c_AC = [1,1,1]*1;
T_c = [-0.01433, 0.02007, 0.135535];

f = @(t, x) shoulder(t, x,g,m,cI,sI,scom,ccom, c_SC,c_AC, T_c);

% Integrate the equations of motion with default integration settings.
[t, x] = ode45(f, timeSpan, initialConditions_moje);
% Plot the results.
fig = figure();
plot(t, x(:,1),t,x(:,2),t,x(:,3))
title('clavicula')
xlabel('Time [s]')
legend('q1 [rad]','q2 [rad]', 'q3 [rad]')
% 
fig2 = figure();
plot(t, x(:,4),t,x(:,5),t,x(:,6))
title('Scapula')
xlabel('Time [s]')
legend('q4 [rad]','q5 [rad]', 'q6 [rad]')