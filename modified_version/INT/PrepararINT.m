%% Prepara as variáveis da Inteligência

% Desabilita o botão de preparar a Inteligência
set(TelaPrincipal.Botao(3),'enable','off')

% Limpa a variável da comunicação com os robôs
try fclose(instrfindall); catch, end
try fclose(S); catch, end
try delete(S), catch, end
try clear S, catch, end

% Verifica a ConstantesINT no workspace, no arquivo externo ou cria um padrão
if exist('ConstantesINT','var') ~= 1
    try load ConstantesINT.mat
    catch, PrealocarConstantesINT
    end
end

% Determina a porta de comunicação utilizada
ConstantesINT.Porta = cell2mat(inputdlg('Porta Serial Utilizada:','Comunicação',1,{ConstantesINT.Porta}));
if isempty(ConstantesINT.Porta)
    ConstantesINT.Porta = '';
end

% Inicia a comunicação com os robôs
if strcmp(ConstantesINT.Porta,'')
    S = ConectarSerial();
else
    S = ConectarSerial({ConstantesINT.Porta});
end

% Verifica se encontrou alguma Serial
if true%size(S,2) > 0
    
    % Inicia o estado da comunicação
    Partida.EmComunicacao = true;
    
    % Pre-aloca as variáveis dos Robôs e da Bola
    PrealocarINT
    
    % Habilita os botões da Inteligência
    set(TelaPrincipal.Botao(3:4),'enable','on')
    
    % Determina se pode ou não habilitar o botão de Iniciar Jogo e Iniciar Teste
    if Partida.EmVideo && exist('Calibracao','var') == 1 && exist('ConstantesPDI','var') == 1 && exist('Relacao','var') == 1
        set(TelaPrincipal.Botao(5:6),'enable','on')
    end
    
else
    
    % Limpa a variável da comunicação com os robôs
    try fclose(instrfindall); catch, end
    try fclose(S); catch, end
    try delete(S), catch, end
    try clear S, catch, end
    
    % Reabilita o botão de preparar a Inteligência
    set(TelaPrincipal.Botao(3),'enable','on')
    
    % Apresenta uma mensagem de erro
    error('Não foi possível iniciar a comunicação com a Serial!')
    
end