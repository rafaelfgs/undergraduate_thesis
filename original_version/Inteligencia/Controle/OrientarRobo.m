%% Controla a velocidade de cada roda do Robô

function Velocidade = OrientarRobo(Angulo,Ksat,Kv)

if Angulo <= -90
    
    VelAngular = exp( -Kv * (180+Angulo) ) - 1;
    
elseif Angulo <= 0
    
    VelAngular = 1 - exp( -Kv * -Angulo );
    
elseif Angulo <= 90
    
    VelAngular = exp( -Kv * Angulo ) - 1;
    
else
    
    VelAngular = 1 - exp( -Kv * (180-Angulo) );
    
end

Velocidade = [0; Ksat*VelAngular];