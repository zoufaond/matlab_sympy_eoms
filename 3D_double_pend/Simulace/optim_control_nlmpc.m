function dx = optim_control_nlmpc(x,u)
akt = u';
m = [5,10];
g = 9.81;
IU = [8.1667, 8.1667, 1.66667,0,0,0];
IL = [8.1667, 8.1667, 1.66667,0,0,0];
rigid1C = [0,0,5];
rigid1P = [0,0,-5];
rigid2C = [0,0,5];
force = [1,1,1,1,1,1]*(30);
l0m = [30,30,30,30,30,30];
c = 100;
k = 0;
MM = mm(0,x(1:6)',IU,IL,m,c,k,g,rigid1C,rigid1P,rigid2C);
FO = fo(0,x',IU,IL,m,c,k,g,rigid1C,rigid1P,rigid2C);
FE = fe(0,[x(1:6)',x(7:12)'],force,l0m,akt);
dx = MM\(FO+FE);
end