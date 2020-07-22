%% Controla o movimento do Atacante

function Desejado = AtacanteDesejado(Posicao,Adv,Bola,Campo)

Distancia = 90;

% Determina um local objetivo para o Atacante trabalhar
Objetivo = [ -Campo*750; sign(Bola.Posicao(2))*200* ...
            ( Bola.Posicao(2) - sign(Bola.Posicao(2))*(0.0002*(Bola.Posicao(1)+Campo*750)^2)+1 ) / ...
            ( sign(Bola.Posicao(2))*(0.002*(Bola.Posicao(1)+Campo*750)^2+200) - ...
              sign(Bola.Posicao(2))*(0.0002*(Bola.Posicao(1)+Campo*750)^2)+1 ) ];

% Satura a posi��o do local objetivo
if abs(Objetivo(2)) > 200
    Objetivo(2) = sign(Bola.Posicao(2)) * 200;
end
if ( Objetivo(2) > 0 && Bola.Posicao(2) < 0 ) || ( Objetivo(2) < 0 && Bola.Posicao(2) > 0 )
    Objetivo(2) = 0;
end

% Determina o �ngulo entre os Advers�rios e o local objetivo
for ii = 1:3
    if Adv(ii).Posicao(1) > Objetivo(1)
        Adv(ii).AngObjetivo = 180 + atand((Adv(ii).Posicao(2)-Objetivo(2))/(Adv(ii).Posicao(1)-Objetivo(1)));
    else
        Adv(ii).AngObjetivo = mod(atand((Adv(ii).Posicao(2)-Objetivo(2))/(Adv(ii).Posicao(1)-Objetivo(1)))+360,360);
    end
end

% Determina o �ngulo entre a Bola e o local objetivo
if Bola.Posicao(1) > Objetivo(1)
    Bola.AngObjetivo = 180 + atand((Bola.Posicao(2)-Objetivo(2))/(Bola.Posicao(1)-Objetivo(1)));
else
    Bola.AngObjetivo = mod(atand((Bola.Posicao(2)-Objetivo(2))/(Bola.Posicao(1)-Objetivo(1)))+360,360);
end

% Verifica se a bola n�o est� recuada
if Campo * Bola.Posicao(1) < 350
    
    % Determina a posi��o desejada quando a bola n�o estiver recuada
    Desejado = Bola.Posicao(1:2) - Distancia*[cosd(Bola.AngObjetivo);sind(Bola.AngObjetivo)];
    
else
    
    % Determina a posi��o desejada quando a bola estiver recuada
    Desejado = [Campo*350;Bola.Posicao(2)];
    if Bola.Posicao(2) > 0
        Desejado(2) = Bola.Posicao(2) - 200;
    else
        Desejado(2) = Bola.Posicao(2) + 200;
    end
    
end

% Se a bola estiver fora da �rea
if abs(Bola.Posicao(1)) < 650 || abs(Bola.Posicao(2)) > 240
    
    % Chama a fun��o para verificar os Obst�culos no caminho do Atacante
    Desejado = VerificarObstaculo(Posicao,Desejado,Adv,Bola,Campo,Distancia,-1);
    
end

% Satura a posi��o do Atacante para dentro do campo
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