%% Desvia do Obstáculo desejado

function Desejado = DesviarObstaculo(Posicao,AngObjetivo,Obstaculo,Campo,Distancia,Funcao)

% Determina o ângulo entre o Robô e o Obstáculo
if Posicao(1) > Obstaculo.Posicao(1)
    AngRoboObst = 180 + atand((Posicao(2)-Obstaculo.Posicao(2))/(Posicao(1)-Obstaculo.Posicao(1)));
else
    AngRoboObst = mod(atand((Posicao(2)-Obstaculo.Posicao(2))/(Posicao(1)-Obstaculo.Posicao(1)))+360,360);
end

% Determina duas outras posições para o Robô
DesjTemp1 = Obstaculo.Posicao(1:2) + Campo*2*Distancia*[cosd(mod(Obstaculo.AngObjetivo+Campo*90+360,360));
                                                          sind(mod(Obstaculo.AngObjetivo+Campo*90+360,360))];
DesjTemp2 = Obstaculo.Posicao(1:2) + Campo*2*Distancia*[cosd(mod(Obstaculo.AngObjetivo-Campo*90+360,360));
                                                          sind(mod(Obstaculo.AngObjetivo-Campo*90+360,360))];

% Se puder ir à primeira posição (-90º)
if abs(DesjTemp1(1)) <= 700
    
    % Se puder ir às duas posições (-90º e +90º)
    if abs(DesjTemp2(2)) <= 600
        
        % Determina qual posição possui o menor caminho
        if Funcao*AngObjetivo >= Funcao*AngRoboObst
            Desejado = DesjTemp1;
        else
            Desejado = DesjTemp2;
        end
        
    % Se puder ir somente à primeira posição (-90º)
    else
        
        % Determina a posição 1 (-90º)
        Desejado = DesjTemp1;
        
    end
    
% Se não puder ir à primeira posição (-90º)
else
    
    % Se puder ir somente à segunda posição (+90º)
    if abs(DesjTemp2(2)) <= 600
        
        % Determina a posição 2 (+90º)
        Desejado = DesjTemp2;
        
    % Se não puder ir à nenhuma posição (-90º e +90º)
    else
        
        % Determina a bola como posição desejada
        Desejado = Obstaculo.Posicao(1:2);
        
    end
    
end