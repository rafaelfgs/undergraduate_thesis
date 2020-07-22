%% Inicia a captura da c�mera

% Se a c�mera estiver parada
if ~isrunning(Camera.Video)
    
    % Inicia a captura
    start(Camera.Video)
    set(TelaPrincipal.Botao(1),'string','Parar C�mera')
    
    % Habilita ou desabilita o bot�o de Otimizar a Imagem, dependendo do formato
    if Camera.Tipo == 1
        set(TelaPrincipal.Botao(3),'enable','on')
    elseif Camera.Tipo == 2
        set(TelaPrincipal.Botao(3),'enable','off')
    end
    
    % Habilita os bot�es que necessitam da c�mera
    set(TelaPrincipal.Botao(5:6),'enable','on')
    
    % Determina se pode ou n�o habilitar o bot�o de Iniciar Jogo
    if exist('Calibracao','var') && exist('Relacao','var') && exist('Constantes','var') && Partida.Comunicacao == 1 && Partida.Jogo == 0
        set(TelaPrincipal.Botao(4),'enable','on')
    end
    
else
    
    % Para a captura
    stop(Camera.Video)
    set(TelaPrincipal.Botao(1),'string','Iniciar C�mera')
    
    % Habilita ou desabilita o bot�o de Otimizar a Imagem, dependendo do formato
    if Camera.Tipo == 1
        set(TelaPrincipal.Botao(3),'enable','off')
    elseif Camera.Tipo == 2
        set(TelaPrincipal.Botao(3),'enable','on')
    end
    
    % Desabilitado o bot�es que necessitam da C�mera
    set(TelaPrincipal.Botao(4:6),'enable','off')
    
end