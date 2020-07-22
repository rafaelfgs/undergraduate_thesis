%% Seleciona a posição desejada dos Robôs

Partida.Tipo = TelaTeste.Botao(1).Value;

if Partida.Tipo == 1
    
    % Habilita os botões
    set(TelaTeste.Botao(2:4),'enable','on')
    
    % Determina as potências para o Robô selecionado
    Robo(TelaTeste.Botao(2).Value).Potencia = [str2double(TelaTeste.Botao(3).String);...
                                               str2double(TelaTeste.Botao(4).String)];
    
% Caso for traçar a trajetória
elseif Partida.Tipo == 2
    
    % Habilita e desabilita os botões
    set(TelaTeste.Botao(2),'enable','on')
    set(TelaTeste.Botao(3:4),'enable','off')
    
    % Determina a posição desejada do Robô selecionado
    Robo(TelaTeste.Botao(2).Value).Desejado = ginput(1)';

% Caso for iniciar a demo
elseif Partida.Tipo == 3
    
    % Inicia a demo e desabilita os botões
    set(TelaTeste.Botao(2:4),'enable','off')
    Partida.NDemo = 0;
    
    % Determina a primeira posição desejada
    Robo(1).Desejado = 200*[cosd(0);sind(0)];
    Robo(2).Desejado = 200*[cosd(120);sind(120)];
    Robo(3).Desejado = 200*[cosd(240);sind(240)];
    
end