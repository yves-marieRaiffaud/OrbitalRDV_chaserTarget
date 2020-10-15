function Plot_OrbitalTrajectories(rEarth, x0Chaser, chaserFiringPos, chaserPos, targetPos)
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
    plot3(x0Chaser(:,1)/1000,x0Chaser(:,2)/1000,x0Chaser(:,3)/1000,'og','MarkerFaceColor','g','DisplayName','Chaser Firing');
    plot3(chaserFiringPos(:,1)/1000,chaserFiringPos(:,2)/1000,chaserFiringPos(:,3)/1000,'og','MarkerFaceColor','g','DisplayName','Chaser Firing');
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
end