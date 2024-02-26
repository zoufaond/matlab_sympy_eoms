function torq = fcn_ID(t,q,dq,ddq,g,m, IU,IM,IL,c,k,akt,force,l0m)

torq = zeros(18,1);

fosim   = fo(0,[[q,q,q,q,q,q,q,q,q],[dq,dq,dq,dq,dq,dq,dq,dq,dq]],[IU,IM,IL],m,c,k,g);
fesim = fe(0,[q,q,q,q,q,q,q,q,q],force,l0m,akt);

mmsim = mm(0,[q,q,q,q,q,q,q,q,q],[IU,IM,IL],m);
ddqq = [zeros(1,9),ddq,ddq,ddq,ddq,ddq,ddq,ddq,ddq,ddq]';
torq = mmsim*ddqq-fosim-fesim;