function GradOfMember=MemberGrade(Distance,Theta,RobotStates)
    Distance=Distance-RobotStates.SafetyRadius;
    k=.5;
    rho0=.1;
    ForceMax=100;
    Er=abs(RobotStates.Rates.Tangent/RobotStates.RatesMax.Tangent);
    Dmax=k*Er*RobotStates.SafetyRadius*RobotStates.Rank/(1-Er*cos(Theta*pi/180));
    Dmin=rho0*Dmax;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Membeship Function
    if Distance>=Dmax
        GradOfMember=0;
    else Distance<Dmax
        GradOfMember=(Dmax-Distance)^2*ForceMax/(Dmax-Dmin)^2;
    end

end