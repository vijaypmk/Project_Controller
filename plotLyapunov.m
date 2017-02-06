%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Ricardo Sanfelice
%
% Project: Simulation of problem on target acquisition and obstacle
% avoidance.
% 
% Name: plotLyapunov1
%
% Description: plot Lyapunov function
%
% Version: 1
% Required files: -
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mStep = 0.01;
[a,b] = meshgrid(-1:mStep:axis_x,-axis_y:mStep:axis_y);
[N,M] = size(a);
for i=1:N,
   for j=1:M,
       v(i,j) = LyapunovFunction([a(i,j),b(i,j)],r1,r2,delta,doutside,voutside,x1t,x2t);
   end
end

figure(1),clf
[cs,h] = contour(a,b,v,20);
% figure(2),clf
% mesh(a,b,v);

%clabel(cs,h,'labelspacing',72)
