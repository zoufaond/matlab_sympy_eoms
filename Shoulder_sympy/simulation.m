
t_end = 10;

%% Clavicula
g = 9.80665;
I = [5.75482e-05, 6.05521e-05, 1.05345e-05,-1.27405e-05, 1.65861e-05, 4.50136e-06];
com = [-0.0110972, 0.00637508, 0.0541825];
m = 0.0370005;
c = [1,1,1]*0;
initialConditions_moje = [0,0,0,0,0,0];

%% simulink run
out = sim("clavicula_model.slx",t_end);
%% Scapula
% g = 9.80665;
% I = [0.00020065, 0.000202939, 0.000227237,-4.55661e-05, -7.53511e-05, -7.42694e-05];
% com = [-0.0512948, -0.0367122, -0.0430756];
% m = 0.12759;
% c = [1,1,1]*1;

f = @(t, x) clvcl_f_com(t, x, g,m, I, com, c);

% Integrate the equations of motion with default integration settings.
% Integrate the equations of motion with default integration settings.
options = odeset('AbsTol',1e-3,'RelTol',1e-3);
[t, x] = ode23tb(f, out.q1.time, initialConditions_moje);
% Plot the results.
fig = figure();
plot(t, x(:,1),t,out.q1.signals.values(:))
title('3d pend q1')
xlabel('Time [s]')
legend('q1 sympy [rad]','q1 simulink [rad]')

fig = figure();
plot(t, x(:,2),t,out.q2.signals.values(:))
title('3d pend q2')
xlabel('Time [s]')
legend('q2 sympy [rad]','q2 simulink [rad]')

fig = figure();
plot(t, x(:,3),t,out.q3.signals.values(:))
title('3d pend Z')
xlabel('Time [s]')
legend('q3 sympy [rad]','q3 simulink [rad]')
