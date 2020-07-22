%% Inicia a demonstração

% Se for iniciar a demo
if Partida.EmDemo == 0
    
    % Inicia a demo e desabilita os botões
    Partida.EmDemo = 1;
    set(TelaTeste.Botao(1:4),'enable','off')
    set(TelaTeste.Botao(5),'string','Pausar Demo')
    
    % Determina a primeira posição desejada
    Robo(1).Desejado = 200*[sind(0);cosd(0)];
    Robo(2).Desejado = 200*[cosd(120);sind(120)];
    Robo(3).Desejado = 200*[cosd(240);sind(240)];
    
% Se for pausar a demo
else
    
    % Para a demo e habilita os botões
    Partida.EmDemo = 0;
    set(TelaTeste.Botao(1:4),'enable','on')
    set(TelaTeste.Botao(5),'string','Iniciar Demo')
    
    % Retorna os valores das posições desejadas
    Robo(1).Desejado = Robo(1).Posicao(1:2);
    Robo(2).Desejado = Robo(2).Posicao(1:2);
    Robo(3).Desejado = Robo(3).Posicao(1:2);
    
end