%% Inicia a captura da câmera

% Se a câmera estiver parada
if ~isrunning(Camera.Video)
    
    % Inicia a captura
    start(Camera.Video)
    set(TelaPrincipal.Botao(1),'string','Parar Câmera')
    
    % Habilita ou desabilita o botão de Otimizar a Imagem, dependendo do formato
    if Camera.Tipo == 1
        set(TelaPrincipal.Botao(3),'enable','on')
    elseif Camera.Tipo == 2
        set(TelaPrincipal.Botao(3),'enable','off')
    end
    
    % Habilita os botões que necessitam da câmera
    set(TelaPrincipal.Botao(5:6),'enable','on')
    
    % Determina se pode ou não habilitar o botão de Iniciar Jogo
    if exist('Calibracao','var') && exist('Relacao','var') && exist('Constantes','var') && Partida.Comunicacao == 1 && Partida.Jogo == 0
        set(TelaPrincipal.Botao(4),'enable','on')
    end
    
else
    
    % Para a captura
    stop(Camera.Video)
    set(TelaPrincipal.Botao(1),'string','Iniciar Câmera')
    
    % Habilita ou desabilita o botão de Otimizar a Imagem, dependendo do formato
    if Camera.Tipo == 1
        set(TelaPrincipal.Botao(3),'enable','off')
    elseif Camera.Tipo == 2
        set(TelaPrincipal.Botao(3),'enable','on')
    end
    
    % Desabilitado o botões que necessitam da Câmera
    set(TelaPrincipal.Botao(4:6),'enable','off')
    
end