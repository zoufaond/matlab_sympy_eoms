function xd = fun_moje(t, x, m, l, g, k)
%function xd = state_derivatives(t, x, m, l, g)
% Returns the derivatives of the states as a function of the current state
% and time.
%
% Parameters
% ----------
% t : double
%   Current time.
% x : vector, (4, 1)
%   Current state.
% m : double
%   The mass of each particle.
% l : double
%   Length of each link.
% g : double
%   Acceleratoin due to gravity.
%
% Returns
% -------
% xd : matrix, 4 x 1
%   The derivatives of the states in this order [q1, q2, u1, u2].

% Unpack the variables so that you can use the sympy equations as is.
q1 = x(1);
q2 = x(2);
u1 = x(3);
u2 = x(4);

% Initialize a vector for the derivatives.
xd = zeros(4, 1);

mm = [
1, 0,        0,        0;
0, 1,        0,        0;
0, 0, l^2*m/4,        0;
0, 0,        0, l^2*m/4];

fo = [
              u1;
              u2;
-g*l*m*cos(q1)/2;
-g*l*m*cos(q2)/2];

fe = [
                                                                         0;
                                                                         0;
 -k*(5*(5*sin(q1) - 5*sin(q2))*cos(q1) - 5*(5*cos(q1) - 5*cos(q2))*sin(q1));
-k*(-5*(5*sin(q1) - 5*sin(q2))*cos(q2) + 5*(5*cos(q1) - 5*cos(q2))*sin(q2))];

R = mm\(fo+fe);

xd(1) = R(1);
xd(2) = R(2);
xd(3) = R(3);
xd(4) = R(4);