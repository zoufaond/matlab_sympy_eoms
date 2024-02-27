
% Glenohumeral = readmatrix('Glenohumeral_muscles.xlsx');
% Glenohumeral_F0M = Glenohumeral(2:end,2);
% Glenohumeral_l0  = Glenohumeral(2:end,3);
% Scapulothoracic = readmatrix('Scapulothoracic_muscles.xlsx');
% Scapulothoracic_F0M = -Scapulothoracic(2:end,2);
% Scapulothoracic_l0  = Scapulothoracic(2:end,3);

%real konstanty
konst = 1;
cI = [5.75482e-05, 6.05521e-05, 1.05345e-05,-1.27405e-05, 1.65861e-05, 4.50136e-06];
ccom = [-0.0110972, 0.00637508, 0.0541825];
sI = [0.00020065, 0.000202939, 0.000227237,-4.55661e-05, -7.53511e-05, -7.42694e-05];
scom = [-0.0512948, -0.0367122, -0.0430756];
hI = [0.00326632, 4.34807e-05, 0.00325004,-0.000136456, -1.30958e-06, -1.14964e-05];
hcom = [0.000389382, -0.116338, -0.00231072];
m = [0.0370005,0.12759,0.26363];
T_c = [-0.01433 0.02007 0.135535];
T_s = [-0.00955 -0.034 0.009];
c = 1e-3;
k = 0;
g = 9.8066;

p = [c,k,g];