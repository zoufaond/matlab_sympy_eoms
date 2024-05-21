clear all;clc
elips_pars.a = 3;
elips_pars.b = 2;
A = [5;1;0];
B = [-5;0;0];
Center = [0;0;0];
plane = side_vector(A,B,Center);
elips_pars.m = plane(1);
elips_pars.n = plane(2);
elips_pars.k = plane(3);
% v1(elips_pars)
% v2(elips_pars)
theta = 0:0.01:2*pi;
coords = v1(elips_pars)*sin(theta)+v2(elips_pars)*cos(theta);
[x_ax,~,~] = att_frame(A,B,Center);
ss = tangent_lines(Center,A,elips_pars)
% R_elips = T_elips_frame(elips_pars);
% R_elips*B

[Xs,Ys,Zs] = sphere;
X2 = Xs * elips_pars.a;
Y2 = Ys * elips_pars.b;
Z2 = Zs * elips_pars.a;
centre = [0;0;0];
hold on
plot3(coords(1,:),coords(2,:),coords(3,:),"LineWidth",2,"Color","red")
plot3(coords(1,1),coords(2,1),coords(3,1),"*","MarkerSize",20)
plot3(A(1),A(2),A(3),"o","MarkerSize",10)
plot3(B(1),B(2),B(3),"x","MarkerSize",10)
surf(X2+centre(1),Y2+centre(2),Z2+centre(3),"FaceAlpha",0.3)
line([Center(1),x_ax(1)],[Center(2),x_ax(2)],[Center(3),x_ax(3)],"LineWidth",2,"Color","green")
axis([-5 5 -5 5 -5 5]);
xlabel('X')
ylabel('Y')
zlabel('Z')


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

function point1 = tangent_lines(center,origin,elips_pars)
    x0 = 0;
    y0 = 0;
    a = norm(v2(elips_pars));
    b = norm(v1(elips_pars));
    % s, c = np.sin(rotation), np.cos(rotation);
    s = sin(0);
    c = cos(0);
    point = T_elips_frame(elips_pars)*origin;
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
    point1 = [-a^2*m1;-b^2]/k1;
end