%% Prepara as vari�veis do PDI

% Desabilita o bot�o de preparar o PDI
set(TelaPrincipal.Botao(1),'enable','off')

% Limpa a vari�vel da c�mera
try closepreview(Camera.Video), catch, end
try stop(Camera.Video), catch, end
delete(imaqfind)
clear Camera

% Inicia o estado do v�deo
Partida.EmVideo = true;

% Configura a c�mera
ConfigurarCamera

% Inicia a captura de imagens
IniciarCaptura

% Pr� aloca as vari�veis necess�rias para o PDI
PrealocarPDI

% Verifica a Calibracao no arquivo externo ou cria um padr�o
try load Calibracao.mat
catch, PrealocarCalibracao
end

% Verifica a ConstantesPDI no arquivo externo ou cria um padr�o
try load ConstantesPDI.mat
catch, PrealocarConstantesPDI
end

% Verifica a Relacao no arquivo externo ou cria um padr�o
try load Relacao.mat
catch, PrealocarRelacao
end

% Habilita o bot�o de op��es do PDI
set(TelaPrincipal.Botao(2),'enable','on')

% Determina se pode ou n�o habilitar o bot�o de Iniciar Jogo e Iniciar Teste
if Partida.EmComunicacao && exist('ConstantesINT','var') == 1
    set(TelaPrincipal.Botao(5:6),'enable','on')
end

% Apresenta uma mensagem
disp('Captura de v�deo iniciada!')

% Habilita o bot�o de preparar o PDI
set(TelaPrincipal.Botao(1),'enable','on')