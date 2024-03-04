clc;clear all
data;
t_end = 1;
initialConditions = zeros(1,18);

% Parametry pro kazde teleso
% c .. viskozita, k .. tuhost pruziny, I .. momenty setrvacnosti
% teles
% v simulinku je zadan pohyb pro jednotlive nezavisle souradnice q1..q9 a
% pomoci inverzni dynamiky dopocitany potrebne momentove sily
table = readtable('Glenohumeral_muscles.xlsx');
f0m = str2double(table2array(table(:,2)))';
l0m = str2double(table2array(table(:,3)))';
% f0m = [556.8,1098.4]/10;
akt = [0.5,0.5,1]*1;
% l0m = [0.152404782147249,0.0902153118932702];

OUT = sim('ID_3d_pend.slx',t_end);
t = OUT.time.time;
fig = figure();
plot(t,OUT.q1(1,:),t,OUT.q2(1,:),t,OUT.q3(1,:),t,OUT.q10(1,:),'+',t,OUT.q11(1,:),'square',t,OUT.q12(1,:),'diamond')
title('UPPER BODY - MOMENTS')
xlabel('Time [s]')
legend('T1 SimScape [rad]','T2 SimScape [rad]','T3 SimScape [rad]','T1sim Sympy [rad]','T2sim Sympy [rad]','T3sim Sympy [rad]')
% 
fig = figure();
plot(t,OUT.q4(1,:),t,OUT.q5(1,:),t,OUT.q6(1,:),t,OUT.q13(1,:),'+',t,OUT.q14(1,:),'square',t,OUT.q15(1,:),'diamond')
title('MIDDLE BODY - MOMENTS')
xlabel('Time [s]')
legend('T4 SimScape [rad]','T5 SimScape [rad]','T6 SimScape [rad]','T4sim Sympy [rad]','T5sim Sympy [rad]','T6sim Sympy [rad]')

fig = figure();
plot(t,OUT.q7(1,:),t,OUT.q8(1,:),t,OUT.q9(1,:),t,OUT.q16(1,:),'+',t,OUT.q17(1,:),'square',t,OUT.q18(1,:),'diamond')
title('LOWER BODY - MOMENTS')
xlabel('Time [s]')
legend('T4 SimScape [rad]','T5 SimScape [rad]','T6 SimScape [rad]','T4sim Sympy [rad]','T5sim Sympy [rad]','T6sim Sympy [rad]')