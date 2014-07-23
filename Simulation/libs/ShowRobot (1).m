function pic=ShowRobot(robotstats)
    r=20;
    pic=rectangle('Position',[robotstats.x-r/2,robotstats.y-r/2,r,r],...
          'Curvature',[1,1],...
         'LineWidth',1.5,'edgecolor','r')+line([robotstats.x,robotstats.x+r*cos(robotstats.theta*pi/180)/2],[robotstats.y,robotstats.y+r*sin(robotstats.theta*pi/180)/2],'Color','r','LineWidth',3);
    daspect([1,1,1]);


end