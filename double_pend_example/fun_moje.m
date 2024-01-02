function xd = fun_moje(t, x, m, l, g, c1, c2, k1, k2)
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
% Calculate the derivatives of the states. These equations can be copied
% directly from the sympy output but be sure to print with `mprint` in
% sympy.physics.mechanics to remove the `(t)` and use Matlab's find and
% replace and regular expressions to change the python `^` to the matlab
% `^`.
% xd(1) = u1;
% xd(2) = u2;
% xd(3) =  2*(g*cos(q1 + 2*q2) - 2*g*cos(q1) + l*u1^2*sin(q2) + l*u1^2*sin(2*q2) + 2*l*u1*u2*sin(q2) + l*u2^2*sin(q2))/(l*(3 - 2*cos(2*q2)));
% xd(4) = 2*(2*(g*cos(q1 + q2) + l*u1^2*sin(q2))*(2*cos(q2) + 3) + (2*cos(q2) + 1)*(-g*cos(q1 + q2) - 3*g*cos(q1) + 2*l*u1*u2*sin(q2) + l*u2^2*sin(q2)))/(l*(4*cos(q2)^2 - 5));

% s tlumenim
mm = [
1, 0,                                      0,                           0;
0, 1,                                      0,                           0;
0, 0, l^2*m/4 + m*(l^2*cos(q2) + 5*l^2/4), m*(l^2*cos(q2)/2 + l^2/4);
0, 0,            m*(l^2*cos(q2)/2 + l^2/4),                    l^2*m/4];

fo = [
                                                                                                                                        u1;
                                                                                                                                        u2;
-c1*u1 - g*l*m*(-sin(q1)*sin(q2) + cos(q1)*cos(q2))/2 - 3*g*l*m*cos(q1)/2 - k1*q1 + l^2*m*(u1 + u2)^2*sin(q2)/2 - l^2*m*u1^2*sin(q2)/2;
                                                    -c2*u2 - g*l*m*(-sin(q1)*sin(q2) + cos(q1)*cos(q2))/2 - k2*q2 - l^2*m*u1^2*sin(q2)/2];

R = mm\fo;

ext_f = [0;
         0;
         (-5*(10 - 5*sin(q1))*cos(q1) - 25*sin(q1)*cos(q1))/sqrt((10 - 5*sin(q1))^2 + 25*cos(q1)^2)+((5*sin(q1)*sin(q2) - 5*cos(q1)*cos(q2) - 10*cos(q1))*(10*sin(q1)*cos(q2) + 20*sin(q1) + 10*sin(q2)*cos(q1))/2 + (10*sin(q1)*sin(q2) - 10*cos(q1)*cos(q2) - 20*cos(q1))*(-5*sin(q1)*cos(q2) - 10*sin(q1) - 5*sin(q2)*cos(q1) + 10)/2)/sqrt((5*sin(q1)*sin(q2) - 5*cos(q1)*cos(q2) - 10*cos(q1))^2 + (-5*sin(q1)*cos(q2) - 10*sin(q1) - 5*sin(q2)*cos(q1) + 10)^2);
         ((10*sin(q1)*sin(q2) - 10*cos(q1)*cos(q2))*(-5*sin(q1)*cos(q2) - 10*sin(q1) - 5*sin(q2)*cos(q1) + 10)/2 + (10*sin(q1)*cos(q2) + 10*sin(q2)*cos(q1))*(5*sin(q1)*sin(q2) - 5*cos(q1)*cos(q2) - 10*cos(q1))/2)/sqrt((5*sin(q1)*sin(q2) - 5*cos(q1)*cos(q2) - 10*cos(q1))^2 + (-5*sin(q1)*cos(q2) - 10*sin(q1) - 5*sin(q2)*cos(q1) + 10)^2)];

R = R+mm\ext_f*1000;

xd(1) = R(1);
xd(2) = R(2);
xd(3) = R(3);
xd(4) = R(4);