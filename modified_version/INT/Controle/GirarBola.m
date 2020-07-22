%% Controla a velocidade de cada roda do Robô para Defender a Bola

function Velocidade = GirarBola(Sentido,Ksat)

if Sentido >= 0
    
    VelAngular = 1;
    
else
    
    VelAngular = -1;
    
end

Velocidade = Ksat' .* [0; VelAngular];