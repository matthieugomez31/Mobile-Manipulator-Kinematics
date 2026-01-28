function [q0, q1, q2, q3] = trouve_pos_ang_sph(r,th,ph)
% Fonction de géométrie inverse
%   L'entrée est la position du bout du bras, la sortie est la position des
%   angles dans le bras
    
if r == 0
    q0 = 0;
    q1 = 0;
    q2 = 0;
    q3 = 0;

else
    a0 = 0.185;
    l1 = 0.130;
    l2 = 0.124;

    th1 = trouve_angle(l1, r, l2);
    th2 = trouve_angle(l1, l2, r);

    q0 = ph;
    q1 = a0 + th + th1 - pi/2;
    q2 = th2 - a0 - pi/2;
    q3 = -(q1 + q2);
 end