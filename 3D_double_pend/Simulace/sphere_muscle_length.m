clear all
syms q1 q2 q3
origin = [-2,1,1];
centre = [0,0,0];
insert = R_x(q1)*R_y(q2)*R_z(q3)*position(1,2,3);
insertion = insert(1:3)';
radius = 1;
Lm = (muscle_length(origin, insertion, centre, radius));
dlm1 = diff(Lm,q1);
dlm2 = diff(Lm,q2);
dlm3 = diff(Lm,q3);



function length = muscle_length(origin, insertion,centre,radius)
    O_wrap = wrap_point(origin,insertion,centre,radius);
    O_wrap_length = two_points_dist(origin,O_wrap);
    I_wrap = wrap_point(insertion,origin,centre,radius);
    I_wrap_length = two_points_dist(insertion, I_wrap);
    wrap_length = wrap_angle(origin, insertion, centre, radius)*radius;
    length = O_wrap_length + I_wrap_length + wrap_length;
end

function dist = two_points_dist(A,B)
    dist = sqrt((A(1)-B(1))^2 + (A(2)-B(2))^2 + (A(3)-B(3))^2);
end

function angle = wrap_angle(origin, insertion, centre, radius)
    [frame,~,~] = att_frame(origin,insertion,centre);
    wrap1 = wrap_point(origin,insertion,centre,radius);
    wrap2 = wrap_point(insertion,origin,centre,radius);
    mag1 = sqrt(sum(wrap1.^2));
    mag2 = sqrt(sum(wrap2.^2));
    mag_frame = sqrt(sum(frame.^2));
    cosine1 = acos(dot(frame,wrap1)/(mag1*mag_frame));
    cosine2 = acos(dot(frame,wrap2)/(mag2*mag_frame));
    angle = cosine2-cosine1;
end

function trans_x = T_x(x)
    trans_x = [1,0,0,x;
               0,1,0,0;
               0,0,1,0;
               0,0,0,1];
end

function trans_y = T_y(y)
    trans_y = [1,0,0,0;
               0,1,0,y;
               0,0,1,0;
               0,0,0,1];
end

function trans_z = T_z(z)
    trans_z = [1,0,0,0;
               0,1,0,0;
               0,0,1,z;
               0,0,0,1];
end

function rot_phix = R_x(phix)
    rot_phix = [1,0        , 0        ,0;
                0,cos(phix),-sin(phix),0;
                0,sin(phix), cos(phix),0;
                0,0        , 0        ,1];
end

function rot_phiy = R_y(phiy)
    rot_phiy = [cos(phiy),0,sin(phiy),0;
                0        ,1,0        ,0;
               -sin(phiy),0,cos(phiy),0;
                0        ,0,0        ,1];
end

function rot_phiz = R_z(phiz)
    rot_phiz = [cos(phiz),-sin(phiz),0,0;
                sin(phiz), cos(phiz),0,0;
                0           ,0      ,1,0
                0           ,0       0,1];
end

function r = position(x,y,z)
    r = [x;y;z;1];
end

function pos = wrap_point(origin,insertion,centre,radius)
    [x_att,y_att,z_att] = att_frame(origin, insertion, centre);
    base = norm(origin-centre);
    x = radius^2/base;
    y = sqrt(radius^2-x^2);
    RotMat = [x_att,0;y_att,0;z_att,0;0,0,0,1];
    pos = T_x(centre(1))*T_y(centre(2))*T_z(centre(3))*inv(RotMat)*position(x,y,0);
    pos = pos(1:3);
end

function [x_ax,y_ax,z_ax] = att_frame(origin, insertion, centre)
    side = side_vector(origin,insertion,centre);
    z_ax = (side/norm(side));
    y_ax = cross(z_ax,origin-centre)/norm(cross(z_ax,origin-centre));
    x_ax = cross(y_ax,z_ax);
end

function side_vec = side_vector(origin,insertion,centre)
    ins_plane = insertion-centre;
    or_plane = origin-centre;
    side_vec = cross(or_plane,ins_plane);
end

function trans_x = T_x2D(x)
    trans_x = [1,0,x;
               0,1,0;
               0,0,1];
end

function trans_y = T_y2D(y)
    trans_y = [1,0,0;
               0,1,y;
               0,0,1];
end


function rot_phiz = R_z2D(phiz)
    rot_phiz = [cos(phiz),-sin(phiz),0;
                sin(phiz), cos(phiz),0;
                0           ,0      ,1];
end