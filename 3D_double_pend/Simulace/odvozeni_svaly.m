clc;clear all

q = sym('q',[1 6]);
dq = sym('dq', [1 6]);
F_iso = sym('F_iso',[1 3]);
l0m = sym('l0m', [1 3]);
akt = sym('akt',[1 3]);
t = sym('t');
muscle1_len = muscle_length('Thorax','Clavicle',[-10, 12, 0],[1, 1, -10],q);
muscle2_len = muscle_length('Thorax','Scapula',[-10, 12, 0],[-1, 1, -10],q);
muscle3_len = muscle_length('Clavicle','Scapula',[-4, 5, 0],[1,-6,3],q);

muscle1_force = muscle_force(muscle1_len,F_iso(1), akt(1), l0m(1));
muscle2_force = muscle_force(muscle2_len,F_iso(2), akt(2), l0m(2));
muscle3_force = muscle_force(muscle3_len,F_iso(3), akt(3), l0m(3));

lengths = [muscle1_len,muscle2_len,muscle3_len];
forces = [muscle1_force,muscle2_force,muscle3_force]';
fe = [zeros(6,1);jacobian(lengths,q)'*forces];

matlabFunction(fe,'file','fe','vars',{t,[q,dq],F_iso,l0m,akt});

function force = muscle_force(length, F_iso, akt, l0m)
    f_gauss = 0.25;
    force = (((length / l0m)^3) * exp(8 * length / l0m - 12.9) + (exp(-(length / l0m - 1)^2 / f_gauss)) * akt) * F_iso;
end

function length = muscle_length(origin, insertion, O_pos, I_pos, q)
    if strcmp(origin, 'Thorax') && strcmp(insertion, 'Clavicle')
        O = position(O_pos(1), O_pos(2), O_pos(3));
        I = R_x(q(1)) * R_y(q(2)) * R_z(q(3)) * position(I_pos(1), I_pos(2), I_pos(3));
        
    elseif strcmp(origin, 'Thorax') && strcmp(insertion, 'Scapula')
        O = position(O_pos(1), O_pos(2), O_pos(3));
        RW_C = R_x(q(1)) * R_y(q(2)) * R_z(q(3));
        TC_S = T_z(-10);
        RC_S = R_x(q(4)) * R_y(q(5)) * R_z(q(6));
        I = RW_C * TC_S * RC_S * position(I_pos(1), I_pos(2), I_pos(3));

    elseif strcmp(origin, 'Clavicle') && strcmp(insertion, 'Scapula')
        O =position(O_pos(1), O_pos(2), O_pos(3));
        TC_S = T_z(-10);
        RC_S = R_x(q(4)) * R_y(q(5)) * R_z(q(6));
        I =TC_S*RC_S * position(I_pos(1), I_pos(2), I_pos(3));
    end

    length = sqrt((O(1) - I(1))^2 + (O(2) - I(2))^2 + (O(3) - I(3))^2);
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
                0           ,0      ,1,0;
                0           ,0      ,0,1];
end

function r = position(x,y,z)
    r = [x;y;z;1];
end