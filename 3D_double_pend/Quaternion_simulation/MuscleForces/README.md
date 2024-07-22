Here the muscles forces and external torques are derived.

`GenFM_seq.m` derives muscle length Jacobian when the joints are represented by YZY rotation (just to use something different than XYZ rotation).

`GenFM_quat.m` derives muscle length Jacobian in terms of all quaternion elements, when genEq=1, the function will generate FM_quat.m.

`GenFM_quat_Cnst.m` derives muscle length Jacobian in terms of q2,q3 and q4 elements, when genEq=1, the function will generate FM_quat.m.

Equations to mapping_analysis.m:

In this [paper](https://arxiv.org/abs/0811.2889) the mapping between generalized forces and external torques for a rigid body (when the rotation is described by a quaternion) is derived:

$$\textit{F}_Q = 2\textbf{G}^TT'$$

where $\textit{F}_Q$ is a vector of generalized forces (quaternion elements as generalized coordinates) and $T'$ is a vector of external torque and $\textbf{G}$ is the matrix that maps between those two

$$G = \begin{bmatrix}-Q_1 & Q_0 & Q_3 & -Q_2\\\ -Q_2&-Q_3& Q_0& Q_1 \\\ -Q_3& Q_2& -Q_1& Q_0\end{bmatrix}.$$

I have derived a vector of generalized forces, I mapped it to a vector of external torques, which works correctly. However, when I mapped the external torques back to generalized forces, the generalized forces were different. Does that mean that this mapping is not unique and different generalized forces in terms of quaternion can rotation represent the same external torques applied to a rigid body?

Edit:

I am creating a biomechanical model. My Equations of motion (for 1 joint) are:

$$\textbf{M}(Q)\dot{q}=f(q)$$

where $q = (Q_0,Q_1,Q_2,Q_3,\omega_x,\omega_y,\omega_z)^T$, $\textbf{M}(Q)$ is joint-space mass matrix and $f(q)$ are the external forces ($\omega_x$, $\omega_y$, $\omega_z$ are angular velocities).
To add a contribution of muscle force to the equations of motion, I calculate the muscle length $l_m = f(Q_0,Q_1,Q_2,Q_3)$, then I calculate the $4 \times 1$ jacobian $J_Q$ w.r.t. the quaternion coordinates

$$J_Q = \frac{\partial l_m(\textbf{Q})}{\partial Q_i} $$

from this I calculate $3 \times 1$ vector of external torques

$$\tau_E = \frac{1}{2} G J_Q F_m$$

where $F_m$ is a scalar muscle force. Then I can finish my equations of motion:

$$
\textbf{M}(Q)\dot{q}=f(q)+
\begin{pmatrix}
\textbf{0}^{4 \times 1} \\
\tau_E^{3 \times 1}
\end{pmatrix}
$$

and it works perfectly. For some reason I need to map the $3 \times 1$ external torque back to $4 \times 1$ generalized forces (if I can call it this way). And this mapping back doesn't give the same forces as the one calculated by using the jacobian of muscle lengths.

