syms t x1 x2 x3 x4 x5 x6 x7 x8 x9 c_m s_m h_m cixx ciyy cizz cixy ciyz cizx sixx siyy sizz sixy siyz sizx hixx hiyy hizz hixy hiyz hizx T_cx T_cy T_cz T_sx T_sy T_sz ccomx ccomy ccomz scomx scomy scomz hcomx hcomy hcomz
q = [x1,x2,x3,x4,x5,x6,x7,x8,x9];
m = [c_m,s_m,h_m];
Ic = [cixx, ciyy, cizz, cixy, ciyz, cizx];
Is = [sixx, siyy, sizz, sixy, siyz, sizx];
Ih = [hixx, hiyy, hizz, hixy, hiyz, hizx];
ccom = [ccomx, ccomy, ccomz];
scom = [scomx, scomy, scomz];
hcom = [hcomx, hcomy, hcomz];
T_c = [T_cx,T_cy,T_cz];
T_s = [T_sx,T_sy,T_sz];

% vzorce z https://colab.research.google.com/drive/13ojY-aWEMXYoFUJRt8fr1WP0Z2mWlCNu#scrollTo=gMq-hb7mfPfT
matlabFunction(mm,'file','mm','vars',{t,q,m,Ic,Is,Ih,ccom,scom,hcom,T_c,T_s});