clear all
insertion = [-3,-3,-1];
origin = [-2.5,0,0.5];
centre = [-1,0,0];
radius = 1.5;
wrap1 = wrap_point(origin,insertion,centre,radius)
h1 = plot3([origin(1),wrap1(1)],[origin(2),wrap1(2)],[origin(3),wrap1(3)], 'LineWidth', 2);
hold on
wrap2 = wrap_point(insertion,origin,centre,radius)
h2 = plot3([insertion(1),wrap2(1)],[insertion(2),wrap2(2)],[insertion(3),wrap2(3)], 'LineWidth', 2);
axis([-3 3 -3 3 -3 3]);
xlabel('X')
ylabel('Y')
zlabel('Z')
for t = 0:pi/50:2*pi
    insertion = [-3,sin(t)*1.5,cos(t)*1.5];
    origin = [3,cos(t)*1.5,cos(t)*1];
    centre = [0,0,0];
    % [x,y,z] = att_frame(origin, insertion, centre);
    % world_to_local(origin,insertion,centre)
    % R = [x;y;z];
    wrap1 = wrap_point(origin,insertion,centre,radius);
    wrap2 = wrap_point(insertion,origin,centre,radius);
    % wr1 = line(,,,'LineWidth',2);
    % wr2 = line([insertion(1),wrap2(1)],[insertion(2),wrap2(2)],,'LineWidth',2);
    angle = cosine_angle(origin,insertion,centre,radius);
    if angle > 0
        set(h1, 'XData', [origin(1),wrap1(1)], 'YData', [origin(2),wrap1(2)], 'ZData', [origin(3),wrap1(3)],"Color","red","LineWidth",2);
        set(h2, 'XData', [insertion(1),wrap2(1)], 'YData', [insertion(2),wrap2(2)], 'ZData', [insertion(3),wrap2(3)]);
    else
        set(h1, 'XData', [origin(1),insertion(1)], 'YData', [origin(2),insertion(2)], 'ZData', [origin(3),insertion(3)],"Color","red","LineWidth",2);
        set(h2, 'XData', [origin(1),insertion(1)], 'YData', [origin(2),insertion(2)], 'ZData', [origin(3),insertion(3)],"Color","red","LineWidth",2);
    end
    [Xs,Ys,Zs] = sphere;
    hold on
    X2 = Xs * radius;
    Y2 = Ys * radius;
    Z2 = Zs * radius;
    surf(X2+centre(1),Y2+centre(2),Z2+centre(3))
    % set(h, 'XData', [P1(1) P(1)], 'YData', [P1(2) P(2)], 'ZData', [P1(3) P(3)]);
    
    pause(0.2)
end
% ang = cosine_angle(origin, insertion, centre)

% plot3(origin(1),origin(2),origin(3),'*',insertion(1),insertion(2),insertion(3),'o',wrap(1),wrap(2),wrap(3),'-s')
% hold on
% line([origin(1),wrap1(1)],[origin(2),wrap1(2)],[origin(3),wrap1(3)],'LineWidth',2)
% line([insertion(1),wrap2(1)],[insertion(2),wrap2(2)],[insertion(3),wrap2(3)],'LineWidth',2)
% [Xs,Ys,Zs] = sphere;
% hold on
% r = 1;
% X2 = Xs * r;
% Y2 = Ys * r;
% Z2 = Zs * r;
% surf(X2+centre(1),Y2+centre(2),Z2+centre(3))
% axis equal


function angle = cosine_angle(origin, insertion, centre, radius)
    [frame,~,~] = att_frame(origin,insertion,centre);
    wrap1 = wrap_point(origin,insertion,centre,radius);
    wrap2 = wrap_point(insertion,origin,centre,radius);
    mag1 = sqrt(sum(wrap1.^2));
    mag2 = sqrt(sum(wrap2.^2));
    mag_frame = sqrt(sum(frame.^2));
    cosine1 = 180/pi*acos(dot(frame,wrap1)/(mag1*mag_frame));
    cosine2 = 180/pi*acos(dot(frame,wrap2)/(mag2*mag_frame));
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

function rot_phiz = R_z(phiz)
    rot_phiz = [cos(phiz),-sin(phiz),0,0;
                sin(phiz), cos(phiz),0,0;
                0           ,0      ,1,0
                0           ,0       0,1];
end

function r = position(x,y,z)
    r = [x;y;z;1];
end

function len = muscle_length_wrap(origin,insertion,centre,radius)
    wrap_len = wrap_angle(origin,insertion,centre,radius)*radius;
    I_pos = wrap_point(insertion,centre,radius,1);
    O_pos = wrap_point(origin,centre,radius,-1);
    O_len = vec_dist(O_pos,origin);
    I_len = vec_dist(I_pos,insertion);
    len = wrap_len+O_len+I_len;
end

function len = vec_dist(O,I)
    len = sqrt((O(1) - I(1))^2 + (O(2) - I(2))^2);
end

function angle = wrap_angle(origin,insertion,centre,radius)
    O_pos = wrap_point(origin,centre,radius,-1);
    I_pos = wrap_point(insertion,centre,radius,1);
    angle =  atan2(O_pos(2)-centre(2),O_pos(1)-centre(1))-atan2(I_pos(2)-centre(2),I_pos(1)-centre(1));
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