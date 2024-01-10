function xd = fun_moje(t, x, m, g, mx, my, ax, ay, eps,k,l, c)
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
% q2 = x(2);
u1 = x(2);
% u2 = x(4);

% Initialize a vector for the derivatives.
xd = zeros(2, 1);

R = [
                                                                                                                                                                                                                                                                                                                                                                                                                                                                     u1;
4*(-c*u1 - g*l*m*cos(q1)/2 + l*(-k*(ax^2 + ay^2)*(l*sin(q1) - my)*(-0.5*sqrt(eps^2 + (-1 + (l*sin(q1) - my)^2/ay^2 + (l*cos(q1) - mx)^2/ax^2)^2) - 0.5 + 0.5*(l*sin(q1) - my)^2/ay^2 + 0.5*(l*cos(q1) - mx)^2/ax^2)*cos(q1)/ay^2 + k*(ax^2 + ay^2)*(l*cos(q1) - mx)*(-0.5*sqrt(eps^2 + (-1 + (l*sin(q1) - my)^2/ay^2 + (l*cos(q1) - mx)^2/ax^2)^2) - 0.5 + 0.5*(l*sin(q1) - my)^2/ay^2 + 0.5*(l*cos(q1) - mx)^2/ax^2)*sin(q1)/ax^2))/(l^2*m)];

xd(1) = R(1);
xd(2) = R(2);
% xd(3) = R(3);
% xd(4) = R(4);