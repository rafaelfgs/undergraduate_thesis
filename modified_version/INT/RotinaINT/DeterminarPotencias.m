%% Converte as saídas de velocidade para potência

Robo(1).Formula(1) = 0.1715 * abs(Robo(1).Saida(1)) + 6.6209;
Robo(1).Formula(2) = 0.1189 * abs(Robo(1).Saida(2)) + 6.2342;

Robo(2).Formula(1) = 0.1588 * abs(Robo(2).Saida(1)) + 4.0612;
Robo(2).Formula(2) = 0.1024 * abs(Robo(2).Saida(2)) + 5.0855;

Robo(3).Formula(1) = 0.0651 * abs(Robo(3).Saida(1)) + 16.146;
Robo(3).Formula(2) = 0.0341 * abs(Robo(3).Saida(2)) + 17.288;

for ii = 1:3
    
    if Robo(ii).Saida(1) > 0
        
        if Robo(ii).Saida(2) > 0
            Robo(ii).Potencia(1) = Robo(ii).Formula(1) - Robo(ii).Formula(2);
            Robo(ii).Potencia(2) = Robo(ii).Formula(1);
        elseif Robo(ii).Saida(2) < 0
            Robo(ii).Potencia(1) = Robo(ii).Formula(1);
            Robo(ii).Potencia(2) = Robo(ii).Formula(1) - Robo(ii).Formula(2);
        else
            Robo(ii).Potencia(1) = Robo(ii).Formula(1);
            Robo(ii).Potencia(2) = Robo(ii).Formula(1);
        end
        
    elseif Robo(ii).Saida(1) < 0
        
        if Robo(ii).Saida(2) > 0
            Robo(ii).Potencia(1) = -Robo(ii).Formula(1);
            Robo(ii).Potencia(2) = -Robo(ii).Formula(1) + Robo(ii).Formula(2);
        elseif Robo(ii).Saida(2) < 0
            Robo(ii).Potencia(1) = -Robo(ii).Formula(1) + Robo(ii).Formula(2);
            Robo(ii).Potencia(2) = -Robo(ii).Formula(1);
        else
            Robo(ii).Potencia(1) = -Robo(ii).Formula(1);
            Robo(ii).Potencia(2) = -Robo(ii).Formula(1);
        end
    
    else
        
        if Robo(ii).Saida(2) > 0
            Robo(ii).Potencia(1) = -Robo(ii).Formula(2);
            Robo(ii).Potencia(2) = Robo(ii).Formula(2);
        elseif Robo(ii).Saida(2) < 0
            Robo(ii).Potencia(1) = Robo(ii).Formula(2);
            Robo(ii).Potencia(2) = -Robo(ii).Formula(2);
        else
            Robo(ii).Potencia(1) = 0;
            Robo(ii).Potencia(2) = 0;
        end
        
    end
end