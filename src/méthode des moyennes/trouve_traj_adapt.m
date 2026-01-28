function traj_adapt = trouve_traj_adapt(traj_chariot, traj_point, L1, L1bis, L2) 
    traj_adapt = zeros(length(traj_chariot), 4); % Initialise une matrice traj_adapt
    for k = 1:length(traj_chariot)
        traj_adapt(k, :) = trouve_pos_ang_sph(traj_chariot(k,1),traj_chariot(k,2), traj_point(k,1),traj_point(k,2), traj_point(k,3), L1, L1bis, L2);
    end
end
%On utilise la cinématique inverse pour trouver à chaque fois les angles à
%imposé aux différents axes en fonction de la position du bras de robot,
%trouve pos angle utilise juste le principe de géométrie inverse menntionné
%dans le rapport
