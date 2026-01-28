function angle = trouve_angle(a, b, c)
% Fonction que donne l'angle en b pour un triangle avec la formule
% d'Al-Kashi
   numerateur = (a^2 + b^2 - c^2);
   denominateur = 2*a*b;
   test = numerateur/denominateur;
   angle = acos(test);
end