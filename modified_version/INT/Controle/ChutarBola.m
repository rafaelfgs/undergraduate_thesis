%% Controla a velocidade de cada roda do Rob� para Chutar a Bola

function Velocidade = ChutarBola(Sentido,Ksat)

if Sentido >= 0
    
    VelLinear = 1;
    
else
    
    VelLinear = -1;
    
end

Velocidade = Ksat' .* [VelLinear; 0];