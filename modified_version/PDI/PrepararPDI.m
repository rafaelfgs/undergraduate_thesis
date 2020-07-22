%% Prepara as variáveis do PDI

% Desabilita o botão de preparar o PDI
set(TelaPrincipal.Botao(1),'enable','off')

% Limpa a variável da câmera
try closepreview(Camera.Video), catch, end
try stop(Camera.Video), catch, end
delete(imaqfind)
clear Camera

% Inicia o estado do vídeo
Partida.EmVideo = true;

% Configura a câmera
ConfigurarCamera

% Inicia a captura de imagens
IniciarCaptura

% Pré aloca as variáveis necessárias para o PDI
PrealocarPDI

% Verifica a Calibracao no arquivo externo ou cria um padrão
try load Calibracao.mat
catch, PrealocarCalibracao
end

% Verifica a ConstantesPDI no arquivo externo ou cria um padrão
try load ConstantesPDI.mat
catch, PrealocarConstantesPDI
end

% Verifica a Relacao no arquivo externo ou cria um padrão
try load Relacao.mat
catch, PrealocarRelacao
end

% Habilita o botão de opções do PDI
set(TelaPrincipal.Botao(2),'enable','on')

% Determina se pode ou não habilitar o botão de Iniciar Jogo e Iniciar Teste
if Partida.EmComunicacao && exist('ConstantesINT','var') == 1
    set(TelaPrincipal.Botao(5:6),'enable','on')
end

% Apresenta uma mensagem
disp('Captura de vídeo iniciada!')

% Habilita o botão de preparar o PDI
set(TelaPrincipal.Botao(1),'enable','on')