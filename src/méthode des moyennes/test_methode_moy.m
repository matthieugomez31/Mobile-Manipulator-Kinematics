
D1 = 0.128;
d1 = 0.024;
D2 = 0.124;
traj_test=zeros(10000,3);
time=zeros(10000,3);
for k=1:10000
    traj_test(k,:) = [3*cos(2*k*pi/10000)-3, 3*sin(2*k*pi/10000), 0.077 + 0.02+0.01*sin(4*2*k*pi/10000)];
end
 %On rentre dans traj_test la courbe que l'on souhaite observer

figure;

traj_chariot=trouve_traj_chariot(traj_test,300);
plot3(traj_chariot(:,1),traj_chariot(:,2),traj_chariot(:,3),'r-');
hold on;
plot3(traj_test(:,1),traj_test(:,2),traj_test(:,3),'-b')
xlabel('x(m)');
ylabel('y(m)');
zlabel('z(m)');
title('Trajectoire à suivre(bleu) et trajectoire du chariot(rouge)');