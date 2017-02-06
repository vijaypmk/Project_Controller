function [v] = LyapunovFunction(x,r1,r2,num_obs,delta,doutside,voutside,x1t,x2t) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Ricardo Sanfelice
%
% Project: Simulation of problem on target acquisition and obstacle
% avoidance.
%
%
% Name: LyapunovFunction
%
% Description: Computes the Lyapunov function for the gradient
% control case. 
%
% Version: 1
% Required files: -
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% x1t and x2t are the target coordinates

x1= x(1);
x2= x(2);

v = 10/2*(x1-x1t)^2+10/2*(x2-x2t)^2;

d = Distance(x,r1,r2,num_obs,delta,doutside);
for i = 1:num_obs
    if (d(i) <= 1) && (d(i) >0)
        v = v+(d(i)-1)^2*log(1/d(i));
    elseif (d(i)>1)
        v = v;
    else
        % d = 0
        v = voutside;
    end
end
