function [x, y, z] = sinus_z_avec_deplacement(w, A, psi, dec, x_cte, y_cte, vitesse_y, t)
%Fonction de trajectoire pour une sinusoïde selon x
%   x est une constante de valeur y_cte
%   y est une constante de valeur y_cte
%   z est une sinusoïde de pulsation w, d'amplitude A, de déphasage psi, et
%   de décalage constant dec

x = zeros(1, length(t));
y = zeros(1, length(t));
z = zeros(1, length(t));

    for l = 1:length(t)
        x(l) = x_cte;
        y(l) = vitesse_y*t(l)+y_cte;
        z(l) = A*sin(w*t(l) + psi) + dec;
    end
end

