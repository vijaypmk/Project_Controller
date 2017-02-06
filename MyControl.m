function [sys,x0,str,ts] = MyControl(t,x,u,flag,xi,r1,r2,num_obs,delta,gradoutside,doutside,x1t,x2t)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Ricardo Sanfelice
%
% Project: Simulation of problem on target acquisition and obstacle
% avoidance.
%
%
% Name: MyControl
%
% Description: Computes the control law for the vehicle - gradient
% method - one Lyapunov function.
%
% Version: 1
% Required files: -
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Dispatch the flag.
switch flag,
    case 0 
        [sys,x0,str,ts]=mdlInitializeSizes(xi); % Initialization 
    case 1 
        sys = mdlDerivatives(t,x,u);  % Calculate derivatives 
    case 3 
        sys = mdlOutputs(t,x,u,r1,r2,num_obs,delta,gradoutside,doutside,x1t,x2t); % Calculate outputs 
    case { 2, 4, 9 } % Unused flags 
        sys = []; 
    otherwise 
        error(['Unhandled flag = ',num2str(flag)]); % Error handling 
end 
% End of csfunc. 

%============================================================== % 
% mdlInitializeSizes 
% Return the sizes, initial conditions, and sample times for the 
% S-function. 
%============================================================== % 
function [sys,x0,str,ts] = mdlInitializeSizes(xi) 
% % Call simsizes for a sizes structure, fill it in and convert it 
% to a sizes array. % 
sizes = simsizes; 
sizes.NumContStates = 1; 
sizes.NumDiscStates = 0; 
sizes.NumOutputs = 2; 
sizes.NumInputs = 2; 
sizes.DirFeedthrough = 1; % Matrix D is nonempty. 
sizes.NumSampleTimes = 1; 
sys = simsizes(sizes); 
% % Initialize the initial conditions. % 
%x0 = zeros(3,1); 
x0 = xi;
% % str is an empty matrix.% 
str = []; 
% % Initialize the array of sample times; in this example the sample 
% time is continuous, so set ts to 0 and its offset to 0. % 
ts = [0 0]; 
% End of mdlInitializeSizes. % 
%============================================================== 
% mdlDerivatives 
% Return the derivatives for the continuous states. 
%============================================================== 
function sys = mdlDerivatives(t,x,u) 
%warning off; % To avoid warnings when updating lasing var

xdot = 0;

sys = xdot; 
% End of mdlDerivatives. % 
%============================================================== 
% mdlOutputs % Return the block outputs. 
%============================================================== % 
function sys = mdlOutputs(t,x,u,r1,r2,num_obs,delta,gradoutside,doutside,x1t,x2t)
% parameters and variables
x1 = u(1);
x2 = u(2);

% compute distance
d = Distance([x1,x2],r1,r2,num_obs,delta,doutside);

% compute partial d1 / partial x1 and partial d1 / partial x2
gradDx1 = 0;
gradDx2 = 0;
for i = 1:num_obs
    if (x1-r1(i))^2+(x2-r2(i))^2> delta^2/8
        gradDx1 = gradDx1 + (x1-r1(i))/sqrt((x1-r1(i))^2+(x2-r2(i))^2);
        gradDx2 = gradDx2 + (x2-r2(i))/sqrt((x1-r1(i))^2+(x2-r2(i))^2);
    else 
        gradDx1 = gradoutside;
        gradDx2 = gradoutside;
    end
end

% compute gradient of V1 respect to x1 and x2

gradVx1 = 0;
gradVx2 = 0;
for i = 1:num_obs
    if (d(i) <= 1) && (d(i)>0)
        gradVx1 = gradVx1 + 10*(x1 - x1t) + 2*(d(i)-1)*gradDx1*log(1/d(i))-(d(i)-1)^2 * gradDx1 / d(i);
        gradVx2 = gradVx2 + 10*(x2 - x2t) + 2*(d(i)-1)*gradDx2*log(1/d(i))-(d(i)-1)^2 * gradDx2 / d(i);
    else
        gradVx1 = gradVx1 + 10*(x1-x1t);
        gradVx2 = gradVx2 + 10*(x2-x2t); 
    end
end

% update control
   
ucontrol = [-gradVx1;-gradVx2];
%ucontrol = [1;-gradVx2];
   

sys = ucontrol;
