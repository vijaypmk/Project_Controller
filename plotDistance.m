%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Ricardo Sanfelice
%
% Project: Simulation of Inverted Pendulum with Patchy Vectors
% 
% Name: plotDistance1
%
% Description: Model of the inverted pendulum
%
% Version: 1
% Required files: -
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mStep = 0.01;

[a,b] = meshgrid(0:mStep:4,-2:mStep:2);
N = length(a);
for i=1:N,
   for j=1:N,
       d(i,j) = Distance([a(i,j),b(i,j)],r,delta,doutside);
   end
end

figure(3),clf
[cs,h] = contour(a,b,d);
figure(4),clf
mesh(a,b,d);

%clabel(cs,h,'labelspacing',72)
