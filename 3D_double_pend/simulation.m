
t_end = 5;

% Set initial angles in radians and the initial speeds to zero.
initialConditions = [0,0,0,0,0,0,0,0,0,0,0,0];

% Define particles' mass, pendulums' length, and the acceleration due to
% gravity.
m = [10,10];
s1 = [5,0,0];
s2 = [5,0,0];
g = 9.81;
IU = [84.1667, 84.1667, 1.66667];
IL = [84.1667, 84.1667, 1.66667];
c = [1,1,1,1,1,1]*0;
k = [1,1]*0;
f = [-100,-100];

OUT = sim('pend_3D_sim.slx',t_end);

f = @(t, x) fcn(t, x, g, m, s1, s2, IU, IL,c,k,f);

% Integrate the equations of motion with default integration settings.
options = odeset('AbsTol',1e-8,'RelTol',1e-8);
[t, x] = ode89(f, OUT.tout, initialConditions,options);
% Plot the results.
fig = figure();
plot(t, x(:,1),t,x(:,2),t,x(:,3),t,OUT.q1(1,:),'*',t,OUT.q2(1,:),'o',t,OUT.q3(1,:),'x')
title('Upper')
xlabel('Time [s]')
legend('q1 [rad]','q2 [rad]', 'q3 [rad]', 'q1sim [rad]','q2sim [rad]','q3sim [rad]')
% 
fig = figure();
plot(t, x(:,4),t,x(:,5),t,x(:,6),t,OUT.q4(1,:),'*',t,OUT.q5(1,:),'o',t,OUT.q6(1,:),'x')
title('Lower')
xlabel('Time [s]')
legend('q4 [rad]','q5 [rad]', 'q6 [rad]','q4sim [rad]','q5sim [rad]','q6sim [rad]')