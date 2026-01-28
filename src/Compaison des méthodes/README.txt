Voici les étapes à suivre pour réaliser des expériences sur le simulateur

IPORTANT : IL FAUT INSTALLER LA "PETER CORKE TOOLBOX", DISPONIBLE SUR INTERNET VIA CE LIEN :
https://petercorke.com/toolboxes/robotics-toolbox/

Ouvrir le fichier Comparason_des_methodes.mlx

Les valeurs modifiables sont : 
- Tsim ligne 19 (Attention, il faut aussi modifier le temps de simulation dans les fichiers simulink methode_asservissement et methode_des_moyennes)
- K le correcteur proportionnel ligne 37
- la trajectoire ligne 25

Pour modifier la trajectoire, utiliser les fonctions stockées dans le dossier "Trajectoires_test", ou implémenter les valeurs successives de x, y et z en fonction de t (Attention, il faut que la coordonnée en z soit toujours positive, pour évter les erreurs prendre au minimum 0.01)

Lancer successivement les sections du programme (éviter de tout lancer d'un coup, car la RAM du PC peut saturer)

Ouvrir le fichier Animation_ass.m
Lancer le programme, et observer l'animation

Ouvrir le fichier Animation_moy.m
Lancer le programme, et observer l'animation