%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Ricardo Sanfelice
%
% Project: Simulation of problem on target acquisition and obstacle
% avoidance.
% 
% Name: settings
%
% Description: Sets constants for simulation
%
% Version: 1
% Required files: -
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
close all;
emax = 0.08;
mu = 1.1;
lambda = 0.09;

% target position
x1t = 3;
x2t = 0.1;

% obstacle position
% for i = 1:2
%     r1(i) = i-0.5;           
%     r2(i) = 0;
% end
num_obs = 4;
r1(1) = 1;
r2(1) = 0;
r1(2) = 1;
r2(2) = 0.2;
r1(3) = 1.5;
r2(3) = 0.5;
r1(4) = 1.5;
r2(4) = -0.25;
delta = 0.1;       % radius of obstacle

doutside=0;
voutside=100;
gradoutside=10;
tmax = 1;
% k2 = -2;           % noise gain to stabilize inflection point
k2 = 0;

% initial position
x0 = [0;0.1];

% additions
axis_x = 4;
axis_y = 2;

% run simulation
sim('mdlObstacle')

% plot trajectory
plotSIM