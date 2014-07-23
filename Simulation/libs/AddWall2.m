function matrix=AddWall(matrix,startpoint,width,length)
    matrix(startpoint(2):(startpoint(2)+length),startpoint(1):(startpoint(1)+width),1:3)=1;
end