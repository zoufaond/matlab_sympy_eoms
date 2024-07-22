clear all
syms q1 q2 q3
origin = [-2,1,1];
centre = [0,0,0];
insert = R_x(q1)*R_y(q2)*R_z(q3)*position(1,2,3);
insertion = insert(1:3)';
radius = 1;
Lm = simplify(sphere_muscle_length(origin, insertion, centre, radius));
dlm = diff(Lm,q1);
% dlm(2) = diff(Lm,q2);
% dlm(3) = diff(Lm,q3);

matlabFunction(dlm,'file','Lm','vars',{q1,q2,q3});

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