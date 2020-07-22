%% Controla o movimento do Goleiro

function Desejado = GoleiroDesejado(Posicao,Adv,Bola,Campo)

% Determina um local objetivo para o Goleiro trabalhar
ObjetivoDef = sign(Bola.Posicao(2)) * 200 * ( Bola.Posicao(2) - sign(Bola.Posicao(2))*(0.0002*(Bola.Posicao(1)-Campo*750)^2)+1 ) / ...
              ( sign(Bola.Posicao(2))*(0.002*(Bola.Posicao(1)-Campo*750)^2+200) - sign(Bola.Posicao(2))*(0.0002*(Bola.Posicao(1)-Campo*750)^2)+1 );

ObjetivoBola = Bola.Posicao(2) + tand(Bola.Posicao(3)) * (Campo*700 - Bola.Posicao(1));

if abs(ObjetivoBola) < 500
    Objetivo = [Campo*710;ObjetivoBola];
else
    Objetivo = [Campo*710;ObjetivoDef];
end

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

% Determina a posição desejada para o Goleiro
Desejado = Objetivo;

% Se a bola estiver fora da área (MELHOR NÃO!!!)
% if abs(Bola.Posicao(1)) < 650 || abs(Bola.Posicao(2)) > 240
%     
%     % Chama a função para verificar os Obstáculos no caminho do Atacante
%     Desejado = VerificarObstaculo(Posicao,Desejado,Adv,Bola,Campo,Distancia,1);
%     
% end