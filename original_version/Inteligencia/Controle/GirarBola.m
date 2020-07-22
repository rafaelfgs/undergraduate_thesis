
function Velocidade = GirarBola(Sentido,Ksat)

if Sentido >= 0
    
    VelAngular = 1;
    
else
    
    VelAngular = -1;
    
end

Velocidade = [0; Ksat*VelAngular];