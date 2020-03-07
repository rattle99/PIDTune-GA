close all
clear all
clc

G = tf(1, [1 1 1 0]);
step(G)

K = [0.5 0 0.1];
controller = pid(K(1), K(2), K(3));
OpenLoop = series(G,controller);
ClosedLoop = feedback(OpenLoop,1);
step(ClosedLoop)

PopSize = 25;
MaxGenerations = 10;
options = optimoptions(@ga,'PopulationSize',PopSize,'MaxGenerations',MaxGenerations);
[x,fval] = ga(@(K)itae(G,K),3,-eye(3),zeros(3,1),[],[],[],[],[],options);

%%
controller = pid(x(1), x(2), x(3));
OpenLoop = series(G,controller);
ClosedLoop = feedback(OpenLoop,1);
step(ClosedLoop)
