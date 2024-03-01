function torq = fcn_ID(t,q,dq,ddq,m,cI,sI,hI,ccom,scom,hcom,T_t,T_c,T_s,p,m_el,a_el,cont1,cont2,cont_params,akt)
ccI = [cI(1:3),cI(6),cI(4),cI(5)];
ssI = [sI(1:3),sI(6),sI(4),sI(5)];
hhI = [hI(1:3),hI(6),hI(4),hI(5)];

torq = zeros(18,1);

fosim   = fo(0,[[q,q,q,q,q,q,q,q,q],[dq,dq,dq,dq,dq,dq,dq,dq,dq]],m,cI,sI,hI,ccom,scom,hcom,T_t,T_c,T_s,p,m_el,a_el,cont1,cont2,cont_params);
fesim = fe(0,[q,q,q,q,q,q,q,q,q],akt);

mmsim = mm(0,[q,q,q,q,q,q,q,q,q],m,ccI,ssI,hhI,ccom,scom,hcom,T_c,T_s);
ddqq = [zeros(1,9),ddq,ddq,ddq,ddq,ddq,ddq,ddq,ddq,ddq]';
torq = mmsim*ddqq-fosim-fesim;