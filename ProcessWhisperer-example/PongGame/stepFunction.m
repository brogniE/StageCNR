function [NextObs,Reward,IsDone,NextState] = stepFunction(Action,State)

    velBall = 1;
    xBar = 1;
    lBar = 1;
    hBar = 5;
    lBall = 1;
    lField = 30;
    hField = 30;
    Penalty = -20;

    %plotEnvironment(State);

    yBar = State(1)+Action;
    xBall = State(2);
    yBall = State(3);
    theta = State(4);
    
    % Calcolo della nuova posizione della pallina
    xBall = xBall + velBall * cos(theta);
    yBall = yBall + velBall * sin(theta);

    % Controllo se la barra esce dal campo
    if yBar >= hField - hBar/2
        yBar = hField - hBar/2;
    end
    if yBar <= hBar/2
        yBar = hBar/2;
    end
    
    % Controllo se la pallina ha colpito la barra
    if xBall <= xBar + lBar && yBall <= yBar + hBar/2 && yBall >= yBar - hBar/2
        % Calcolo del nuovo angolo dopo la collisione con la barra
        theta = pi - theta;
    end
    
    % Controllo se la pallina ha colpito il bordo superiore o inferiore del campo
    if yBall <= 0 || yBall >= hField
        % Calcolo del nuovo angolo dopo la collisione con il bordo
        theta = -theta;
    end
    
    % Controllo se la pallina ha colpito il lato destro del campo
    if xBall > lField
        theta = pi - theta;
    end
    
    NextState = [yBar; xBall; yBall; theta];
    NextObs = NextState;
    
    % Controllo se la pallina ha colpito il lato sinistro del campo
    IsDone = xBall <= 0;
    
    if ~IsDone
        Reward = 1;
    else
        Reward = Penalty - abs(yBall - yBar);
    end

end

function plotEnvironment(state)
    % Estrai le variabili di stato
    yBar = state(1);
    xBall = state(2);
    yBall = state(3);

    xBar = 1;
    lBar = 1;
    hBar = 5;
    lBall = 1;
    lField = 30;
    hField = 30;

    % Crea una figura se non esiste già
    if isempty(findall(0,'Type','Figure'))
        figure
        hold on
    else
        clf
        hold on
    end

    % Disegna la barra
    rectangle('Position',[xBar, yBar-hBar/2, lBar, hBar],'FaceColor','b')

    % Disegna la palla
    rectangle('Position',[xBall-lBall/2, yBall-lBall/2, 1, lBall],'Curvature',[1 1],'FaceColor','r')

    % Imposta i limiti del campo
    xlim([0 lField])
    ylim([0 hField])

    % Aggiorna la figura
    drawnow limitrate
end