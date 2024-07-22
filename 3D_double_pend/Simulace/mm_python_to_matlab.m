% syms t x1 x2 x3 x4 x5 x6 x7 x8 c k g rigid2Cx rigid2Cy rigid2Cz rigid1Px rigid1Py rigid1Pz rigid1Cx rigid1Cy rigid1Cz m1 m2 m3 IUxx IUyy IUzz IUxy IUyz IUzx ILxx ILyy ILzz ILxy ILyz ILzx real
% q = [x1,x2,x3,x4,x5,x6,x7,x8,x9];
% m = [m1,m2,m3];
% I = [IUxx IUyy IUzz IMxx IMyy IMzz ILxx ILyy ILzz];
% q = [x1,x2,x3,x4,x5,x6]; %
% m = [m1,m2];
% IU = [IUxx IUyy IUzz IUxy IUyz IUzx]; % ILxx ILyy ILzz
% IL = [ILxx ILyy ILzz ILxy ILyz ILzx];
% rigid1C = [rigid1Cx, rigid1Cy, rigid1Cz];
% rigid1P = [rigid1Px, rigid1Py, rigid1Pz];
% rigid2C = [rigid2Cx, rigid2Cy, rigid2Cz];

%%%%%%% Moje
syms qm0 qm1 qm2 qm3 qm4 qm5 qm6 qm7 um1 um2 um3 um4 um5 um6 Ixx Iyy Izz l m g t
q = [qm0 qm1 qm2 qm3 qm4 qm5 qm6 qm7];
u = [um1 um2 um3 um4 um5 um6];

%%%%%% MOORE %%%%
% syms q1U q2U q3U q1L q2L q3L q0U q0L w1U w2U w3U w1L w2L w3L u0U u0L Ixx Iyy Izz l m g t
% q = [q1U q2U q3U q1L q2L q3L q0U q0L];
% u = [w1U w2U w3U w1L w2L w3L u0U u0L];

% matlabFunction(mm,'file','mm_moje','vars',{t,q,u,Ixx,Iyy,Izz,l,m, g});
matlabFunction(fe,'file','fe_moje','vars',{t,q,u,Ixx,Iyy,Izz,l,m, g});