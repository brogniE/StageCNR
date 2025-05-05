function [InitialObservation, Info] = resetFunction()

    yBar = 15;
    xBall = 15;
    yBall = 15;
    
    angolo_min1 = deg2rad(0);
    angolo_max1 = deg2rad(45);
    angolo_min2 = deg2rad(315);
    angolo_max2 = deg2rad(360);
    
    r = rand;
    
    if r < 0.5
        theta = angolo_min1 + (angolo_max1-angolo_min1).*rand;
    else
        theta = angolo_min2 + (angolo_max2-angolo_min2).*rand;
    end
    
    Info = [yBar;xBall;yBall;theta];
    InitialObservation = Info;

end
