
t_end = 4;
c = [1,1,1]*1e-4;
k = [0,0,0];
initialConditions_moje = [0,0,0,0,0,0];
akt = -0.1;
%% Clavicula
g = 9.80665;
I = [5.75482e-05, 6.05521e-05, 1.05345e-05,-1.27405e-05, 1.65861e-05, 4.50136e-06]*1;
com = [-0.0110972, 0.00637508, 0.0541825]*1;
m = 0.0370005*1;

out = sim("clavicula_model.slx",t_end);
t = out.q1.time;


% Plot the results.
fig = figure();
plot(t,out.q1.signals.values(:),'*',t,out.q4.signals.values(:))
title('3d pend q1')
xlabel('Time [s]')
legend('q1 simscape [rad]','q1 sympy [rad]')

fig = figure();
plot(t,out.q2.signals.values(:),'*',t,out.q5.signals.values(:))
title('3d pend q2')
xlabel('Time [s]')
legend('q2 simscape [rad]','q2 sympy [rad]')

fig = figure();
plot(t,out.q3.signals.values(:),'*',t,out.q6.signals.values(:))
title('3d pend Z')
xlabel('Time [s]')
legend('q3 simscape [rad]','q3 sympy [rad]')
