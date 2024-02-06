% Integrate the equations over from 0 to 5 seconds with 50 steps.
t_end = 2;
Glenohumeral = readmatrix('Glenohumeral_muscles.xlsx');
Glenohumeral_F0M = Glenohumeral(2:end,2);
Glenohumeral_l0  = Glenohumeral(2:end,3);
Scapulothoracic = readmatrix('Scapulothoracic_muscles.xlsx');
Scapulothoracic_F0M = -Scapulothoracic(2:end,2);
Scapulothoracic_l0  = Scapulothoracic(2:end,3);

% Set initial angles in radians and the initial speeds to zero.
initialConditions = [0,0,0,0,0,0,0,0,0,0,0,0];
% initialConditions = [1.4177,-0.1017,3.0485,-2.3599,0.5726,1.2291,0,0,0,0,0,0]; %stabilni poloha simulinku pri nulovych vnejsich silach
% initialConditions = [0.8982,0.3930,-2.7109,0.1216,-0.1490,-0.0864,0,0,0,0,0,0];
% kontaktni bod na scapule
cont_P1 = [-0.083529 -0.01368 -0.098954];
cont_P2 = [-0.105456 -0.125076 -0.075251];
% umisteni elipsoidu
x_ej = -0.03;
y_ej = -0.1;
z_ej = 0.05;
T_el = [x_ej,y_ej,z_ej];
% tvar eliposidu
a_ej = 0.088-0.005;
b_ej = 0.15;
c_ej = 0.088-0.005;
sh_e = [a_ej,b_ej,z_ej];
eps = 0.0001;
k_contact = 10000;
g = 9.8;
akt = [0];


Ckonst = 1e3;
cI = [5.75482e-05, 6.05521e-05, 1.05345e-05,-1.27405e-05, 1.65861e-05, 4.50136e-06]*Ckonst; %,-1.27405e-05, 1.65861e-05, 4.50136e-06
ccom = [-0.0110972, 0.00637508, 0.0541825];
sI = [0.00020065, 0.000202939, 0.000227237,-4.55661e-05, -7.53511e-05, -7.42694e-05]*Ckonst; %,-4.55661e-05, -7.53511e-05, -7.42694e-05
scom = [-0.0512948, -0.0367122, -0.0430756];
m = [1,1]*Ckonst;
T_c = [-0.01433, 0.02007, 0.135535];

%%real konstanty
% cI = [5.75482e-05, 6.05521e-05, 1.05345e-05,-1.27405e-05, 1.65861e-05, 4.50136e-06]*1e5;
% ccom = [-0.0110972, 0.00637508, 0.0541825];
% sI = [0.00020065, 0.000202939, 0.000227237,-4.55661e-05, -7.53511e-05, -7.42694e-05]*1e5;
% scom = [-0.0512948, -0.0367122, -0.0430756];
% m = [1,1];
% T_c = [-0.01433 0.02007 0.135535];

c = 1e-1;
k = 0;

k_vaz = 0;

f = @(t, x) shoulder(t, x,g,m,cI,sI,scom,ccom, T_c, c, k,sh_e,T_el,eps,k_contact,cont_P1,cont_P2, akt, num2cell(Scapulothoracic_F0M(1:7)),num2cell(Scapulothoracic_l0(1:7)));

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