%% Pausa o jogo

% Se for despausar o jogo
if Partida.Pause == 0
    
    % Despausa o jogo
    Partida.Pause = 1;
    set(TelaJogo.Botao(2),'string','Voltar Jogo')
    
% Se for pausar o jogo
else
    
    % Pausa o jogo
    Partida.Pause = 0;
    set(TelaJogo.Botao(2),'string','Pausar Jogo')
    
end