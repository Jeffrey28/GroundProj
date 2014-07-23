classdef Simulation<handle
    
   properties
       SimBase
       Robots@RobotStates   vector
       TimeStep=.1
   end
   
   properties (GetAccess='public',SetAccess='private')
      NomberOfRobots 
   end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   methods
       function Obj=Simulation()
       end
       
       function Obj=InitiatCheck()
           Obj.NumberOfRobots=size(Obj.Robots);
       end
       
       function SimulateWorkspace()
       end
       
       function RobotAndWallCollision()
       end
       
       function RobotAndRobotCollision(Obj.Robots)
       end
       
       function SimEnd()
       end
   end
   
   
   
   events
       SucessFinish;
       WallCollision;
       RobotCollision;
   end
    
    
    
    
    
    
    
end