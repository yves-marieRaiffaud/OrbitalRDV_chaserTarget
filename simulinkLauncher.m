clc
clear variables
close all
AddSubfoldersFilePaths();
%=======================
%====Constants
% Origin of inertial frame is the Earth's origin
mu = 39.86004418*10^13; % Earth µ, m^3.s^-2
rEarth = 6378e3;
vernalDir = [1 0 0]; % Vernal direction vector
%====Initial Conditions
x0Chaser = [0 6578e3 0];
%x0Chaser = [100e3 6575239.615 0];
v0Chaser = [7784 0 0];
x0Target = [0 6578e3 0];
v0Target = [7784 0 0];
%=======================
approachMode = 0; % 0 for 'Homing', 1 for 'Closing'
%=======================
if(approachMode == 0)
    % Homing
    z0 = GetChaser_EP_Z_Coord(x0Target, x0Chaser);
    %deltaV1 = 
elseif(approachMode == 1)
    % Closing
else
    % Doing nothing, error in approachMode selection
end


%====Run Simulink model
simDuration = 6600; % Duration of the simulation in seconds
timestep = 1; % in seconds
model = 'orbitGuidance_LVLH';
open_system(model)
sim(model)
%=======================
%====Plotting
Plot_OrbitalTrajectories(rEarth, x0Chaser, chaserFiringPos, chaserPos, targetPos);
Plot_LVLH_ChaserTraj(time, chaserPos_LVLH);
Plot_Chaser_Data(time, chaserVel, chaserTheta);
%=======================


