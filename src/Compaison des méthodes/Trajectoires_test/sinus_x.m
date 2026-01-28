function [x, y, z] = sinus_x(w, A, psi, dec, y_cte, z_cte, t)
%Fonction de trajectoire pour une sinusoïde selon x
%   x est une sinusoïde de pulsation w, d'amplitude A, de déphasage psi, et
%   de décalage constant dec
%   y est une constante de valeur y_cte
%   z est une constante de valeur z_cte

x = zeros(1, length(t));
y = zeros(1, length(t));
z = zeros(1, length(t));

    for l = 1:length(t)
        x(l) = A*sin(w*t(l) + psi) + dec;
        y(l) = y_cte;
        z(l) = z_cte;
    end
end

