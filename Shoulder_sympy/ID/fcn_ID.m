function torq = fcn_ID(t,q,dq,ddq,m,cI,sI,hI,ccom,scom,hcom,T_c,T_s,p,akt,force,l0m)
ccI = [cI(1:3),cI(6),cI(4),cI(5)];
ssI = [sI(1:3),sI(6),sI(4),sI(5)];
hhI = [hI(1:3),hI(6),hI(4),hI(5)];

torq = zeros(18,1);

fosim   = fo(0,[[q,q,q,q,q,q,q,q,q],[dq,dq,dq,dq,dq,dq,dq,dq,dq]],m,ccI,ssI,hhI,ccom,scom,hcom,T_c,T_s,p);
% fesim = fe(0,[q,q,q,q,q,q,q,q,q],force,l0m,akt);

mmsim = mm(0,[q,q,q,q,q,q,q,q,q],m,ccI,ssI,hhI,ccom,scom,hcom,T_c,T_s);
ddqq = [zeros(1,9),ddq,ddq,ddq,ddq,ddq,ddq,ddq,ddq,ddq]';
torq = mmsim*ddqq-fosim;