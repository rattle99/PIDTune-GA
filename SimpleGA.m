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

[x,fval] = ga(@(K)itae(G,K),3);