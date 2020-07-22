%% Controla o movimento do Zagueiro

function Desejado = ZagueiroDesejado(Posicao,Adv,Bola,Campo)

Distancia = 90;

% Determina um local objetivo para o Zagueiro trabalhar
Objetivo = [ Campo*750; sign(Bola.Posicao(2))*200* ...
            ( Bola.Posicao(2) - sign(Bola.Posicao(2))*(0.0002*(Bola.Posicao(1)-Campo*750)^2)+1 ) / ...
            ( sign(Bola.Posicao(2))*(0.002*(Bola.Posicao(1)-Campo*750)^2+200) - ...
              sign(Bola.Posicao(2))*(0.0002*(Bola.Posicao(1)-Campo*750)^2)+1 ) ];

% Satura a posição do local objetivo
if abs(Objetivo(2)) > 200
    Objetivo(2) = sign(Bola.Posicao(2)) * 200;
end
if ( Objetivo(2) > 0 && Bola.Posicao(2) < 0 ) || ( Objetivo(2) < 0 && Bola.Posicao(2) > 0 )
    Objetivo(2) = 0;
end

% Determina o ângulo entre os Adversários e o local objetivo
for ii = 1:3
    if Adv(ii).Posicao(1) > Objetivo(1)
        Adv(ii).AngObjetivo = 180 + atand((Adv(ii).Posicao(2)-Objetivo(2))/(Adv(ii).Posicao(1)-Objetivo(1)));
    else
        Adv(ii).AngObjetivo = mod(atand((Adv(ii).Posicao(2)-Objetivo(2))/(Adv(ii).Posicao(1)-Objetivo(1)))+360,360);
    end
end

% Determina o ângulo entre a Bola e o local objetivo
if Bola.Posicao(1) > Objetivo(1)
    Bola.AngObjetivo = 180 + atand((Bola.Posicao(2)-Objetivo(2))/(Bola.Posicao(1)-Objetivo(1)));
else
    Bola.AngObjetivo = mod(atand((Bola.Posicao(2)-Objetivo(2))/(Bola.Posicao(1)-Objetivo(1)))+360,360);
end

% Verifica se a bola não está avançada
if Campo * Bola.Posicao(1) > -100
    
    % Determina a posição desejada quando a bola não estiver avançada
    Desejado = Bola.Posicao(1:2) + Distancia*[cosd(Bola.AngObjetivo);sind(Bola.AngObjetivo)];
    
else
    
    % Determina a posição desejada quando a bola estiver avançada
    Desejado = [Campo*-100;Bola.Posicao(2)];
    if Bola.Posicao(2) > 0
        Desejado(2) = Bola.Posicao(2) - 200;
    else
        Desejado(2) = Bola.Posicao(2) + 200;
    end
    
end

% Satura a posição do Zagueiro para fora da área de defesa
if Campo * Desejado(1) > 550 && abs(Desejado(2)) < 400
    Desejado(1) = Campo * 550;
end

% Se a bola estiver fora da área
if abs(Bola.Posicao(1)) < 650 || abs(Bola.Posicao(2)) > 240
    
    % Chama a função para verificar os Obstáculos no caminho do Zagueiro
    Desejado = VerificarObstaculo(Posicao,Desejado,Adv,Bola,Campo,Distancia,1);
    
end

% Satura a posição do Zagueiro para dentro do campo
if abs(Desejado(1)) >= 700
    if abs(Desejado(2)) >= 600
        Desejado(1) = sign(Desejado(1))*700;
        Desejado(2) = sign(Desejado(2))*600;
    else
        Desejado(1) = sign(Desejado(1))*700;
        Desejado(2) = Desejado(2)+Campo*Distancia;
    end
else
    if abs(Desejado(2)) >= 600
        Desejado(1) = Desejado(1)+Campo*Distancia;
        Desejado(2) = sign(Desejado(2))*600;
    end
end