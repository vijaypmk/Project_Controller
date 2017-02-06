function [d] = Distance(x,r1,r2,delta,doutside) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Ricardo Sanfelice
%
% Project: Simulation of problem on target acquisition and obstacle
% avoidance.
% 
% Name: Distance
%
% Description: Computes the distance to the obstacle (circle).
%
% Version: 1
% Required files: -
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x1= x(1);
x2= x(2);


if (x1-r1)^2+(x2-r2)^2> delta^2/8
    d = sqrt((x1-r1)^2+(x2-r2)^2)-delta;
else 
    d = doutside;
end
    
