clc
clear all
data;
nx = 12;
ny = 12;
nu = 6;
nlobj = nlmpc(nx,ny,nu);
Ts = 0.01;
p_hor = 100;
c_hor = 100;
sim_time = Ts*p_hor;
nlobj.Ts = Ts;
for i=1:6
nlobj.MV(i).Min = -10000;
nlobj.MV(i).Max = 10000;
end

% nlobj.States(1).Max = x0(1);
% nlobj.States(2).Max = 0*pi/180;

% sin_q1 = [(sin(linspace(0,pi,p)-pi/2)'+1)/2-pi/2];
% sin_q2 = [(sin(linspace(0,2*pi,p)-pi/2)'+1)/6];
% % sin_q2 = linspace(0,1,p)'.^2;
scale = 1;
trajectory = (sin(linspace(0,pi,p_hor)-pi/2)'+1)*scale;
traj = [trajectory,trajectory*0.5,trajectory*0.4];

nlobj.PredictionHorizon = p_hor;
nlobj.ControlHorizon = c_hor;
nlobj.Model.StateFcn = "optim_control_nlmpc";
% +(sum((X(10:p_hor,1)-0).^2)+sum((X(10:p_hor,2)-0.3).^2))*100
nlobj.Optimization.CustomCostFcn = @(X,U,e,data) sum(sum((XYZ_angles(X(1:p_hor,:)')-traj').^2)); % sum(sum(U(1:p_hor,:).^2)) +
nlobj.Optimization.ReplaceStandardCost = true;
nlobj.Optimization.SolverOptions.Display = "iter-detailed";
nlobj.Optimization.SolverOptions.MaxIterations = 1000;
nlobj.Optimization.SolverOptions.StepTolerance = 1e-9;
nlobj.Optimization.SolverOptions.OptimalityTolerance = 1e-9;
nlobj.Optimization.SolverOptions.ConstraintTolerance = 1e-9;
nlobj.Optimization.SolverOptions.FunctionTolerance = 1e-9;
% phi_timespan = 1:p_hor;
% phi_bound = 8;
% nlobj.Optimization.CustomIneqConFcn = @(X,U,e,data) [phi_react(X(phi_timespan,:),U(phi_timespan,:),data)-phi_bound;-phi_react(X(phi_timespan,:),U(phi_timespan,:),data)-phi_bound]; %phi_react(X(50:70,1:4),U(50:70,1:2),data)-50
% nlobj.Optimization.CustomEqConFcn = @(X,U,data) X(end,1)+X(end,2)-140/180*pi;

x0 = initialConditions;
u0 = [0;0;0;0;0;0];
validateFcns(nlobj,x0,u0);
[~,~,info] = nlmpcmove(nlobj,x0,u0);

figure
plot(info.Topt,info.Xopt(:,1),info.Topt,info.Xopt(:,2),info.Topt,info.Xopt(:,3),info.Topt,info.Xopt(:,4),info.Topt,info.Xopt(:,5),info.Topt,info.Xopt(:,6))
legend('1','2','3','4','5','6')

angles = XYZ_angles(info.Xopt');
figure
plot(info.Topt,angles(1,:),info.Topt,angles(2,:),info.Topt,angles(3,:))
legend('x','y','z')

pre_end = 1;
inputData = timeseries(info.MVopt(1:end-pre_end,:),info.Topt(1:end-pre_end));
save("inputData.mat","inputData","-v7.3");