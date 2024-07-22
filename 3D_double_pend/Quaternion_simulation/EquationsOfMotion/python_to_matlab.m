%%%%%%% My
syms qm0 qm1 qm2 qm3 qm4 qm5 qm6 qm7 um1 um2 um3 um4 um5 um6 Ixx Iyy Izz l m g t
q = [qm0 qm1 qm2 qm3 qm4 qm5 qm6 qm7];
u = [um1 um2 um3 um4 um5 um6];
% just insert the MM and FE from python here and generate matlabFunction 
% (I created the a function that creates the matlab function automatically, but here it's more visual what the parameters goes into the functions)


matlabFunction(mm,'file','mm_moje','vars',{t,q,u,Ixx,Iyy,Izz,l,m, g});
matlabFunction(fe,'file','fe_moje','vars',{t,q,u,Ixx,Iyy,Izz,l,m, g});