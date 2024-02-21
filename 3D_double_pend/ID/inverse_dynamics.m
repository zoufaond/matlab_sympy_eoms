clc;clear all
t_end = 2;
initialConditions = zeros(1,18);

% Parametry pro kazde teleso
% c .. koeficient treni, k .. tuhost pruziny, I .. momenty setrvacnosti
% teles
% v simulinku je zadan pohyb pro jednotlive nezavisle souradnice q1..q9 a
% pomoci inverzni dynamiky dopocitany potrebne momentove sily

m = [10,100,50];
g = 9.81;
IU = [84.1667, 84.1667, 1.66667]*10;
IM = [84.1667, 84.1667, 1.66667];
IL = [84.1667, 84.1667, 1.66667]*0.1;
c = 1;
k = 1;

OUT = sim('ID_3d_pend.slx',t_end);
t = OUT.time.time;
fig = figure();
plot(t,OUT.q1(1,:),t,OUT.q2(1,:),t,OUT.q3(1,:),t,OUT.q10(1,:),'+',t,OUT.q11(1,:),'square',t,OUT.q12(1,:),'diamond')
title('UPPER BODY - MOMENTS')
xlabel('Time [s]')
legend('T1 sim [rad]','T2 sim [rad]','T3 sim [rad]','T1sim symp [rad]','T2sim symp [rad]','T3sim symp [rad]')
% 
fig = figure();
plot(t,OUT.q4(1,:),t,OUT.q5(1,:),t,OUT.q6(1,:),t,OUT.q13(1,:),'+',t,OUT.q14(1,:),'square',t,OUT.q15(1,:),'diamond')
title('MIDDLE BODY - MOMENTS')
xlabel('Time [s]')
legend('T4 sim [rad]','T5 sim [rad]','T6 sim [rad]','T4sim symp [rad]','T5sim symp [rad]','T6sim symp [rad]')

fig = figure();
plot(t,OUT.q7(1,:),t,OUT.q8(1,:),t,OUT.q9(1,:),t,OUT.q16(1,:),'+',t,OUT.q17(1,:),'square',t,OUT.q18(1,:),'diamond')
title('LOWER BODY - MOMENTS')
xlabel('Time [s]')
legend('T4 sim [rad]','T5 sim [rad]','T6 sim [rad]','T4sim symp [rad]','T5sim symp [rad]','T6sim symp [rad]')