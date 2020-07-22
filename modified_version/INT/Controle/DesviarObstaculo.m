%% Desvia do Obst�culo desejado

function Desejado = DesviarObstaculo(Posicao,AngObjetivo,Obstaculo,Campo,Distancia,Funcao)

% Determina o �ngulo entre o Rob� e o Obst�culo
if Posicao(1) > Obstaculo.Posicao(1)
    AngRoboObst = 180 + atand((Posicao(2)-Obstaculo.Posicao(2))/(Posicao(1)-Obstaculo.Posicao(1)));
else
    AngRoboObst = mod(atand((Posicao(2)-Obstaculo.Posicao(2))/(Posicao(1)-Obstaculo.Posicao(1)))+360,360);
end

% Determina duas outras posi��es para o Rob�
DesjTemp1 = Obstaculo.Posicao(1:2) + Campo*2*Distancia*[cosd(mod(Obstaculo.AngObjetivo+Campo*90+360,360));
                                                          sind(mod(Obstaculo.AngObjetivo+Campo*90+360,360))];
DesjTemp2 = Obstaculo.Posicao(1:2) + Campo*2*Distancia*[cosd(mod(Obstaculo.AngObjetivo-Campo*90+360,360));
                                                          sind(mod(Obstaculo.AngObjetivo-Campo*90+360,360))];

% Se puder ir � primeira posi��o (-90�)
if abs(DesjTemp1(1)) <= 700
    
    % Se puder ir �s duas posi��es (-90� e +90�)
    if abs(DesjTemp2(2)) <= 600
        
        % Determina qual posi��o possui o menor caminho
        if Funcao*AngObjetivo >= Funcao*AngRoboObst
            Desejado = DesjTemp1;
        else
            Desejado = DesjTemp2;
        end
        
    % Se puder ir somente � primeira posi��o (-90�)
    else
        
        % Determina a posi��o 1 (-90�)
        Desejado = DesjTemp1;
        
    end
    
% Se n�o puder ir � primeira posi��o (-90�)
else
    
    % Se puder ir somente � segunda posi��o (+90�)
    if abs(DesjTemp2(2)) <= 600
        
        % Determina a posi��o 2 (+90�)
        Desejado = DesjTemp2;
        
    % Se n�o puder ir � nenhuma posi��o (-90� e +90�)
    else
        
        % Determina a bola como posi��o desejada
        Desejado = Obstaculo.Posicao(1:2);
        
    end
    
end