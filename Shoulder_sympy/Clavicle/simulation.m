
t_end = 4;
c = [1,1,1]*0;
k = [0,0,0];
initialConditions_moje = [0,0,0,0,0,0];
%% scapulohumeral rhythm
%kontaktni body na scapule
x_cont1 = -0.083529;
y_cont1 = -0.01368;
z_cont1 = -0.098954;
cont1 = [x_cont1 y_cont1 z_cont1];
% translation
x_ej = -0.0; %zmena
y_ej = -0.1; % %zmena
z_ej = -0.1; %zmena
mx=x_ej;
my=y_ej;
mz=z_ej;
m_el = [x_ej,y_ej,z_ej];
% euler angles
psi_ej = 0; % rot y
mu_ej = 0; % rot x
phi_ej = 0; % rot y
% ellipsoidal joint
r_ej = 0.088-0.04; % 0.087;
h_ej = 0.15; % 0.15;
ax=r_ej;
ay=h_ej;
az=r_ej;
a_el = [r_ej,h_ej,r_ej];
% contact force Chadwick
k_contact = 1000;
eps = 1;
%% Clavicula
g = 9.80665;
I = [5.75482e-05, 6.05521e-05, 1.05345e-05,-1.27405e-05, 1.65861e-05, 4.50136e-06];
com = [-0.0110972, 0.00637508, 0.0541825];
m = 0.0370005;

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
