function torq = clvcl_ID(t, q,dq,ddq, g,m, I, com, c, k, akt)

icxx = I(1);
icyy = I(2);
iczz = I(3);
ixy = I(6);
iyz = I(4);
izx = I(5);
comx = com(1);
comy = com(2);
comz = com(3);

x1 = q(1);
x2 = q(2);
x3 = q(3);
x4 = dq(1);
x5 = dq(2);
x6 = dq(3);
c1=c(1);
c2=c(2);
c3=c(3);
k1=k(1);
k2=k(2);
k3=k(3);

% 
mm = [1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 1 0 0 0; 0 0 0 m.*((comx.*sin(x2) - comz.*cos(x2).*cos(x3)).^2 + (-comy.*sin(x2) - comz.*sin(x3).*cos(x2)).^2 + (comx.*sin(x3).*cos(x2) + comy.*cos(x2).*cos(x3)).^2) + (iczz.*sin(x2) - iyz.*sin(x3).*cos(x2) + izx.*cos(x2).*cos(x3)).*sin(x2) + (icxx.*cos(x2).*cos(x3) - ixy.*sin(x3).*cos(x2) + izx.*sin(x2)).*cos(x2).*cos(x3) - (-icyy.*sin(x3).*cos(x2) + ixy.*cos(x2).*cos(x3) + iyz.*sin(x2)).*sin(x3).*cos(x2) m.*(-comz.*(comx.*sin(x2) - comz.*cos(x2).*cos(x3)).*sin(x3) + comz.*(-comy.*sin(x2) - comz.*sin(x3).*cos(x2)).*cos(x3) + (-comx.*cos(x3) + comy.*sin(x3)).*(comx.*sin(x3).*cos(x2) + comy.*cos(x2).*cos(x3))) + (icxx.*cos(x2).*cos(x3) - ixy.*sin(x3).*cos(x2) + izx.*sin(x2)).*sin(x3) + (-icyy.*sin(x3).*cos(x2) + ixy.*cos(x2).*cos(x3) + iyz.*sin(x2)).*cos(x3) iczz.*sin(x2) - iyz.*sin(x3).*cos(x2) + izx.*cos(x2).*cos(x3) + m.*(comx.*(comx.*sin(x2) - comz.*cos(x2).*cos(x3)) - comy.*(-comy.*sin(x2) - comz.*sin(x3).*cos(x2))); 0 0 0 m.*(-comz.*(comx.*sin(x2) - comz.*cos(x2).*cos(x3)).*sin(x3) + comz.*(-comy.*sin(x2) - comz.*sin(x3).*cos(x2)).*cos(x3) + (-comx.*cos(x3) + comy.*sin(x3)).*(comx.*sin(x3).*cos(x2) + comy.*cos(x2).*cos(x3))) + (icxx.*sin(x3) + ixy.*cos(x3)).*cos(x2).*cos(x3) - (icyy.*cos(x3) + ixy.*sin(x3)).*sin(x3).*cos(x2) + (iyz.*cos(x3) + izx.*sin(x3)).*sin(x2) m.*(comz.^2.*sin(x3).^2 + comz.^2.*cos(x3).^2 + (-comx.*cos(x3) + comy.*sin(x3)).^2) + (icxx.*sin(x3) + ixy.*cos(x3)).*sin(x3) + (icyy.*cos(x3) + ixy.*sin(x3)).*cos(x3) iyz.*cos(x3) + izx.*sin(x3) + m.*(-comx.*comz.*sin(x3) - comy.*comz.*cos(x3)); 0 0 0 iczz.*sin(x2) - iyz.*sin(x3).*cos(x2) + izx.*cos(x2).*cos(x3) + m.*(comx.*(comx.*sin(x2) - comz.*cos(x2).*cos(x3)) - comy.*(-comy.*sin(x2) - comz.*sin(x3).*cos(x2))) iyz.*cos(x3) + izx.*sin(x3) + m.*(-comx.*comz.*sin(x3) - comy.*comz.*cos(x3)) iczz + m.*(comx.^2 + comy.^2)];

