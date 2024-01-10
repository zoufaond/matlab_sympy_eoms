% Integrate the equations over from 0 to 5 seconds with 50 steps.
t_end = 3;


% Set initial angles in radians and the initial speeds to zero.
phi0 = -65;
initialConditions = [phi0, 0]*pi/180;
% Define particles' mass, pendulums' length, and the acceleration due to
% gravity.
m = 1;
l = 10.0;
g = 9.81;
ax = 1;
ay = 10;
az = 1;
k = 2e8;
mx = 2;
my = -5;
mz = 0;
eps = 0.001; 
c = 10;
% DAVAT POZOR NA eps A k, JE TREBA DOBRE NALADIT

out = sim("chadwick.slx",t_end); % run simscape first
f = @(t, x) fun(t, x, m, g, mx, my, ax, ay, eps,k,l,c);
% Integrate the equations of motion with default integration settings.
[t, x] = ode89(f, out.time.time, initialConditions);
% Plot the results.
fig = figure();
plot(t, x(:,1),t,x(:,2),t,out.q(1,:),'o',t,out.w(1,:),'*')
title('moje')
xlabel('Time [s]')
legend('q1 [rad]','q2 [rad]','q1 sim [rad]', 'q2 sim [rad]')