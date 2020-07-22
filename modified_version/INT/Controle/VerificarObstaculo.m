%% Verifica se tem algum Obstáculo no caminho do Robô (Função Gol/Zag=1 Ata=-1)

function Desejado = VerificarObstaculo(Posicao,Desejado,Adv,Bola,Campo,Distancia,Funcao)

% Determina o ângulo entre o Robô e o local objetivo
if Posicao(1) > Desejado(1)
    AngDesejado = 180 + atand((Posicao(2)-Desejado(2))/(Posicao(1)-Desejado(1)));
else
    AngDesejado = mod(atand((Posicao(2)-Desejado(2))/(Posicao(1)-Desejado(1)))+360,360);
end

% Determina a distância entre o Robô e os Adversários e se há algum Robô Adversário no caminho do Robô
for ii = 1:3
    Adv(ii).DistRobo = sqrt( (Posicao(1)-Adv(ii).Posicao(1))^2 + (Posicao(2)-Adv(ii).Posicao(2))^2 );
    for jj = sqrt( (Posicao(1)-Desejado(1))^2 + (Posicao(2)-Desejado(2))^2 )*(0:0.01:1)
        if sqrt( ((Posicao(1)+jj*cosd(AngDesejado))-Adv(ii).Posicao(1))^2 + ...
                 ((Posicao(2)+jj*sind(AngDesejado))-Adv(ii).Posicao(2))^2 ) <= Distancia/2
            Adv(ii).CamhRobo = 1;
            break
        else
            Adv(ii).CamhRobo = 0;
        end
    end
end

% Determina a distância entre o Robô e a Bola e se a Bola está no caminho do Robô
Bola.DistRobo = sqrt( (Posicao(1)-Bola.Posicao(1))^2 + (Posicao(2)-Bola.Posicao(2))^2 );
for jj = sqrt((Posicao(1)-Desejado(1))^2 + (Posicao(2)-Desejado(2))^2)*(0:0.01:1)
    if sqrt( ((Posicao(1)+jj*cosd(AngDesejado))-Bola.Posicao(1))^2 + ...
             ((Posicao(2)+jj*sind(AngDesejado))-Bola.Posicao(2))^2 ) <= Distancia/1.5
        Bola.CamhRobo = 1;
        break
    else
        Bola.CamhRobo = 0;
    end
end

% Verifica o Obstáculo mais perto e altera a posição desejada
for ii = 1:3
    if Adv(ii).CamhRobo == 1 && Adv(ii).DistRobo == min([Adv(:).DistRobo Bola.DistRobo])
        Desejado = DesviarObstaculo(Posicao,AngDesejado,Adv(ii),Campo,Distancia,Funcao);
    end
end
if Bola.CamhRobo == 1 && Bola.DistRobo == min([Adv(:).DistRobo Bola.DistRobo])
    Desejado = DesviarObstaculo(Posicao,AngDesejado,Bola,Campo,Distancia,Funcao);
end