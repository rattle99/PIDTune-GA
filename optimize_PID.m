function [cost] = optimize_PID(k)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    assignin('base','k',k);
    sim('Example.slx');
    cost = ITAE(length(ITAE));
    
end

