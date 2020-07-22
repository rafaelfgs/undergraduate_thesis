%% Inicia a comunicação do computador do PDI

% Verifica se não está comunicando
if Partida.Comunicacao == 0
    
    % Inicia a comunicação
    Partida.Comunicacao = 1;
    set(TelaPrincipal.Botao(7),'string','Finalizar Comunicação')
    
    % Determina se pode ou não habilitar o botão de Iniciar Jogo
    if isrunning(Camera.Video) && exist('Calibracao','var') && exist('Relacao','var') && exist('Constantes','var') && Partida.Jogo == 0
        set(TelaPrincipal.Botao(4),'enable','on')
    end
    
    % Determina o IP e a porta do computador do PDI
%     Comunicacao.IP1 = '192.168.0.119';
    Comunicacao.IP1 = '192.168.0.171';
    Comunicacao.Port1 = 13821;
    
    % Determina o IP e a porta do computador da Inteligência
    Comunicacao.IP2 = '192.168.0.180';
    Comunicacao.Port2 = 13822;
    
    % Cria e abre a comunicação pela rede
    %Comunicacao.U1 = udp(Comunicacao.IP2,'remoteport',Comunicacao.Port2,'localport',Comunicacao.Port1);
    % Linha para comunicar com o computador da inteligência
     Comunicacao.U1 = udp(Comunicacao.IP2,Comunicacao.Port2,'LocalPort',Comunicacao.Port1);
    fopen(Comunicacao.U1);
    
% Verifica se está comunicando
else
    
    % Finaliza a comunicação
    Partida.Comunicacao = 0;
    set(TelaPrincipal.Botao(7),'string','Iniciar Comunicação')
    set(TelaPrincipal.Botao(4),'enable','off')
    
    % Fecha e exclui a comunicação
    fclose(Comunicacao.U1);
    delete(Comunicacao.U1)
    clear Comunicacao
    
end