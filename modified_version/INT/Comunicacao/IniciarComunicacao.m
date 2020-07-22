%% Configura o Botão para Iniciar e Encerrar a Comunicação com os Robôs

if ~Partida.EmComunicacao
    
    % Inicia a comunicação com os robôs
    S = ConectarSerial({ConstantesINT.Porta});
    
    % Verifica se encontrou alguma Serial
    if size(S,2) > 0
        
        % Inicia o estado da comunicação
        Partida.EmComunicacao = true;
        
        % Altera os botões necessários
        set(TelaINT.Botao(1),'string','Encerrar Comunicação')
        set(TelaINT.Edit(1),'enable','off')
        
        % Determina se pode ou não habilitar o botão de Iniciar Jogo e Iniciar Teste
        if exist('Camera','var') == 1 && exist('Calibracao','var') == 1 && ...
                exist('ConstantesPDI','var') == 1 && exist('Relacao','var') == 1
            if isrunning(Camera.Video)
                set(TelaPrincipal.Botao(5:6),'enable','on')
            end
        end
        
    else
        
        % Limpa a variável da comunicação com os robôs
        try fclose(instrfindall); catch, end
        try fclose(S); catch, end
        try delete(S), catch, end
        try clear S, catch, end
        
        % Apresenta uma mensagem de erro
        disp('Não foi possível iniciar a comunicação com a Serial!')
        
    end
    
else
    
    % Limpa a variável da comunicação com os robôs
    Partida.EmComunicacao = false;
    try fclose(instrfindall); catch, end
    try fclose(S); catch, end
    try delete(S), catch, end
    try clear S, catch, end
    
    % Altera os botões necessários
    set(TelaINT.Botao(1),'string','Iniciar Comunicação')
    set(TelaINT.Edit(1),'enable','on')
    set(TelaPrincipal.Botao(5:6),'enable','off')
    
end