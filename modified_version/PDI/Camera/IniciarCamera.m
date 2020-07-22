%% Configura o Bot�o para Iniciar e Encerrar a Captura de Imagens

% Desabilita o bot�o de Iniciar C�mera
set(TelaPDI.Botao(1),'enable','off')

if ~Partida.EmVideo
    
    % Inicia a captura da C�mera
    start(Camera.Video)
    
    % Inicia o estado do v�deo
    Partida.EmVideo = true;
    
    % Altera os bot�es necess�rios
    set(TelaPDI.Botao(1),'string','Encerrar C�mera')
    set(TelaPDI.Botao([2 4:6]),'enable','on')
    
    % Altera os bot�es em fun��o do tipo da c�mera
    if Camera.Tipo == 2
        set(TelaPDI.Botao(3),'enable','off')
    else
        set(TelaPDI.Botao(3),'enable','on')
    end
    
    % Determina se pode ou n�o habilitar o bot�o de Iniciar Jogo e Iniciar Teste
    if exist('S','var') == 1 && exist('ConstantesINT','var') == 1 && exist('Movimento','var') == 1
        if size(S,2) > 0
            set(TelaPrincipal.Botao(5:6),'enable','on')
        end
    end
    
    % Apresenta uma mensagem
    disp('Captura de v�deo iniciada!')

else
    
    % Encerra a captura da C�mera
    Partida.EmVideo = false;
    closepreview(Camera.Video)
    stop(Camera.Video)
    
    % Altera os bot�es necess�rios
    set(TelaPDI.Botao(1),'string','Iniciar C�mera')
    set(TelaPDI.Botao(4:6),'enable','off')
    set(TelaPrincipal.Botao(5:6),'enable','off')
    
    % Altera os bot�es em fun��o do tipo da c�mera
    if Camera.Tipo == 2
        set(TelaPDI.Botao(2:3),'enable','on')
    else
        set(TelaPDI.Botao(2:3),'enable','off')
    end
    
    % Apresenta uma mensagem
    disp('Captura de v�deo encerrada!')
    
end

% Habilita o bot�o de Iniciar C�mera
set(TelaPDI.Botao(1),'enable','on')