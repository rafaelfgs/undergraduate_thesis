%% Configura o Botão para Iniciar e Encerrar a Captura de Imagens

% Desabilita o botão de Iniciar Câmera
set(TelaPDI.Botao(1),'enable','off')

if ~Partida.EmVideo
    
    % Inicia a captura da Câmera
    start(Camera.Video)
    
    % Inicia o estado do vídeo
    Partida.EmVideo = true;
    
    % Altera os botões necessários
    set(TelaPDI.Botao(1),'string','Encerrar Câmera')
    set(TelaPDI.Botao([2 4:6]),'enable','on')
    
    % Altera os botões em função do tipo da câmera
    if Camera.Tipo == 2
        set(TelaPDI.Botao(3),'enable','off')
    else
        set(TelaPDI.Botao(3),'enable','on')
    end
    
    % Determina se pode ou não habilitar o botão de Iniciar Jogo e Iniciar Teste
    if exist('S','var') == 1 && exist('ConstantesINT','var') == 1 && exist('Movimento','var') == 1
        if size(S,2) > 0
            set(TelaPrincipal.Botao(5:6),'enable','on')
        end
    end
    
    % Apresenta uma mensagem
    disp('Captura de vídeo iniciada!')

else
    
    % Encerra a captura da Câmera
    Partida.EmVideo = false;
    closepreview(Camera.Video)
    stop(Camera.Video)
    
    % Altera os botões necessários
    set(TelaPDI.Botao(1),'string','Iniciar Câmera')
    set(TelaPDI.Botao(4:6),'enable','off')
    set(TelaPrincipal.Botao(5:6),'enable','off')
    
    % Altera os botões em função do tipo da câmera
    if Camera.Tipo == 2
        set(TelaPDI.Botao(2:3),'enable','on')
    else
        set(TelaPDI.Botao(2:3),'enable','off')
    end
    
    % Apresenta uma mensagem
    disp('Captura de vídeo encerrada!')
    
end

% Habilita o botão de Iniciar Câmera
set(TelaPDI.Botao(1),'enable','on')