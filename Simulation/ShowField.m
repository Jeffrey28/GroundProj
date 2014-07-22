function ShowField(RobotStates)
    k=.5;
    Er=abs(RobotStates.Rates.Tangent/RobotStates.RatesMax.Tangent);
    PlotTheta=([0:360])*pi/180;
    for e=0:Er/2:Er
    hold on
    cos(PlotTheta)
    PlotDist=k*e*RobotStates.SafetyRadius*RobotStates.Rank./(1-e.*cos(PlotTheta))+RobotStates.SafetyRadius;
    plot(PlotDist.*cos(PlotTheta+RobotStates.Theta*pi/180)+RobotStates.X,PlotDist.*sin(PlotTheta+RobotStates.Theta*pi/180)+RobotStates.Y,'w');
    end
    daspect([1,1,1]);

end