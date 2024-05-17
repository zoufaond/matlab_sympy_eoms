syms t x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 m1 m2 m3 c k g IUxx IUyy IUzz IUxy IUyz IUzx ILxx ILyy ILzz ILxy ILyz ILzx rigid2Cx rigid2Cy rigid2Cz rigid1Px rigid1Py rigid1Pz rigid1Cx rigid1Cy rigid1Cz real
% q = [x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18];
% m = [m1,m2,m3];
% I = [IUxx IUyy IUzz IMxx IMyy IMzz ILxx ILyy ILzz];

q = [x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12];
m = [m1,m2];

% q = [x1,x2,x3,x4,x5,x6];
IU = [IUxx IUyy IUzz IUxy IUyz IUzx];
IL = [ILxx ILyy ILzz ILxy ILyz ILzx];
rigid1C = [rigid1Cx, rigid1Cy, rigid1Cz];
rigid1P = [rigid1Px, rigid1Py, rigid1Pz];
rigid2C = [rigid2Cx, rigid2Cy, rigid2Cz];


matlabFunction(fo,'file','fo','vars',{t,q,IU,IL,m,c,k,g,rigid1C,rigid1P,rigid2C});