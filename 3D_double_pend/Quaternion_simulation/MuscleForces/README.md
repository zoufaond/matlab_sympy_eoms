Here the muscles forces and external torques are derived.

`GenFM_seq.m` derives muscle length Jacobian when the joints are represented by YZY rotation (just to use something different than XYZ rotation).

`GenFM_quat.m` derives muscle length Jacobian in terms of all quaternion elements, when genEq=1, the function will generate FM_quat.m.

`GenFM_quat_Cnst.m` derives muscle length Jacobian in terms of q2,q3 and q4 elements, when genEq=1, the function will generate FM_quat.m.

### Equations to mapping_analysis.m:

In this [paper](https://arxiv.org/abs/0811.2889) the mapping between 'quaternion' forces and external torques for a rigid body (when the rotation is described by a quaternion) is derived:

$$\textit{F}_Q = 2\textbf{G}^TT'$$

where $\textit{F}_Q$ is a $4 \times 1$ vector of 'quaternion' forces and $T'$ is a $3 \times 1$ vector of external torque and $\textbf{G}$ is the matrix that maps between those two

$$G = \begin{bmatrix}-Q_1 & Q_0 & Q_3 & -Q_2\\\ -Q_2&-Q_3& Q_0& Q_1 \\\ -Q_3& Q_2& -Q_1& Q_0\end{bmatrix}.$$

Equations of motion for 1 joint represented by quaternion is:

$$\textbf{M}(Q)\dot{q}=f(q)$$

where $q = (Q_0,Q_1,Q_2,Q_3,\omega_x,\omega_y,\omega_z)^T$, $\textbf{M}(Q)$ is joint-space mass matrix and $f(q)$ are the external forces ($\omega_x$, $\omega_y$, $\omega_z$ are angular velocities).
To add a contribution of muscle forces to the equations of motion, muscle length needs to be calculated ($l_m = f(Q_0,Q_1,Q_2,Q_3)$), jacobian $J_Q$ w.r.t. the quaternion coordinates can be calculated as:

$$J_Q = \frac{\partial l_m(\textbf{Q})}{\partial Q_i} $$

from this external torques can be obtained:

$$\tau_E = \frac{1}{2} G J_Q F_m$$

where $F_m$ is a scalar muscle force. Then the finished equations of motion can be created:

$$
\textbf{M}(Q)\dot{q}=f(q)+
\begin{pmatrix}
\textbf{0}^{4 \times 1} \\
\tau_E^{3 \times 1}
\end{pmatrix}
$$

As shown in themapping_analysis.m, this method is valid only mapping 'quaternion' forces into external torques, mapping from external torque to 'quaternion' forces is not unique - 4 of 'quaternion' forces (4 DOF) to represent 3 external torques (3 DOF) - new constraint must be introduced:

## Constrained muscle lengths
$$   a^2+b^2+c^2+d^2=1\quad, 
a\,\dot a+b\,\dot b+c\,\dot c+d\,\dot d=0$$

from here you obtain 

$$ \b{\dot{z}}= \begin{bmatrix}
   \dot{a} \\
   \dot{b} \\
   \dot{c} \\
   \dot{d} \\
 \end{bmatrix}= \underbrace{\left[ \begin {array}{ccc} -{\frac {b}{a}}&-{\frac {c}{a}}&-{\frac {d
}{a}}\\1&0&0\\ 0&1&0
\\0&0&1\end {array} \right] }_{\b T}
\,\underbrace{\begin{bmatrix}
   \dot{b} \\
   \dot{c} \\
   \dot{d} \\
 \end{bmatrix}}_{\b{\dot{q}}}
$$
hence equation (2)

 $$\omega=\underbrace{2\,\b Q\,\b T}_{\b J (3\times 3)}\,\b{\dot{q}}$$

the generalize torque is:

$$\b\tau_G=\b J^T\b\tau_E\quad, 
\b\tau_E=\left(\b J^T\right)^{-1}\b\tau_G$$
