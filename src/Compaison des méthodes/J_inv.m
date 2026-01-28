function y = J_inv(xchar, ychar, theta0, theta1, theta2)

    D1 = 0.128;
    d1 = 0.024;
    D2 = 0.124;
    val1 = -D1*sin(theta1) + d1*cos(theta1) + D2*cos(theta1 + theta2);
    val2 = -D1*cos(theta1) - d1*sin(theta1) - D2*sin(theta1 + theta2);
    val3 = -D1*sin(theta1) + d1*cos(theta1) + D2*cos(theta1 + theta2);
    Jac = [1, 0, -sin(theta0)*val1, cos(theta0)*val2, -D2*sin(theta1 + theta2)*cos(theta0);
           0, 1, cos(theta0)*val1, sin(theta0)*val2, -D2*sin(theta1 + theta2)*sin(theta0) ;
           0, 0, 0, val3, D2*cos(theta1 + theta2)];
    y = pinv(Jac)
end