fo = [x4; x5; x6; -c1.*x4.*cos(x2).*cos(x3) + c2.*x5.*sin(x3).*cos(x2) - c3.*x6.*sin(x2) - g.*m.*(comx.*sin(x2) - comz.*cos(x2).*cos(x3)).*(-sin(x1).*sin(x2).*sin(x3) + cos(x1).*cos(x3)) - g.*m.*(-comy.*sin(x2) - comz.*sin(x3).*cos(x2)).*(sin(x1).*sin(x2).*cos(x3) + sin(x3).*cos(x1)) + g.*m.*(comx.*sin(x3).*cos(x2) + comy.*cos(x2).*cos(x3)).*sin(x1).*cos(x2) - m.*(comx.*sin(x2) - comz.*cos(x2).*cos(x3)).*(comx.*x4.*x5.*cos(x2) - comz.*(-x4.*x5.*sin(x2).*cos(x3) - x4.*x6.*sin(x3).*cos(x2) + x5.*x6.*cos(x3)) - (-comx.*(-x4.*sin(x3).*cos(x2) + x5.*cos(x3)) + comy.*(x4.*cos(x2).*cos(x3) + x5.*sin(x3))).*(x4.*cos(x2).*cos(x3) + x5.*sin(x3)) + (-comy.*(x4.*sin(x2) + x6) + comz.*(-x4.*sin(x3).*cos(x2) + x5.*cos(x3))).*(x4.*sin(x2) + x6)) - m.*(-comy.*sin(x2) - comz.*sin(x3).*cos(x2)).*(-comy.*x4.*x5.*cos(x2) + comz.*(x4.*x5.*sin(x2).*sin(x3) - x4.*x6.*cos(x2).*cos(x3) - x5.*x6.*sin(x3)) - (comx.*(x4.*sin(x2) + x6) - comz.*(x4.*cos(x2).*cos(x3) + x5.*sin(x3))).*(x4.*sin(x2) + x6) + (-comx.*(-x4.*sin(x3).*cos(x2) + x5.*cos(x3)) + comy.*(x4.*cos(x2).*cos(x3) + x5.*sin(x3))).*(-x4.*sin(x3).*cos(x2) + x5.*cos(x3))) - m.*(comx.*sin(x3).*cos(x2) + comy.*cos(x2).*cos(x3)).*(-comx.*(x4.*x5.*sin(x2).*sin(x3) - x4.*x6.*cos(x2).*cos(x3) - x5.*x6.*sin(x3)) + comy.*(-x4.*x5.*sin(x2).*cos(x3) - x4.*x6.*sin(x3).*cos(x2) + x5.*x6.*cos(x3)) + (comx.*(x4.*sin(x2) + x6) - comz.*(x4.*cos(x2).*cos(x3) + x5.*sin(x3))).*(x4.*cos(x2).*cos(x3) + x5.*sin(x3)) - (-comy.*(x4.*sin(x2) + x6) + comz.*(-x4.*sin(x3).*cos(x2) + x5.*cos(x3))).*(-x4.*sin(x3).*cos(x2) + x5.*cos(x3))) - (icxx.*(-x4.*x5.*sin(x2).*cos(x3) - x4.*x6.*sin(x3).*cos(x2) + x5.*x6.*cos(x3)) + ixy.*(x4.*x5.*sin(x2).*sin(x3) - x4.*x6.*cos(x2).*cos(x3) - x5.*x6.*sin(x3)) + izx.*x4.*x5.*cos(x2) - (x4.*sin(x2) + x6).*(icyy.*(-x4.*sin(x3).*cos(x2) + x5.*cos(x3)) + ixy.*(x4.*cos(x2).*cos(x3) + x5.*sin(x3)) + iyz.*(x4.*sin(x2) + x6)) + (-x4.*sin(x3).*cos(x2) + x5.*cos(x3)).*(iczz.*(x4.*sin(x2) + x6) + iyz.*(-x4.*sin(x3).*cos(x2) + x5.*cos(x3)) + izx.*(x4.*cos(x2).*cos(x3) + x5.*sin(x3)))).*cos(x2).*cos(x3) + (icyy.*(x4.*x5.*sin(x2).*sin(x3) - x4.*x6.*cos(x2).*cos(x3) - x5.*x6.*sin(x3)) + ixy.*(-x4.*x5.*sin(x2).*cos(x3) - x4.*x6.*sin(x3).*cos(x2) + x5.*x6.*cos(x3)) + iyz.*x4.*x5.*cos(x2) + (x4.*sin(x2) + x6).*(icxx.*(x4.*cos(x2).*cos(x3) + x5.*sin(x3)) + ixy.*(-x4.*sin(x3).*cos(x2) + x5.*cos(x3)) + izx.*(x4.*sin(x2) + x6)) - (x4.*cos(x2).*cos(x3) + x5.*sin(x3)).*(iczz.*(x4.*sin(x2) + x6) + iyz.*(-x4.*sin(x3).*cos(x2) + x5.*cos(x3)) + izx.*(x4.*cos(x2).*cos(x3) + x5.*sin(x3)))).*sin(x3).*cos(x2) - (iczz.*x4.*x5.*cos(x2) + iyz.*(x4.*x5.*sin(x2).*sin(x3) - x4.*x6.*cos(x2).*cos(x3) - x5.*x6.*sin(x3)) + izx.*(-x4.*x5.*sin(x2).*cos(x3) - x4.*x6.*sin(x3).*cos(x2) + x5.*x6.*cos(x3)) - (-x4.*sin(x3).*cos(x2) + x5.*cos(x3)).*(icxx.*(x4.*cos(x2).*cos(x3) + x5.*sin(x3)) + ixy.*(-x4.*sin(x3).*cos(x2) + x5.*cos(x3)) + izx.*(x4.*sin(x2) + x6)) + (x4.*cos(x2).*cos(x3) + x5.*sin(x3)).*(icyy.*(-x4.*sin(x3).*cos(x2) + x5.*cos(x3)) + ixy.*(x4.*cos(x2).*cos(x3) + x5.*sin(x3)) + iyz.*(x4.*sin(x2) + x6))).*sin(x2); -c1.*x4.*sin(x3) - c2.*x5.*cos(x3) + comz.*g.*m.*(-sin(x1).*sin(x2).*sin(x3) + cos(x1).*cos(x3)).*sin(x3) - comz.*g.*m.*(sin(x1).*sin(x2).*cos(x3) + sin(x3).*cos(x1)).*cos(x3) + comz.*m.*(comx.*x4.*x5.*cos(x2) - comz.*(-x4.*x5.*sin(x2).*cos(x3) - x4.*x6.*sin(x3).*cos(x2) + x5.*x6.*cos(x3)) - (-comx.*(-x4.*sin(x3).*cos(x2) + x5.*cos(x3)) + comy.*(x4.*cos(x2).*cos(x3) + x5.*sin(x3))).*(x4.*cos(x2).*cos(x3) + x5.*sin(x3)) + (-comy.*(x4.*sin(x2) + x6) + comz.*(-x4.*sin(x3).*cos(x2) + x5.*cos(x3))).*(x4.*sin(x2) + x6)).*sin(x3) - comz.*m.*(-comy.*x4.*x5.*cos(x2) + comz.*(x4.*x5.*sin(x2).*sin(x3) - x4.*x6.*cos(x2).*cos(x3) - x5.*x6.*sin(x3)) - (comx.*(x4.*sin(x2) + x6) - comz.*(x4.*cos(x2).*cos(x3) + x5.*sin(x3))).*(x4.*sin(x2) + x6) + (-comx.*(-x4.*sin(x3).*cos(x2) + x5.*cos(x3)) + comy.*(x4.*cos(x2).*cos(x3) + x5.*sin(x3))).*(-x4.*sin(x3).*cos(x2) + x5.*cos(x3))).*cos(x3) + g.*m.*(-comx.*cos(x3) + comy.*sin(x3)).*sin(x1).*cos(x2) - m.*(-comx.*cos(x3) + comy.*sin(x3)).*(-comx.*(x4.*x5.*sin(x2).*sin(x3) - x4.*x6.*cos(x2).*cos(x3) - x5.*x6.*sin(x3)) + comy.*(-x4.*x5.*sin(x2).*cos(x3) - x4.*x6.*sin(x3).*cos(x2) + x5.*x6.*cos(x3)) + (comx.*(x4.*sin(x2) + x6) - comz.*(x4.*cos(x2).*cos(x3) + x5.*sin(x3))).*(x4.*cos(x2).*cos(x3) + x5.*sin(x3)) - (-comy.*(x4.*sin(x2) + x6) + comz.*(-x4.*sin(x3).*cos(x2) + x5.*cos(x3))).*(-x4.*sin(x3).*cos(x2) + x5.*cos(x3))) - (icxx.*(-x4.*x5.*sin(x2).*cos(x3) - x4.*x6.*sin(x3).*cos(x2) + x5.*x6.*cos(x3)) + ixy.*(x4.*x5.*sin(x2).*sin(x3) - x4.*x6.*cos(x2).*cos(x3) - x5.*x6.*sin(x3)) + izx.*x4.*x5.*cos(x2) - (x4.*sin(x2) + x6).*(icyy.*(-x4.*sin(x3).*cos(x2) + x5.*cos(x3)) + ixy.*(x4.*cos(x2).*cos(x3) + x5.*sin(x3)) + iyz.*(x4.*sin(x2) + x6)) + (-x4.*sin(x3).*cos(x2) + x5.*cos(x3)).*(iczz.*(x4.*sin(x2) + x6) + iyz.*(-x4.*sin(x3).*cos(x2) + x5.*cos(x3)) + izx.*(x4.*cos(x2).*cos(x3) + x5.*sin(x3)))).*sin(x3) - (icyy.*(x4.*x5.*sin(x2).*sin(x3) - x4.*x6.*cos(x2).*cos(x3) - x5.*x6.*sin(x3)) + ixy.*(-x4.*x5.*sin(x2).*cos(x3) - x4.*x6.*sin(x3).*cos(x2) + x5.*x6.*cos(x3)) + iyz.*x4.*x5.*cos(x2) + (x4.*sin(x2) + x6).*(icxx.*(x4.*cos(x2).*cos(x3) + x5.*sin(x3)) + ixy.*(-x4.*sin(x3).*cos(x2) + x5.*cos(x3)) + izx.*(x4.*sin(x2) + x6)) - (x4.*cos(x2).*cos(x3) + x5.*sin(x3)).*(iczz.*(x4.*sin(x2) + x6) + iyz.*(-x4.*sin(x3).*cos(x2) + x5.*cos(x3)) + izx.*(x4.*cos(x2).*cos(x3) + x5.*sin(x3)))).*cos(x3); -c3.*x6 - comx.*g.*m.*(-sin(x1).*sin(x2).*sin(x3) + cos(x1).*cos(x3)) - comx.*m.*(comx.*x4.*x5.*cos(x2) - comz.*(-x4.*x5.*sin(x2).*cos(x3) - x4.*x6.*sin(x3).*cos(x2) + x5.*x6.*cos(x3)) - (-comx.*(-x4.*sin(x3).*cos(x2) + x5.*cos(x3)) + comy.*(x4.*cos(x2).*cos(x3) + x5.*sin(x3))).*(x4.*cos(x2).*cos(x3) + x5.*sin(x3)) + (-comy.*(x4.*sin(x2) + x6) + comz.*(-x4.*sin(x3).*cos(x2) + x5.*cos(x3))).*(x4.*sin(x2) + x6)) + comy.*g.*m.*(sin(x1).*sin(x2).*cos(x3) + sin(x3).*cos(x1)) + comy.*m.*(-comy.*x4.*x5.*cos(x2) + comz.*(x4.*x5.*sin(x2).*sin(x3) - x4.*x6.*cos(x2).*cos(x3) - x5.*x6.*sin(x3)) - (comx.*(x4.*sin(x2) + x6) - comz.*(x4.*cos(x2).*cos(x3) + x5.*sin(x3))).*(x4.*sin(x2) + x6) + (-comx.*(-x4.*sin(x3).*cos(x2) + x5.*cos(x3)) + comy.*(x4.*cos(x2).*cos(x3) + x5.*sin(x3))).*(-x4.*sin(x3).*cos(x2) + x5.*cos(x3))) - iczz.*x4.*x5.*cos(x2) - iyz.*(x4.*x5.*sin(x2).*sin(x3) - x4.*x6.*cos(x2).*cos(x3) - x5.*x6.*sin(x3)) - izx.*(-x4.*x5.*sin(x2).*cos(x3) - x4.*x6.*sin(x3).*cos(x2) + x5.*x6.*cos(x3)) + (-x4.*sin(x3).*cos(x2) + x5.*cos(x3)).*(icxx.*(x4.*cos(x2).*cos(x3) + x5.*sin(x3)) + ixy.*(-x4.*sin(x3).*cos(x2) + x5.*cos(x3)) + izx.*(x4.*sin(x2) + x6)) - (x4.*cos(x2).*cos(x3) + x5.*sin(x3)).*(icyy.*(-x4.*sin(x3).*cos(x2) + x5.*cos(x3)) + ixy.*(x4.*cos(x2).*cos(x3) + x5.*sin(x3)) + iyz.*(x4.*sin(x2) + x6))];

