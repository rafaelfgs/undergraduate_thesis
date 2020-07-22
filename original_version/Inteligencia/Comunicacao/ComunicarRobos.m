%% Inicia a comunicação com os Robôs

% Se for iniciar a comunicação
if Partida.ComunicacaoRobos == 0
    
    % Tenta iniciar a comunicação com os robôs pela COM desejada
    try
        
        S = ConectarSerial({'com4'});
        
        % Refaz a comunicação com o PDI, caso esteja iniciada
        if Partida.ComunicacaoPDI == 1
            ComunicarPDI
        end
        
    catch
    end
    
    % Se conseguir conectar com os robôs
    % if exist('S','var')
        
        % Inicia a comunicação com os robôs
        Partida.ComunicacaoRobos = 1;
        set(TelaPrincipal.Botao(4),'string','Parar Comunicação Robôs')
        
        % Habilita o botão de Iniciar Jogo
        if Partida.ComunicacaoPDI == 1 && exist('Constantes','var')
            set(TelaPrincipal.Botao(1:2),'enable','on')
        end
        
    % end
    
% Se for parar a comunicação
else
    
    % Para a comunicação com os robôs
    Partida.ComunicacaoRobos = 0;
    set(TelaPrincipal.Botao(4),'string','Iniciar Comunicação Robôs')
    
    % Desabilita o botão de Iniciar Jogo
    set(TelaPrincipal.Botao(1:2),'Enable','off')
    
    % Finaliza a comunicação com os robôs
    try
        fclose(S);
        delete(S)
        clear S
    catch
    end
    
end