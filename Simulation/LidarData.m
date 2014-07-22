function [LidarReading,LidarPlot]=LidarData(Map,Robot)
    MapSize=size(Map);
    LineStep=1;
    ScanRange=90;
    ScanStepSize=3;
    RayColor=[1,1,0];
    LidarPlot=0;
    RayRange=270;
    
    
    LaserDirections=Robot.theta-ScanRange/2:ScanStepSize:Robot.theta+ScanRange/2;
    LidarReading=zeros(ScanRange/ScanStepSize,1);
    
    
    
    for i=1:ScanRange/ScanStepSize
        m=LaserDirections(i)*pi/180;       
        TravelStep=1;
        exceed=0;
        while exceed==0
            LightTravel=TravelStep*LineStep;
            LightedPix(TravelStep,:)=[int16(Robot.x+LightTravel*cos(m)),int16(Robot.y+LightTravel*sin(m))];
            %             pause(.1);
            if LightedPix(TravelStep,1)>0&&LightedPix(TravelStep,1)<MapSize(2)&&LightedPix(TravelStep,2)>0&&LightedPix(TravelStep,2)<MapSize(1)
                if (Map(LightedPix(TravelStep,2),LightedPix(TravelStep,1),1)==1&&Map(LightedPix(TravelStep,2),LightedPix(TravelStep,1),2)==1&&Map(LightedPix(TravelStep,2),LightedPix(TravelStep,1),3)==1)
                    LidarPlot=LidarPlot+line([Robot.x,LightedPix(TravelStep,1)],[Robot.y,LightedPix(TravelStep,2)],'Color','y','LineWidth',.1,'LineStyle',':');
                    %Map(LightedPix(TravelStep-1,1),LightedPix(TravelStep-1,2),:)=[0,0,1];
                    LidarReading(i)=LightTravel;
                    exceed=1;
                end
                    TravelStep=TravelStep+1;
                    if LightTravel>RayRange 
                        LidarPlot=LidarPlot+line([Robot.x,LightedPix(TravelStep-1,1)],[Robot.y,LightedPix(TravelStep-1,2)],'Color','y','LineWidth',.1,'LineStyle',':');
                        %Map(LightedPix(TravelStep-1,1),LightedPix(TravelStep-1,2),:)=[0,0,1];
                        LidarReading(i)=LightTravel;
                        exceed=1;
                    end
            else
                LidarPlot=LidarPlot+line([Robot.x,LightedPix(TravelStep-1,1)],[Robot.y,LightedPix(TravelStep-1,2)],'Color','y','LineWidth',.1,'LineStyle',':');
                %Map(LightedPix(TravelStep-1,1),LightedPix(TravelStep-1,2),:)=[0,0,1];
                LidarReading(i)=LightTravel;%LightedPix(TravelStep-1,:);
                exceed=1;
            end
        end
    end
    
    
end