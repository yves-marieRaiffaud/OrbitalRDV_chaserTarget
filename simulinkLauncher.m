clc
clear variables
close all
%=================================================
%=================================================
% Make functions in sub-folders available
currentFolderContents = dir(pwd);
currentFolderContents (~[currentFolderContents.isdir]) = [];
for i = 3:length(currentFolderContents)
   addpath(['./' currentFolderContents(i).name]);
end
clear i
%=================================================
%=================================================
% Origin of inertial frame is the Earth's origin
mu = 39.86004418*10^13; % Earth �, m^3.s^-2
rEarth = 6378e3; % Earth radius in m, assuming spherical Earth
%=================================================
vernalDir = [1 0 0]; % Vernal direction vector
%===
x0Chaser = [0 6578e3 0];
v0Chaser = [7783 0 0];
%===
x0Target = [0 6578e3 0];
v0Target = [7784 0 0];
%=================================================
simDuration = 7000; % Duration of the simulation in seconds
timestep = 1; % in seconds
model = 'orbitGuidance_LVLH';
open_system(model)
sim(model)
%=================================================
%=================================================
% Plotting Chaser & Target Orbit Trajectories
figure('Name','Orbit Trajectories')
[XSphere,YSphere,ZSphere] = sphere(100);
hSurface = surf(XSphere*rEarth/1000,YSphere*rEarth/1000,ZSphere*rEarth/1000, 'DisplayName', 'Earth surface');
set(hSurface,'FaceColor',[0 0.4 0.8],'FaceAlpha',0.3,'EdgeColor','none');
hold on
vernalDirLineX = transpose(linspace(0,1.5*rEarth,100));
vernalDirLine = [vernalDirLineX zeros(100,1) zeros(100,1)];
plot3(vernalDirLine(:,1)/1000,vernalDirLine(:,2)/1000,vernalDirLine(:,3)/1000,'LineWidth',1,'DisplayName','Vernal Direction')
plot3(0,0,0,'og','MarkerFaceColor','b','DisplayName','Origin');
%plot3(chaserFiringPos(:,1)/1000,chaserFiringPos(:,2)/1000,chaserFiringPos(:,3)/1000,'og','MarkerFaceColor','g','DisplayName','Chaser Firing');
plot3(chaserPos(:,1)/1000,chaserPos(:,2)/1000,chaserPos(:,3)/1000,'LineWidth',1,'LineStyle','-','Marker','none','DisplayName','Chaser Position');
plot3(targetPos(:,1)/1000,targetPos(:,2)/1000,targetPos(:,3)/1000,'LineWidth',1,'LineStyle','-','Marker','none','DisplayName','Target Position');
legend;
axis equal;
hold off
xlabel('x (km)')
ylabel('y (km)')
zlabel('z (km)')
clear vernalDirLineX vernalDirLine
clear XSphere YSphere ZSphere
%=================================================
%=================================================
% Plotting LVLH Earth-Pointing Chaser Position
figure('Name','LVLH-EP Chaser Position')
plot(0,0,'ob','MarkerFaceColor','g','DisplayName','Target Position');
hold on
plot(chaserPos_LVLH(:,1)/1000, chaserPos_LVLH(:,2)/1000,'DisplayName','Chaser Position');
ylim = get(gca,'ylim');
xlim = get(gca,'xlim');
quiver(0,0,0,-ylim(1)/2,'DisplayName','$\bar{X}$');
quiver(0,0,xlim(2)/2,0 ,'DisplayName','$\bar{Z}$');
clear ylim xlim
hold off
grid on
grid minor
set(gca, 'YDir','reverse');
xlabel('$\bar{X}$ (km)','Interpreter','Latex');
ylabel('$\bar{Z}$ (km)','Interpreter','Latex')
hl = legend('show');
set(hl, 'Interpreter','latex');
title('Chaser Position in Target LVLH Earth Pointing Frame');
%=================================================
figure('Name','Chaser velocity evolution')
plot(time,chaserVel(:,1),time,chaserVel(:,2),time,chaserVel(:,3),time,sqrt(sum(chaserVel.^2,2)))
yyaxis left
ylabel('Velocity (m/s)')
yyaxis right
plot(time,chaserTheta*180/pi)
ylabel('True anomaly (�)')
legend('Vx','Vy','Vz','Velocity Norm','Chaser true anomaly')
xlabel('Time (s)')
grid on
grid minor
title('Chaser orbital velocity evolution along time')


