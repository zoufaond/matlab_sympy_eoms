addpath("Functions\")
q = sym('q',[6 1]);

angles = coords_to_XYZ(q);
matlabFunction(angles,'file','XYZ_angles','vars',{q});
