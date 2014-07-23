classdef OdoSensor < handle
    properties
        Type;
        DistanceRange=250;
        AngularRange=90;
        ScanStepSize=3;
        
        
    end
    
    
    methods
        function Obj=OdoSensor()
        end
        function LidarReading=LidarData(Obj,Map)
            MapSize=size(Map);
            LineStep=1;
            LidarPlot=0;
            

            LaserDirections=Obj.theta-Sensor.AngularRange/2:Sensor.ScanStepSize:Obj.theta+Sensor.AngularRange/2;
            LidarReading=zeros(Sensor.AngularRange/Sensor.ScanStepSize,1);



            for i=1:Sensor.AngularRange/Sensor.ScanStepSize
                m=LaserDirections(i)*pi/180;       
                TravelStep=1;
                exceed=0;
                while exceed==0
                    LightTravel=TravelStep*LineStep;
                    LightedPix(TravelStep,:)=[int16(Obj.x+LightTravel*cos(m)),int16(Obj.y+LightTravel*sin(m))];
                    %             pause(.1);
                    if LightedPix(TravelStep,1)>0&&LightedPix(TravelStep,1)<MapSize(2)&&LightedPix(TravelStep,2)>0&&LightedPix(TravelStep,2)<MapSize(1)
                        if (Map(LightedPix(TravelStep,2),LightedPix(TravelStep,1),1)==1&&Map(LightedPix(TravelStep,2),LightedPix(TravelStep,1),2)==1&&Map(LightedPix(TravelStep,2),LightedPix(TravelStep,1),3)==1)
                            LidarPlot=LidarPlot+line([Obj.x,LightedPix(TravelStep,1)],[Obj.y,LightedPix(TravelStep,2)],'Color','y','LineWidth',.1,'LineStyle',':');
                            %Map(LightedPix(TravelStep-1,1),LightedPix(TravelStep-1,2),:)=[0,0,1];
                            LidarReading(i)=LightTravel;
                            exceed=1;
                            
                        end
                        TravelStep=TravelStep+1;
                        if LightTravel>Sensor.DistanceRange 
                            LidarPlot=LidarPlot+line([Obj.x,LightedPix(TravelStep-1,1)],[Obj.y,LightedPix(TravelStep-1,2)],'Color','y','LineWidth',.1,'LineStyle',':');
                            %Map(LightedPix(TravelStep-1,1),LightedPix(TravelStep-1,2),:)=[0,0,1];
                            LidarReading(i)=LightTravel;
                            exceed=1;
                        end
                    else
                        LidarPlot=LidarPlot+line([Obj.x,LightedPix(TravelStep-1,1)],[Obj.y,LightedPix(TravelStep-1,2)],'Color','y','LineWidth',.1,'LineStyle',':');
                        %Map(LightedPix(TravelStep-1,1),LightedPix(TravelStep-1,2),:)=[0,0,1];
                        LidarReading(i)=LightTravel;%LightedPix(TravelStep-1,:);
                        exceed=1;
                    end
                end
            end


        end
        
        function PlotLidar(Obj)
            
            
            
        end
        
    end
    
    
end