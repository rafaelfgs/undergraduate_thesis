%% Seleciona a Função dos Robôs

% Determina a Função do Robô 1
if TelaPrincipal.AtivRobo(1).Value == 1
    Robo(1).Ativado = 1;
    if TelaPrincipal.FuncRobo(1).SelectedObject.Position(1)*3+1 == 1
        Robo(1).Funcao = 'Goleiro';
    elseif TelaPrincipal.FuncRobo(1).SelectedObject.Position(1)*3+1 == 2
        Robo(1).Funcao = 'Zagueiro';
    elseif TelaPrincipal.FuncRobo(1).SelectedObject.Position(1)*3+1 == 3
        Robo(1).Funcao = 'Atacante';
    end
else
    Robo(1).Ativado = 0;
end

% Determina a Função do Robô 2
if TelaPrincipal.AtivRobo(2).Value == 1
    Robo(2).Ativado = 1;
    if TelaPrincipal.FuncRobo(2).SelectedObject.Position(1)*3+1 == 1
        Robo(2).Funcao = 'Goleiro';
    elseif TelaPrincipal.FuncRobo(2).SelectedObject.Position(1)*3+1 == 2
        Robo(2).Funcao = 'Zagueiro';
    elseif TelaPrincipal.FuncRobo(2).SelectedObject.Position(1)*3+1 == 3
        Robo(2).Funcao = 'Atacante';
    end
else
    Robo(2).Ativado = 0;
end

% Determina a Função do Robô 3
if TelaPrincipal.AtivRobo(3).Value == 1
    Robo(3).Ativado = 1;
    if TelaPrincipal.FuncRobo(3).SelectedObject.Position(1)*3+1 == 1
        Robo(3).Funcao = 'Goleiro';
    elseif TelaPrincipal.FuncRobo(3).SelectedObject.Position(1)*3+1 == 2
        Robo(3).Funcao = 'Zagueiro';
    elseif TelaPrincipal.FuncRobo(3).SelectedObject.Position(1)*3+1 == 3
        Robo(3).Funcao = 'Atacante';
    end
else
    Robo(3).Ativado = 0;
end