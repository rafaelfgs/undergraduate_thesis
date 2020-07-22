%% Inicia a comunica��o do computador do PDI

% Verifica se n�o est� comunicando
if Partida.Comunicacao == 0
    
    % Inicia a comunica��o
    Partida.Comunicacao = 1;
    set(TelaPrincipal.Botao(7),'string','Finalizar Comunica��o')
    
    % Determina se pode ou n�o habilitar o bot�o de Iniciar Jogo
    if isrunning(Camera.Video) && exist('Calibracao','var') && exist('Relacao','var') && exist('Constantes','var') && Partida.Jogo == 0
        set(TelaPrincipal.Botao(4),'enable','on')
    end
    
    % Determina o IP e a porta do computador do PDI
%     Comunicacao.IP1 = '192.168.0.119';
    Comunicacao.IP1 = '192.168.0.171';
    Comunicacao.Port1 = 13821;
    
    % Determina o IP e a porta do computador da Intelig�ncia
    Comunicacao.IP2 = '192.168.0.180';
    Comunicacao.Port2 = 13822;
    
    % Cria e abre a comunica��o pela rede
    %Comunicacao.U1 = udp(Comunicacao.IP2,'remoteport',Comunicacao.Port2,'localport',Comunicacao.Port1);
    % Linha para comunicar com o computador da intelig�ncia
     Comunicacao.U1 = udp(Comunicacao.IP2,Comunicacao.Port2,'LocalPort',Comunicacao.Port1);
    fopen(Comunicacao.U1);
    
% Verifica se est� comunicando
else
    
    % Finaliza a comunica��o
    Partida.Comunicacao = 0;
    set(TelaPrincipal.Botao(7),'string','Iniciar Comunica��o')
    set(TelaPrincipal.Botao(4),'enable','off')
    
    % Fecha e exclui a comunica��o
    fclose(Comunicacao.U1);
    delete(Comunicacao.U1)
    clear Comunicacao
    
end