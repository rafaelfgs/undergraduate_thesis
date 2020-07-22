%% Pausa o teste

% Se for despausar o teste
if Partida.Pause == 1
    b=1;
    % Despausa o teste e habilita os botões
    Partida.Pause = 0;
    set(TelaTeste.Botao(1:4),'enable','off')
    set(TelaTeste.Botao(5),'string','Pausar Teste')
    
% Se for pausar o teste
else
    b=0;
    % Pausa o teste
    Partida.Pause = 1;
    set(TelaTeste.Botao(5),'string','Voltar Teste')
    
    % Desabilita os botões
    if Partida.Tipo == 1
        set(TelaTeste.Botao(1:4),'enable','on')
    elseif Partida.Tipo == 2
        set(TelaTeste.Botao(1:2),'enable','on')
    else
        set(TelaTeste.Botao(1),'enable','on')
    end
    
end