function Plot_LVLH_ChaserTraj(time, chaserPos_LVLH)
    % Plotting LVLH Earth-Pointing Chaser Position
    figure('Name','LVLH-EP Chaser Position')
    plot(0,0,'ob','MarkerFaceColor','g','DisplayName','Target Position');
    hold on
    p = plot(chaserPos_LVLH(:,1)/1000, chaserPos_LVLH(:,2)/1000,'DisplayName','Chaser Position');
    cd = [uint8(autumn(size(chaserPos_LVLH,1))*255) uint8(ones(size(chaserPos_LVLH,1),1))].';
    drawnow
    set(p.Edge, 'ColorBinding','interpolated', 'ColorData',cd)
    colormap(autumn);
    caxis([time(1) time(size(time,1))])
    c = colorbar('Location','southoutside');
    c.Label.String = 'Time (s)';
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
end