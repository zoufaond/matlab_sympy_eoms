% Integrate the equations over from 0 to 5 seconds with 50 steps.
t_end = 5;

% Set initial angles in radians and the initial speeds to zero.
initialConditions = [0,0,0,0,0,0,0,0,0,0,0,0];
% initialConditions = [1.4177,-0.1017,3.0485,-2.3599,0.5726,1.2291,0,0,0,0,0,0]; %stabilni poloha simulinku pri nulovych vnejsich silach
% initialConditions = [0.8982,0.3930,-2.7109,0.1216,-0.1490,-0.0864,0,0,0,0,0,0];

% Define particles' mass, pendulums' length, and the acceleration due to
% gravity.


g = 9.8;
% cI = [5.75482e-05, 6.05521e-05, 1.05345e-05,0,0,0]*10; %,-1.27405e-05, 1.65861e-05, 4.50136e-06
% ccom = [-0.0110972, 0.00637508, 0.0541825];
% sI = [0.00020065, 0.000202939, 0.000227237,0,0,0]*10; %,-4.55661e-05, -7.53511e-05, -7.42694e-05
% scom = [-0.0512948, -0.0367122, -0.0430756];
% m = [0.0370005,0.12759];
% T_c = [-0.01433, 0.02007, 0.135535];
cI = [5.75482e-05, 6.05521e-05, 1.05345e-05,-1.27405e-05, 1.65861e-05, 4.50136e-06]*1e5;
ccom = [-0.0110972, 0.00637508, 0.0541825];
sI = [0.00020065, 0.000202939, 0.000227237,-4.55661e-05, -7.53511e-05, -7.42694e-05]*1e5;
scom = [-0.0512948, -0.0367122, -0.0430756];
m = [1,1];
T_c = [-0.01433 0.02007 0.135535];
c = 1e-5;
k = 0;

k_vaz = 0;

fc = -[0.282,0.4]*0.5;
fs = -[0.1,0.23,0.73]*0.5;

f = @(t, x) shoulder(t, x,g,m,cI,sI,scom,ccom, T_c, c, k, fc, fs, k_vaz);

% Integrate the equations of motion with default integration settings.
options = odeset('RelTol',1e-9,'AbsTol',1e-9,'Refine',1,'MaxStep',1e-1);
out = sim("shoulder_model.slx",t_end);
[t, x] = ode45(f, out.time.time, initialConditions);
% Plot the results.
fig = figure();
plot(t, x(:,1),t,x(:,2),t,x(:,3),t,out.q1(1,:),'*',t,out.q2(1,:),'o',t,out.q3(1,:),'x')
title('clavicula')
xlabel('Time [s]')
legend('q1 [rad]','q2 [rad]', 'q3 [rad]','q1 sim [rad]','q2 sim [rad]', 'q3 sim [rad]')
% 
fig2 = figure();
plot(t, x(:,4),t,x(:,5),t,x(:,6),t,out.q4(1,:),'*',t,out.q5(1,:),'o',t,out.q6(1,:),'x')
title('Scapula')
xlabel('Time [s]')
legend('q4 [rad]','q5 [rad]', 'q6 [rad]','q4 sim [rad]','q5 sim [rad]', 'q6 sim [rad]')