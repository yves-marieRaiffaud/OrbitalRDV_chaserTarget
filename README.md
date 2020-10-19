# Rendez-vous simulation between a chaser and a target, using Matlab Simulink

Simulation, using LVLH frame, of the phasing & rendez-vous of a chaser and a target on circular and near-circular orbit (Clohessy–Hill-Wiltshire equations)

## Installation
```bash
git clone https://github.com/yves-marieRaiffaud/OrbitalRDV_chaserTarget
```

## Running
In matlab, open and run the `SimulinkLauncher.m`. It will open the `orbitGuidance_LVLH.slx` simulink file and start the simulation. Once simulation is complete, Matlab will plot and show the graphs coded in the `SimulinkLauncher.m` file.

The followings figures have been made to confirm that the LVLH plot and the simulation propagator are working as expected.

Assumptions for the results hereunder:
* Start positions for both the chaser and the target are the same (explaining why the chaser trajectory in figure 2 starts at the origin/the target position) 
* Target is on a circular orbit with a radius of 6578 km (200 km altitude) ==> orbital velocity of `7784 m/s`.
* Chaser is initially on a near circular orbit (`7783 m/s` at the same start altitude). At timestep 0, a boost of `100 m/s` is applied on the chaser. When the chaser is at timestep orbitalPeriod/2, a second boost of `100 m/s` is applied. As a result and after these 2 boosts, the chaser is slowly drifting at `1 m/s` with respect to the target.

![Alt text](https://github.com/yves-marieRaiffaud/OrbitalRDV_chaserTarget/blob/master/Screens/SimulinkModel.png "Simulink model")

![Alt text](https://github.com/yves-marieRaiffaud/OrbitalRDV_chaserTarget/blob/master/Screens/Chaser_Pos_LVLH.png "Chaser position in the LVLH frame - Chaser position relative to the target position")

![Alt text](https://github.com/yves-marieRaiffaud/OrbitalRDV_chaserTarget/blob/master/Screens/Chaser_Vel_Evo.png "Chaser velocities in the ECI frame (inertial frame)")

![Alt text](https://github.com/yves-marieRaiffaud/OrbitalRDV_chaserTarget/blob/master/Screens/Orbits_Traj.png "Chaser and target trajectories aournd the Earth, with the positions of the 2 chaser's boosts.")
