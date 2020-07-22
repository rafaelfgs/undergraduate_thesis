%% Inicia a comunica��o com os Rob�s

% Se for iniciar a comunica��o
if Partida.ComunicacaoRobos == 0
    
    % Tenta iniciar a comunica��o com os rob�s pela COM desejada
    try
        
        S = ConectarSerial({'com4'});
        
        % Refaz a comunica��o com o PDI, caso esteja iniciada
        if Partida.ComunicacaoPDI == 1
            ComunicarPDI
        end
        
    catch
    end
    
    % Se conseguir conectar com os rob�s
    % if exist('S','var')
        
        % Inicia a comunica��o com os rob�s
        Partida.ComunicacaoRobos = 1;
        set(TelaPrincipal.Botao(4),'string','Parar Comunica��o Rob�s')
        
        % Habilita o bot�o de Iniciar Jogo
        if Partida.ComunicacaoPDI == 1 && exist('Constantes','var')
            set(TelaPrincipal.Botao(1:2),'enable','on')
        end
        
    % end
    
% Se for parar a comunica��o
else
    
    % Para a comunica��o com os rob�s
    Partida.ComunicacaoRobos = 0;
    set(TelaPrincipal.Botao(4),'string','Iniciar Comunica��o Rob�s')
    
    % Desabilita o bot�o de Iniciar Jogo
    set(TelaPrincipal.Botao(1:2),'Enable','off')
    
    % Finaliza a comunica��o com os rob�s
    try
        fclose(S);
        delete(S)
        clear S
    catch
    end
    
end