%% Prepara as vari�veis da Intelig�ncia

% Desabilita o bot�o de preparar a Intelig�ncia
set(TelaPrincipal.Botao(3),'enable','off')

% Limpa a vari�vel da comunica��o com os rob�s
try fclose(instrfindall); catch, end
try fclose(S); catch, end
try delete(S), catch, end
try clear S, catch, end

% Verifica a ConstantesINT no workspace, no arquivo externo ou cria um padr�o
if exist('ConstantesINT','var') ~= 1
    try load ConstantesINT.mat
    catch, PrealocarConstantesINT
    end
end

% Determina a porta de comunica��o utilizada
ConstantesINT.Porta = cell2mat(inputdlg('Porta Serial Utilizada:','Comunica��o',1,{ConstantesINT.Porta}));
if isempty(ConstantesINT.Porta)
    ConstantesINT.Porta = '';
end

% Inicia a comunica��o com os rob�s
if strcmp(ConstantesINT.Porta,'')
    S = ConectarSerial();
else
    S = ConectarSerial({ConstantesINT.Porta});
end

% Verifica se encontrou alguma Serial
if true%size(S,2) > 0
    
    % Inicia o estado da comunica��o
    Partida.EmComunicacao = true;
    
    % Pre-aloca as vari�veis dos Rob�s e da Bola
    PrealocarINT
    
    % Habilita os bot�es da Intelig�ncia
    set(TelaPrincipal.Botao(3:4),'enable','on')
    
    % Determina se pode ou n�o habilitar o bot�o de Iniciar Jogo e Iniciar Teste
    if Partida.EmVideo && exist('Calibracao','var') == 1 && exist('ConstantesPDI','var') == 1 && exist('Relacao','var') == 1
        set(TelaPrincipal.Botao(5:6),'enable','on')
    end
    
else
    
    % Limpa a vari�vel da comunica��o com os rob�s
    try fclose(instrfindall); catch, end
    try fclose(S); catch, end
    try delete(S), catch, end
    try clear S, catch, end
    
    % Reabilita o bot�o de preparar a Intelig�ncia
    set(TelaPrincipal.Botao(3),'enable','on')
    
    % Apresenta uma mensagem de erro
    error('N�o foi poss�vel iniciar a comunica��o com a Serial!')
    
end