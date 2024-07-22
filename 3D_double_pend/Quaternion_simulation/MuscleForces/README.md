Here the muscles forces and external torques are derived.

GenFM_seq.m derives muscle length Jacobian when the joints are represented by YZY rotation (just to use something different than XYZ rotation).
GenFM_quat.m derives muscle length Jacobian in terms of all quaternion elements, when genEq=1, the function will generate FM_quat.m.
GenFM_quat_Cnst.m derives muscle length Jacobian in terms of q2,q3 and q4 elements, when genEq=1, the function will generate FM_quat.m.

Equations to mapping_analysis.m:
