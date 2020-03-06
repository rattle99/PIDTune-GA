close all
clear all
clc

G = tf(1, [1 1 1 0]);
step(G)

controller = pid(0.5, 0, 0.1);
OpenLoop = series(G,controller);
ClosedLoop = feedback(OpenLoop,1);
step(ClosedLoop)
