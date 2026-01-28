
function pos_ang = trouve_pos_ang_sph(x0, y0, x1, y1 ,z1, L1, L1bis, L2)

    x=sqrt((x1- x0).^2 + (y1 - y0).^2);
    y=z1-0.077;
    q0=atan2((x1-x0),(y1-y0));

    dist = sqrt(x.^2 + y.^2);
    l1 = sqrt(L1^2 + L1bis^2);

    
    alpha0 = trouve_angle(l1, dist, L2);
    beta0 = trouve_angle(L2, dist, l1);

    gamma0 = trouve_angle(l1, L2, dist);

    alpha1 = atan(y/x);
    alpha2 = atan(L1bis/L1);

    beta1 = atan(x/y);


    alpha = alpha0 + alpha1 + alpha2;
    beta = pi/2 + beta0 + beta1;
    gamma = gamma0 - alpha2;

    q1 = alpha - pi/2;
    q2 =  gamma - alpha2 - pi/2;
    q3 = - q1 - q2;

    pos_ang = [q0 ,q1, q2, q3];
end