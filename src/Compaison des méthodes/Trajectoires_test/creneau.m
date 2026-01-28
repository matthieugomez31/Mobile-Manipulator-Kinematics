% Script pour calculer les points x et y pour qu'un robot suive une trajectoire
% où x augmente, y augmente, x diminue, et y augmente
% , avec des longueurs de segments spécifiques,
% une vitesse donnée, et un temps de simulation T

function [x, y, z] = creneau(longueur_x, longueur_y, v, t, L, z_cte)
    % Paramètres de la trajectoire
    t_segment_x = longueur_x / v; % Durée de chaque segment où x change (secondes)
    t_segment_y = longueur_y / v; % Durée de chaque segment où y change (secondes)
    dt = t(2) - t(1); % Pas de temps, calculé à partir du vecteur de temps
    
    % Longueur totale d'un cycle complet (quatre segments)
    L_cycle = 2 * (longueur_x + longueur_y);
    
    % Nombre total de cycles dans la longueur totale du tracé
    num_cycles = L / L_cycle;
    
    % Temps total pour tracer la longueur totale du tracé
    T_total_tracage = num_cycles * (2 * (t_segment_x + t_segment_y));
    
    % Initialisation des vecteurs de positions
    x = zeros(size(t));
    y = zeros(size(t));
    z = zeros(size(t));

    % Initialisation des positions actuelles
    x_current = 0;
    y_current = 0;

    % Boucle pour calculer les positions x et y
    for i = 1:length(t)
        if t(i) > T_total_tracage
            % Si le temps dépasse le temps total de traçage, x et y restent constants
            x(i) = x_current;
            y(i) = y_current;
            z(i) = z_cte;
        else
            cycle_time = mod(t(i), 2 * (t_segment_x + t_segment_y));
        
            if cycle_time < t_segment_x
                % x augmente, y est constant
                x_current = x_current + v * dt;
            elseif cycle_time < t_segment_x + t_segment_y
                % y augmente, x est constant
                y_current = y_current + v * dt;
            elseif cycle_time < 2 * t_segment_x + t_segment_y
                % x diminue, y est constant
                x_current = x_current - v * dt;
            else
                % y diminue, x est constant
                y_current = y_current + v * dt;
            end
            
            % Stockage des positions actuelles
            x(i) = x_current;
            y(i) = y_current;
            z(i) = z_cte;
        end
    end


