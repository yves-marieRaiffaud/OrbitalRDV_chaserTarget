function Plot_Chaser_Data(time, chaserVel, chaserTheta)
    figure('Name','Chaser velocity evolution')
    plot(time,chaserVel(:,1),time,chaserVel(:,2),time,chaserVel(:,3),time,sqrt(sum(chaserVel.^2,2)))
    yyaxis left
    ylabel('Velocity (m/s)')
    yyaxis right
    plot(time,chaserTheta*180/pi)
    ylabel('True anomaly (°)')
    legend('Vx','Vy','Vz','Velocity Norm','Chaser true anomaly')
    xlabel('Time (s)')
    grid on
    grid minor
    title('Chaser orbital velocity evolution along time')
end