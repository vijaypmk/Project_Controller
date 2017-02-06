%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Ricardo Sanfelice
%
% Project: Simulation of problem on target acquisition and obstacle
% avoidance.
% 
% Name: plotSIM
%
% Description: simple plots
%
% Version: 1
% Required files: -
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% First Figure - one Lyapunov function

%load SIM1

figure(1),clf
plotLyapunov;
figure(1), hold on, plot(x1,x2,'r')
axis([-1 axis_x -axis_y axis_y])
xlabel('x_1')
ylabel('x_2')

hold on, plot(x1t,x2t,'x')
hold on, plot(x0(1),x0(2),'>')
% hold on, plot(0.8445,0,'o')
% hold on, plot(1+0.1,0,'o')
% hold on, plot(1,0.1,'o')
% hold on, plot(1,-0.1,'o')
% text(3,-0.3,' x_t')

% break

% print -depsc -tiff -r300 AvoidanceMissionCrash.eps
% % update paper file
% copyfile('AvoidanceMissionCrash.eps','/home.bradbury/rsanfelice/Projects/RobustCTLogic/LaTeX/Paper/AvoidanceMissionCrash.eps')

% Second Figure - Two lyapunov functions

%load SIM2


% figure(2),clf
% 
% plotLyapunov1
% hold on
% y1 = linspace(-1,1,10);
% y2 = -y1+1-0.1;
% plot(y1,y2,':')
% y1 = linspace(1,4,10);
% y2 = y1-1-0.1;
% hold on, plot(y1,y2,':')
% y1 = linspace(1-0.1,1,10);
% y2 = -y1+1-0.1;
% plot(y1,y2)
% y1 = linspace(1,1.1,10);
% y2 = y1-1-0.1;
% plot(y1,y2)
% axis([-1 4 -2 2])
% 
% y1 = linspace(-1,1,10);
% y2 = y1-1+0.1;
% plot(y1,y2,':')
% y1 = linspace(1,4,10);
% y2 = -y1+1+0.1;
% plot(y1,y2,':')
% y1 = linspace(1-0.1,1,10);
% y2 = y1-1+0.1;
% plot(y1,y2)
% y1 = linspace(1,1.1,10);
% y2 = -y1+1+0.1;
% plot(y1,y2)
% 
% xlabel('x_1')
% ylabel('x_2')
% 
% hold on, plot(3,0,'x')
% hold on, plot(x1(1),x2(1),'>')
% %hold on, plot(1-0.1,0,'o')
% %hold on, plot(1+0.1,0,'o')
% %hold on, plot(1,0.1,'o')
% %hold on, plot(1,-0.1,'o')
% text(3,-0.3,' x_t')
% 
% text(3,-1.5,'O_2')
% text(-0.5,-1.2,'O_2')
% 
% text(-0.5,1.1,'O_1')
% text(3,1.5,'O_1')
% 
% % print -depsc -tiff -r300 AvoidanceMissionHybrid.eps
% % % update paper file
% % copyfile('AvoidanceMissionHybrid.eps','/home.bradbury/rsanfelice/Projects/RobustCTLogic/LaTeX/Paper/AvoidanceMissionHybrid.eps')
% 
% 
% % break
% 
% hold on, plot(x1,x2,'r')
% axis([-2 2 -2 2])
% xlabel('x_1')
% ylabel('x_2')
% 
% hold on, plot(-1,0,'x')
% hold on, plot(1,0,'x')
% 
% mu = 2;
% lambda = 0.7;
% 
% ezplot('(x1-1)^2+x2^2=0.5',[-2,2,-2,2])
% hold on,ezplot('(x1+1)^2+(x2)^2=0.5',[-2,2,-2,2])
% % boundaries of the C set
% % mu = 2
% ezplot('(x1-1)^2+x2^2 =2*((x1+1)^2+(x2)^2)',[-2,2,-2,2])
% ezplot('2*((x1-1)^2+x2^2) =((x1+1)^2+(x2)^2)',[-2,2,-2,2])
% 
% % boundaries of the D set
% ezplot('(x1-1)^2+x2^2 =1.3*((x1+1)^2+(x2)^2)',[-2,2,-2,2])
% ezplot('1.3*((x1-1)^2+x2^2) =((x1+1)^2+(x2)^2)',[-2,2,-2,2])
% 
% % plot attractor
% plot(-1,0,'x')
% plot(1,0,'x')
% 
% % Plot text
% text(-0.7,0.8,'V_1(x)=0.5')
% text(0.9,0.8,'V_2(x)=0.5')
% text(-1,-1.5,'D_{c1}(x)')
% text(1,1.5,'D_{c2}(x)')
% text(-0.3,-1.5,'C_{c1}(x)')
% text(1,1.5,'C_{c2}(x)')
% 
% % print -depsc -tiff -r300 2DExample
% % % update paper file
% % copyfile('2DExample.eps','/home.bradbury/rsanfelice/Projects/RobustCTLogic/LaTeX/Paper/2DExample.eps')
% 
% % break
% 
% 
% 
% %print -depsc -tiff -r300 x1x2PlaneSim3
% % update paper file
% %copyfile('x1x2PlaneSim3.eps','/home.bradbury/rsanfelice/Projects/SPHybridRobustness/LaTeX/Paper/x1x2PlaneSim3.eps')
% 
% figure(2),clf
% plot(tsim,u,'r',tsim,q,'g--')
% xlabel('t [s]')
% ylabel('u (-), q (--)')
% axis([0 30 -2 4])
% %print -depsc -tiff -r300 uSim3
% % update paper file
% %copyfile('uSim3.eps','/home.bradbury/rsanfelice/Projects/SPHybridRobustness/LaTeX/Paper/uSim3.eps')
% 
% figure(3),clf
% plot(tsim,xe1,'r-',tsim,xe2,'g--',tsim,xe3,'b:',tsim,xe4,'k-.')
% xlabel('t [s]')
% ylabel('x+e')
% %axis([0 30 -2 4])
% legend('x_{1}+e_1','x_{2}+e_2','x_{3}+e_3','x_{4}+e_4')
% %print -depsc -tiff -r300 xSim3
% % update paper file
% %copyfile('xSim3.eps','/home.bradbury/rsanfelice/Projects/SPHybridRobustness/LaTeX/Paper/xSim3.eps')
% 
% % break
% load Sim3-2
% 
% figure(1),clf
% Patches
% hold on, plot(xe1,xe2,'k')
% % print -depsc -tiff -r300 x1x2PlaneSim3-2
% % % update paper file
% % copyfile('x1x2PlaneSim3-2.eps','/home.bradbury/rsanfelice/Projects/SPHybridRobustness/LaTeX/Paper/x1x2PlaneSim3-2.eps')
% 
% figure(2),clf
% plot(tsim,u,'r',tsim,q,'g--')
% xlabel('t [s]')
% ylabel('u (-), q (--)')
% axis([0 30 -2 4])
% % print -depsc -tiff -r300 uSim3-2
% % % update paper file
% % copyfile('uSim3-2.eps','/home.bradbury/rsanfelice/Projects/SPHybridRobustness/LaTeX/Paper/uSim3-2.eps')

