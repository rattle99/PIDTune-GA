function J = itae(G, K)
%ITAE Calculates ITAE
%   Detailed explanation goes here
    
    dt = 0.1;
    t = 0:dt:2;
    
    controller = pid(K(1), K(2), K(3));
    OpenLoop = series(G,controller);
    ClosedLoop = feedback(OpenLoop,1);
    e = 1 - step(ClosedLoop,t);
    
    J = sum(t'.*abs(e)*dt);

end

