clc;clear all
table = readtable('Glenohumeral_muscles.xlsx');
muscles = zeros(1,3);
names = table2array(table(:,1));
f0ms = str2double(table2array(table(:,2)));
opt_lens = str2double(table2array(table(:,3)));
origins = table2array(table(:,5));
origin_coords = coords2arr(table2array(table(:,6)));
insertions = table2array(table(:,7));
insertion_coords = coords2arr(table2array(table(:,8)));


q = sym('q',[1 9]);
dq = sym('dq', [1 9]);
akt = sym('akt',[1 3]);
t = sym('t');
for i = 1:2
    muscle_lens(i) = muscle_length(origins{i},insertions{i},origin_coords(i,:),insertion_coords(i,:),q);
    muscle_forces(i) = muscle_force(muscle_lens(i),-f0ms(i),akt(i),opt_lens(i));
end

fe = [zeros(9,1);jacobian(muscle_lens,q)'*muscle_forces'];
% matlabFunction(fe,'file','fe','vars',{t,[q,dq],akt});
% muscle1_len = muscle_length('Clavicle','Humerus',[-0.002 0.032 0.131],[0.005 -0.104 0.008],q);
% muscle2_len = muscle_length('Scapula','Humerus',[-0.028 -0.005 0.025],[-0.004 -0.058 0.028],q);
% muscle3_len = muscle_length('Thorax','Humerus',[0.042 -0.043 0.081],[0.016 -0.035 0.005],q);
% 
% muscle1_force = muscle_force(muscle1_len,F_iso(1), akt(1), l0m(1));
% muscle2_force = muscle_force(muscle2_len,F_iso(2), akt(2), l0m(2));
% muscle3_force = muscle_force(muscle3_len,F_iso(3), akt(3), l0m(3));
% 
% lengths = [muscle1_len,muscle2_len,muscle3_len];
% forces = [muscle1_force,muscle2_force,muscle3_force]';
% jacs = jacobian(lengths,q)';
% fe = [zeros(9,1);jacobian(lengths,q)'*forces];

% matlabFunction(fe,'file','fe','vars',{t,[q,dq],F_iso,l0m,akt});

function force = muscle_force(length, F_iso, akt, l0m)
    f_gauss = 0.25;
    force = (((length / l0m)^3) * exp(8 * length / l0m - 12.9) + (exp(-(length / l0m - 1)^2 / f_gauss)) * akt) * F_iso;
end

function length = muscle_length(origin, insertion, O_pos, I_pos, q)
    if strcmp(origin, 'Thorax') && strcmp(insertion, 'Clavicle')
        O = position(O_pos(1), O_pos(2), O_pos(3));
        T_t = [0.006325 0.00693 0.025465];
        TT_C = T_x(T_t(1))*T_y(T_t(2))*T_z(T_t(3));
        I = TT_C*R_x(q(1)) * R_y(q(2)) * R_z(q(3)) * position(I_pos(1), I_pos(2), I_pos(3));
        
    elseif strcmp(origin, 'Thorax') && strcmp(insertion, 'Scapula')
        O = position(O_pos(1), O_pos(2), O_pos(3));
        T_t = [0.006325 0.00693 0.025465];
        TT_C = T_x(T_t(1))*T_y(T_t(2))*T_z(T_t(3));
        RW_C = TT_C*R_x(q(1)) * R_y(q(2)) * R_z(q(3));
        TC_S = T_z(-10);
        RC_S = R_x(q(4)) * R_y(q(5)) * R_z(q(6));
        I = RW_C * TC_S * RC_S * position(I_pos(1), I_pos(2), I_pos(3));

    elseif strcmp(origin, 'Clavicle') && strcmp(insertion, 'Scapula')
        O =position(O_pos(1), O_pos(2), O_pos(3));
        TC_S = T_z(-10);
        RC_S = R_x(q(4)) * R_y(q(5)) * R_z(q(6));
        I =TC_S*RC_S * position(I_pos(1), I_pos(2), I_pos(3));

    elseif strcmp(origin, 'Clavicle') && strcmp(insertion, 'Humerus')
        T_c = [-0.01433 0.02007 0.135535];
        T_s = [-0.00955 -0.034 0.009];
        O =position(O_pos(1), O_pos(2), O_pos(3));
        TC_S = T_x(T_c(1))*T_y(T_c(2))*T_z(T_c(3));
        RC_S = R_x(q(4)) * R_y(q(5)) * R_z(q(6));
        TS_H = T_x(T_s(1))*T_y(T_s(2))*T_z(T_s(3));
        RS_H = R_x(q(7)) * R_y(q(8)) * R_z(q(9));
        I =TC_S*RC_S*TS_H*RS_H*position(I_pos(1), I_pos(2), I_pos(3));

    elseif strcmp(origin, 'Scapula') && strcmp(insertion, 'Humerus')
        T_s = [-0.00955 -0.034 0.009];
        O =position(O_pos(1), O_pos(2), O_pos(3));
        TS_H = T_x(T_s(1))*T_y(T_s(2))*T_z(T_s(3));
        RS_H = R_x(q(7)) * R_y(q(8)) * R_z(q(9));
        I =TS_H*RS_H*position(I_pos(1), I_pos(2), I_pos(3));

    elseif strcmp(origin, 'Thorax') && strcmp(insertion, 'Humerus')
        T_c = [-0.01433 0.02007 0.135535];
        T_s = [-0.00955 -0.034 0.009];
        T_t = [0.006325 0.00693 0.025465];
        TT_C = T_x(T_t(1))*T_y(T_t(2))*T_z(T_t(3));
        O =position(O_pos(1), O_pos(2), O_pos(3));
        RT_C = TT_C*R_x(q(1)) * R_y(q(2)) * R_z(q(3));
        TC_S = T_x(T_c(1))*T_y(T_c(2))*T_z(T_c(3));
        RC_S = R_x(q(4)) * R_y(q(5)) * R_z(q(6));
        TS_H = T_x(T_s(1))*T_y(T_s(2))*T_z(T_s(3));
        RS_H = R_x(q(7)) * R_y(q(8)) * R_z(q(9));
        I =RT_C*TC_S*RC_S*TS_H*RS_H*position(I_pos(1), I_pos(2), I_pos(3));

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

function t = coords2arr(coords)
    t = zeros(length(coords),3);
    for i = 1:length(coords)
        t(i,:) = str2num(coords{i});
    end
end