% fe = [
%                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  0;
%                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  0;
%                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  0;
%                                                                            0.1*((-1.0*sin(q1)*sin(q3) + sin(q2)*cos(q1)*cos(q3) + 2*cos(q1)*cos(q2))*(0.5*sin(q1)*sin(q2)*cos(q3) + sin(q1)*cos(q2) + 0.5*sin(q3)*cos(q1) + 1)/2 + (sin(q1)*sin(q2)*cos(q3) + 2*sin(q1)*cos(q2) + sin(q3)*cos(q1))*(0.5*sin(q1)*sin(q3) - 0.5*sin(q2)*cos(q1)*cos(q3) - cos(q1)*cos(q2) + 1)/2)/sqrt((-sin(q2) + 0.5*cos(q2)*cos(q3) - 0.5)^2 + (0.5*sin(q1)*sin(q3) - 0.5*sin(q2)*cos(q1)*cos(q3) - cos(q1)*cos(q2) + 1)^2 + (0.5*sin(q1)*sin(q2)*cos(q3) + sin(q1)*cos(q2) + 0.5*sin(q3)*cos(q1) + 1)^2) + 0.1*((0.2*sin(q1)*sin(q3) - 0.2*sin(q2)*cos(q1)*cos(q3) + 2*cos(q1)*cos(q2))*(-0.1*sin(q1)*sin(q2)*cos(q3) + sin(q1)*cos(q2) - 0.1*sin(q3)*cos(q1) + 1)/2 + (-0.2*sin(q1)*sin(q2)*cos(q3) + 2*sin(q1)*cos(q2) - 0.2*sin(q3)*cos(q1))*(-0.1*sin(q1)*sin(q3) + 0.1*sin(q2)*cos(q1)*cos(q3) - cos(q1)*cos(q2) + 1)/2)/sqrt((-sin(q2) - 0.1*cos(q2)*cos(q3) + 0.1)^2 + (-0.1*sin(q1)*sin(q3) + 0.1*sin(q2)*cos(q1)*cos(q3) - cos(q1)*cos(q2) + 1)^2 + (-0.1*sin(q1)*sin(q2)*cos(q3) + sin(q1)*cos(q2) - 0.1*sin(q3)*cos(q1) + 1)^2);
% 0.1*((-2*sin(q1)*sin(q2) - 0.2*sin(q1)*cos(q2)*cos(q3))*(-0.1*sin(q1)*sin(q2)*cos(q3) + sin(q1)*cos(q2) - 0.1*sin(q3)*cos(q1) + 1)/2 + (2*sin(q2)*cos(q1) + 0.2*cos(q1)*cos(q2)*cos(q3))*(-0.1*sin(q1)*sin(q3) + 0.1*sin(q2)*cos(q1)*cos(q3) - cos(q1)*cos(q2) + 1)/2 + (0.2*sin(q2)*cos(q3) - 2*cos(q2))*(-sin(q2) - 0.1*cos(q2)*cos(q3) + 0.1)/2)/sqrt((-sin(q2) - 0.1*cos(q2)*cos(q3) + 0.1)^2 + (-0.1*sin(q1)*sin(q3) + 0.1*sin(q2)*cos(q1)*cos(q3) - cos(q1)*cos(q2) + 1)^2 + (-0.1*sin(q1)*sin(q2)*cos(q3) + sin(q1)*cos(q2) - 0.1*sin(q3)*cos(q1) + 1)^2) + 0.1*((-2*sin(q1)*sin(q2) + sin(q1)*cos(q2)*cos(q3))*(0.5*sin(q1)*sin(q2)*cos(q3) + sin(q1)*cos(q2) + 0.5*sin(q3)*cos(q1) + 1)/2 + (2*sin(q2)*cos(q1) - 1.0*cos(q1)*cos(q2)*cos(q3))*(0.5*sin(q1)*sin(q3) - 0.5*sin(q2)*cos(q1)*cos(q3) - cos(q1)*cos(q2) + 1)/2 + (-1.0*sin(q2)*cos(q3) - 2*cos(q2))*(-sin(q2) + 0.5*cos(q2)*cos(q3) - 0.5)/2)/sqrt((-sin(q2) + 0.5*cos(q2)*cos(q3) - 0.5)^2 + (0.5*sin(q1)*sin(q3) - 0.5*sin(q2)*cos(q1)*cos(q3) - cos(q1)*cos(q2) + 1)^2 + (0.5*sin(q1)*sin(q2)*cos(q3) + sin(q1)*cos(q2) + 0.5*sin(q3)*cos(q1) + 1)^2);
%                                  0.1*((-0.2*sin(q1)*cos(q3) - 0.2*sin(q2)*sin(q3)*cos(q1))*(-0.1*sin(q1)*sin(q3) + 0.1*sin(q2)*cos(q1)*cos(q3) - cos(q1)*cos(q2) + 1)/2 + (0.2*sin(q1)*sin(q2)*sin(q3) - 0.2*cos(q1)*cos(q3))*(-0.1*sin(q1)*sin(q2)*cos(q3) + sin(q1)*cos(q2) - 0.1*sin(q3)*cos(q1) + 1)/2 + 0.1*(-sin(q2) - 0.1*cos(q2)*cos(q3) + 0.1)*sin(q3)*cos(q2))/sqrt((-sin(q2) - 0.1*cos(q2)*cos(q3) + 0.1)^2 + (-0.1*sin(q1)*sin(q3) + 0.1*sin(q2)*cos(q1)*cos(q3) - cos(q1)*cos(q2) + 1)^2 + (-0.1*sin(q1)*sin(q2)*cos(q3) + sin(q1)*cos(q2) - 0.1*sin(q3)*cos(q1) + 1)^2) + 0.1*((sin(q1)*cos(q3) + sin(q2)*sin(q3)*cos(q1))*(0.5*sin(q1)*sin(q3) - 0.5*sin(q2)*cos(q1)*cos(q3) - cos(q1)*cos(q2) + 1)/2 + (-1.0*sin(q1)*sin(q2)*sin(q3) + cos(q1)*cos(q3))*(0.5*sin(q1)*sin(q2)*cos(q3) + sin(q1)*cos(q2) + 0.5*sin(q3)*cos(q1) + 1)/2 - 0.5*(-sin(q2) + 0.5*cos(q2)*cos(q3) - 0.5)*sin(q3)*cos(q2))/sqrt((-sin(q2) + 0.5*cos(q2)*cos(q3) - 0.5)^2 + (0.5*sin(q1)*sin(q3) - 0.5*sin(q2)*cos(q1)*cos(q3) - cos(q1)*cos(q2) + 1)^2 + (0.5*sin(q1)*sin(q2)*cos(q3) + sin(q1)*cos(q2) + 0.5*sin(q3)*cos(q1) + 1)^2)];
% 

ddqq = [0;0;0;ddq(1);ddq(2);ddq(3)];
torq = mm*ddqq-fo;