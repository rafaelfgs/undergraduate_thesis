%% Controla a velocidade de cada roda do Robô para Alcançar a Posição Desejada

function Velocidade = TracarTrajetoria(Distancia,Angulo,Ksat,Kv)

if Angulo <= -90
    
    VelLinear = exp( -Kv(1) * Distancia ) - 1;
    
    VelAngular = exp(-Kv(2) * (180+Angulo) ) - 1;
    
elseif Angulo <= 0
    
    VelLinear = 1 - exp( -Kv(1) * Distancia );
    
    VelAngular = 1 - exp( -Kv(2) * -Angulo );
    
elseif Angulo <= 90
    
    VelLinear = 1 - exp( -Kv(1) * Distancia );
    
    VelAngular = exp( -Kv(2) * Angulo ) - 1;
    
else
    
    VelLinear = exp( -Kv(1) * Distancia ) - 1;
    
    VelAngular = 1 - exp( -Kv(2) * (180-Angulo) );
    
end

Velocidade = Ksat' .* [VelLinear ; sqrt(abs(VelLinear))*VelAngular];

% O fator "sqrt(abs(VelLinear))" é meio roubado, mas melhora o desempenho