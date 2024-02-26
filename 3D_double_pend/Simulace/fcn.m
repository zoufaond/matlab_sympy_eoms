function xd = fcn(t, x, g,m,s1,s2, IU,IL,c,k,sh_e,T_el,eps,k_contact,cont_P,akt,force,l0m)
l1 = s1(1);
a1 = s1(2);
b1 = s1(3);
l2 = s2(1);
a2 = s2(2);
b2 = s2(3);
[x_cont,y_cont,z_cont] = deal(cont_P(1),cont_P(2),cont_P(3));
[ax,ay,az] = deal(sh_e(1),sh_e(2),sh_e(3));
[mx,my,mz] = deal(T_el(1),T_el(2),T_el(3));
[akt1,akt2,akt3] = deal(akt(1),akt(2),akt(3));
[F_iso1,F_iso2,F_iso3] = deal(force(1),force(2),force(3));
[l0m1,l0m2,l0m3] = deal(l0m(1),l0m(2),l0m(3));

xd = zeros(12,1);

fesim = fe(0,x',force,l0m,akt); %x(1),x(2),x(3),x(4),x(5),x(6)

fosim = fo(0,x',[IU,IL],m,c,k,g);

mmsim = mm(0,x',[IU,IL],m);


R = mmsim\(fosim+fesim);

xd(1) = R(1);
xd(2) = R(2);
xd(3) = R(3);
xd(4) = R(4);
xd(5) = R(5);
xd(6) = R(6);
xd(7) = R(7);
xd(8) = R(8);
xd(9) = R(9);
xd(10) = R(10);
xd(11) = R(11);
xd(12) = R(12);