%% Configura o Bot�o para Iniciar e Encerrar a Comunica��o com os Rob�s

if ~Partida.EmComunicacao
    
    % Inicia a comunica��o com os rob�s
    S = ConectarSerial({ConstantesINT.Porta});
    
    % Verifica se encontrou alguma Serial
    if size(S,2) > 0
        
        % Inicia o estado da comunica��o
        Partida.EmComunicacao = true;
        
        % Altera os bot�es necess�rios
        set(TelaINT.Botao(1),'string','Encerrar Comunica��o')
        set(TelaINT.Edit(1),'enable','off')
        
        % Determina se pode ou n�o habilitar o bot�o de Iniciar Jogo e Iniciar Teste
        if exist('Camera','var') == 1 && exist('Calibracao','var') == 1 && ...
                exist('ConstantesPDI','var') == 1 && exist('Relacao','var') == 1
            if isrunning(Camera.Video)
                set(TelaPrincipal.Botao(5:6),'enable','on')
            end
        end
        
    else
        
        % Limpa a vari�vel da comunica��o com os rob�s
        try fclose(instrfindall); catch, end
        try fclose(S); catch, end
        try delete(S), catch, end
        try clear S, catch, end
        
        % Apresenta uma mensagem de erro
        disp('N�o foi poss�vel iniciar a comunica��o com a Serial!')
        
    end
    
else
    
    % Limpa a vari�vel da comunica��o com os rob�s
    Partida.EmComunicacao = false;
    try fclose(instrfindall); catch, end
    try fclose(S); catch, end
    try delete(S), catch, end
    try clear S, catch, end
    
    % Altera os bot�es necess�rios
    set(TelaINT.Botao(1),'string','Iniciar Comunica��o')
    set(TelaINT.Edit(1),'enable','on')
    set(TelaPrincipal.Botao(5:6),'enable','off')
    
end