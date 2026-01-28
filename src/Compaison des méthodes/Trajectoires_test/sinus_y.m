function [x, y, z] = sinus_y(w, A, psi, dec, x_cte, z_cte, t)
%Fonction de trajectoire pour une sinusoïde selon x
%   x est une constante de valeur x_cte
%   y est une sinusoïde de pulsation w, d'amplitude A, de déphasage psi, et
%   de décalage constant dec
%   z est une constante de valeur z_cte

x = zeros(1, length(t));
y = zeros(1, length(t));
z = zeros(1, length(t));

    for l = 1:length(t)
        x(l) = x_cte;
        y(l) = A*sin(w*t(l) + psi) + dec;
        z(l) = z_cte;
    end
end

