clear all;clc
elips_pars.a = 3;
elips_pars.b = 2;
A = [-5;3;4];
B = [5;-4;3];
% A = rand(3,1)*2+2;
% B = rand(3,1)*2-3;
Center = [0;0;0];
plane = side_vector(A,B,Center);
elips_pars.m = plane(1);
elips_pars.n = plane(2);
elips_pars.k = plane(3);
vec1 = v1(elips_pars);
vec2 = v2(elips_pars);
T = T_elips_frame(elips_pars);
point = T*A;
T_vec1 = T*vec1;
T_vec2 = T*vec2;
% R_2\vec2(1:2)
theta = 0:0.01:pi/2;
coords = v1(elips_pars)*sin(theta)+v2(elips_pars)*cos(theta);
[x_ax,~,~] = att_frame(A,B,Center);
[tang_p1,tang_p2] = tangent_lines(Center,A,elips_pars);
% R_elips = T_elips_frame(elips_pars)
% R_elips*B

% [Xs,Ys,Zs] = sphere;
% X2 = Xs * elips_pars.a;
% Y2 = Ys * elips_pars.b;
% Z2 = Zs * elips_pars.a;
% centre = [0;0;0];
% hold on
% plot3(coords(1,:),coords(2,:),coords(3,:),"LineWidth",2,"Color","red")
% plot3(coords(1,1),coords(2,1),coords(3,1),"*","MarkerSize",20)
% % plot3(T_vec1(1,1),T_vec1(2,1),T_vec1(3,1),"x","MarkerSize",20)
% % plot3(T_vec2(1,1),T_vec2(2,1),T_vec2(3,1),"o","MarkerSize",20)
% plot3(A(1),A(2),A(3),"o","MarkerSize",10)
% plot3(B(1),B(2),B(3),"x","MarkerSize",10)
% surf(X2+centre(1),Y2+centre(2),Z2+centre(3),"FaceAlpha",0.3)
% % line([Center(1),x_ax(1)],[Center(2),x_ax(2)],[Center(3),x_ax(3)],"LineWidth",2,"Color","green")
% line([A(1),tang_p1(1)],[A(2),tang_p1(2)],[A(3),tang_p1(3)],"LineWidth",2,"Color","green")
% line([A(1),tang_p2(1)],[A(2),tang_p2(2)],[A(3),tang_p2(3)],"LineWidth",2,"Color","blue")
% axis([-5 5 -5 5 -5 5]);
% xlabel('X')
% ylabel('Y')
% zlabel('Z')


function semi_ax1 = v1(elips_pars)
    k = elips_pars.k;
    m = elips_pars.m;
    a = elips_pars.a;
    semi_ax1 = [k*a/sqrt(k^2+m^2);0;-m*a/sqrt(k^2+m^2)];
end

function R = T_elips_frame(elips_pars)
    x_pos = (v1(elips_pars));
    x_vec = x_pos/norm(x_pos);
    
    y_pos = (v2(elips_pars));
    y_vec = y_pos/norm(y_pos);
    
    z_pos = (cross(x_pos,y_pos));
    z_vec = z_pos/norm(z_pos);

    R = [x_vec';y_vec';z_vec'];
end

function semi_ax2 = v2(elips_pars)
    k = elips_pars.k;
    m = elips_pars.m;
    n = elips_pars.n;
    a = elips_pars.a;
    b = elips_pars.b;
    semi_ax2 = [m*n;-m^2-k^2;k*n]/sqrt((m*n/a)^2+((m^2+k^2)/b)^2+(k*n/a)^2);
end

function [x_ax,y_ax,z_ax] = att_frame(origin, insertion, centre)
    side = side_vector(origin,insertion,centre);
    % z_ax = (side-centre)/norm(side-centre);
    z_ax = (side/norm(side));
    y_ax = cross(z_ax,origin-centre)/norm(cross(z_ax,origin-centre));
    x_ax = cross(y_ax,z_ax);
end

function side_vec = side_vector(origin,insertion,centre)
    ins_plane = insertion-centre;
    or_plane = origin-centre;
    side_vec = cross(or_plane,ins_plane);
end

function [point1_W_frame,point2_W_frame] = tangent_lines(center,origin,elips_pars)
    x0 = 0;
    y0 = 0;
    T = T_elips_frame(elips_pars);
    vec1 = v1(elips_pars);
    vec2 = v2(elips_pars);
    b = T*vec1;
    a = T*vec2;
    b = b(2);
    a = a(1);
    % s, c = np.sin(rotation), np.cos(rotation);
    s = sin(pi/2*0);
    c = cos(pi/2*0);
    point = T*origin;
    p0 = point(1);
    q0 = point(2);
    % 
    A = (-a^2*s^2 - b^2*c^2 + (y0-q0)^2);
    B = 2*(c*s*(a^2-b^2) - (x0-p0)*(y0-q0));
    C = (-a^2*c^2 - b^2*s^2 + (x0-p0)^2);
    % 
    m1 = (-B + sqrt(B^2 - 4*A*C))/(2*A);
    m2 = (-B - sqrt(B^2 - 4*A*C))/(2*A);
    k1 = sqrt(a^2*m1^2+b^2);
    k2 = sqrt(a^2*m2^2+b^2);
    point1 = [[a^2*m1;b^2]/k1;0];
    point2 = [[a^2*m2;b^2]/k2;0];
    point1_W_frame = T\point1;
    point2_W_frame = T\point2;
end