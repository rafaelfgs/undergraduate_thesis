%% Inicia a comunicação com computador de PDI

% Se for iniciar a comunicação
if Partida.ComunicacaoPDI == 0
    
    % Inicia a comunicação com o PDI
    Partida.ComunicacaoPDI = 1;
    set(TelaPrincipal.Botao(3),'string','Parar Comunicação PDI')
    
    % Habilita o botão de Iniciar Jogo
    if Partida.ComunicacaoRobos == 1 && exist('Constantes','var')
        set(TelaPrincipal.Botao(1:2),'enable','on')
    end
    
    % Determina o IP e a porta do computador do PDI
    Comunicacao.ip1 = '192.168.0.119';
    Comunicacao.port1 = 13821;
    
    % Determina o IP e a porta do computador da Inteligência
    Comunicacao.ip2 = '192.168.0.180';
    Comunicacao.port2 = 13822;
    
    % Inicia e abre a comunicação pela rede
    Comunicacao.u2 = udp(Comunicacao.ip1,'remoteport',Comunicacao.port1,'localport',Comunicacao.port2);
    fopen(Comunicacao.u2);
    
% Se for parar a comunicação
else
    
    % Para a comunicação com o PDI
    Partida.ComunicacaoPDI = 0;
    set(TelaPrincipal.Botao(3),'string','Iniciar Comunicação PDI')
    
    % Desabilita o botão de Iniciar Jogo
    set(TelaPrincipal.Botao(1:2),'enable','off')
    
    % Finaliza as variáveis de comunicação com o PDI
    try
        fclose(Comunicacao.u2);
        delete(Comunicacao.u2)
        clear Comunicacao
    catch
    end
    
end