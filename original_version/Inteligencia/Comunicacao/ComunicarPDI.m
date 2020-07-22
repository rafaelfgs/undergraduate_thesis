%% Inicia a comunica��o com computador de PDI

% Se for iniciar a comunica��o
if Partida.ComunicacaoPDI == 0
    
    % Inicia a comunica��o com o PDI
    Partida.ComunicacaoPDI = 1;
    set(TelaPrincipal.Botao(3),'string','Parar Comunica��o PDI')
    
    % Habilita o bot�o de Iniciar Jogo
    if Partida.ComunicacaoRobos == 1 && exist('Constantes','var')
        set(TelaPrincipal.Botao(1:2),'enable','on')
    end
    
    % Determina o IP e a porta do computador do PDI
    Comunicacao.ip1 = '192.168.0.119';
    Comunicacao.port1 = 13821;
    
    % Determina o IP e a porta do computador da Intelig�ncia
    Comunicacao.ip2 = '192.168.0.180';
    Comunicacao.port2 = 13822;
    
    % Inicia e abre a comunica��o pela rede
    Comunicacao.u2 = udp(Comunicacao.ip1,'remoteport',Comunicacao.port1,'localport',Comunicacao.port2);
    fopen(Comunicacao.u2);
    
% Se for parar a comunica��o
else
    
    % Para a comunica��o com o PDI
    Partida.ComunicacaoPDI = 0;
    set(TelaPrincipal.Botao(3),'string','Iniciar Comunica��o PDI')
    
    % Desabilita o bot�o de Iniciar Jogo
    set(TelaPrincipal.Botao(1:2),'enable','off')
    
    % Finaliza as vari�veis de comunica��o com o PDI
    try
        fclose(Comunicacao.u2);
        delete(Comunicacao.u2)
        clear Comunicacao
    catch
    end
    
end