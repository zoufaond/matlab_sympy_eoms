t_end = 8;
coder.extrinsic("fcn.m")
% Set initial angles in radians and the initial speeds to zero.
initialConditions = [1,1,1,1,1,1,0,0,0,0,0,0]*0.1;

% Define particles' mass, pendulums' length, and the acceleration due to
% gravity.
m = [10,10];
s1 = [5,0,0];
s2 = [5,0,0];
g = 9.81;
IU = [84.1667, 84.1667, 1.66667];
IL = [84.1667, 84.1667, 1.66667];
c = [1,1,1,1,1,1]*1e1;
k = [1,1]*1;
force = -[1,2,1]*0;
akt = [1,1,1]*0;
l0m = [30,20,30];
% kontaktni bod na lower
cont_P = [0 0 0];
% umisteni elipsoidu
x_ej = 0;% -0.03;
y_ej = 0; %-0.1;
z_ej = -15;
T_el = [x_ej,y_ej,z_ej];
% tvar eliposidu
a_ej = 5;
b_ej = 5;
c_ej = 10;
sh_e = [a_ej,b_ej,z_ej];
eps = 0.0001;
k_contact = 10000;

OUT = sim('pend_3D_sim.slx',t_end);

f = @(t, x) fcn(t, x, g, m, s1, s2, IU, IL,c,k,sh_e,T_el,eps,k_contact,cont_P,akt,force,l0m);

% Integrate the equations of motion with default integration settings.
options = odeset('AbsTol',1e-8,'RelTol',1e-8);
[t, x] = ode45(f, OUT.tout, initialConditions,options);
% Plot the results.
fig = figure();
plot(t, x(:,1),t,x(:,2),t,x(:,3),t,OUT.q1(1,:),'*',t,OUT.q2(1,:),'o',t,OUT.q3(1,:),'x',t,OUT.q7(1,:),'+',t,OUT.q8(1,:),'square',t,OUT.q9(1,:),'diamond') %
title('Upper')
xlabel('Time [s]')
legend('q1 [rad]','q2 [rad]', 'q3 [rad]', 'q1sim [rad]','q2sim [rad]','q3sim [rad]','q1sim symp [rad]','q2sim symp [rad]','q3sim symp [rad]') %
% 
fig = figure();
plot(t, x(:,4),t,x(:,5),t,x(:,6),t,OUT.q4(1,:),'*',t,OUT.q5(1,:),'o',t,OUT.q6(1,:),'x',t,OUT.q10(1,:),'+',t,OUT.q11(1,:),'square',t,OUT.q12(1,:),'diamond') %
title('Lower')
xlabel('Time [s]')
legend('q4 [rad]','q5 [rad]', 'q6 [rad]','q4sim [rad]','q5sim [rad]','q6sim [rad]','q4sim symp [rad]','q5sim symp [rad]','q6sim symp [rad]') %