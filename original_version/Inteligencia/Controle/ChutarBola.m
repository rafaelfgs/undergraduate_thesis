%% Controla a velocidade de cada roda do Robô

function Velocidade = ChutarBola(Angulo,Ksat)

if abs(Angulo) <= -90 || abs(Angulo) >= 90
    
    VelLinear = 1;
    
else
    
    VelLinear = -1;
    
end

Velocidade = [Ksat*VelLinear; 0];