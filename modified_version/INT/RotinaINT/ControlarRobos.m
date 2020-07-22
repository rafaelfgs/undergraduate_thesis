%% Controla os Robôs Ativos

% Controla o Robô 1
if Robo(1).Ativo
    if strcmp(Robo(1).Funcao,'Goleiro')
        Robo(1) = GoleiroControle(Robo(1),Adv,Bola,ConstantesINT);
    elseif strcmp(Robo(1).Funcao,'Zagueiro')
        Robo(1) = ZagueiroControle(Robo(1),Adv,Bola,ConstantesINT);
    elseif strcmp(Robo(1).Funcao,'Atacante')
        Robo(1) = AtacanteControle(Robo(1),Adv,Bola,ConstantesINT);
    end
else
    Robo(1).Saida = [0;0];
end

% Controla o Robô 2
if Robo(2).Ativo
    if strcmp(Robo(2).Funcao,'Goleiro')
        Robo(2) = GoleiroControle(Robo(2),Adv,Bola,ConstantesINT);
    elseif strcmp(Robo(2).Funcao,'Zagueiro')
        Robo(2) = ZagueiroControle(Robo(2),Adv,Bola,ConstantesINT);
    elseif strcmp(Robo(2).Funcao,'Atacante')
        Robo(2) = AtacanteControle(Robo(2),Adv,Bola,ConstantesINT);
    end
else
    Robo(2).Saida = [0;0];
end

% Controla o Robô 3
if Robo(3).Ativo
    if strcmp(Robo(3).Funcao,'Goleiro')
        Robo(3) = GoleiroControle(Robo(3),Adv,Bola,ConstantesINT);
    elseif strcmp(Robo(3).Funcao,'Zagueiro')
        Robo(3) = ZagueiroControle(Robo(3),Adv,Bola,ConstantesINT);
    elseif strcmp(Robo(3).Funcao,'Atacante')
        Robo(3) = AtacanteControle(Robo(3),Adv,Bola,ConstantesINT);
    end
else
    Robo(3).Saida = [0;0];
end