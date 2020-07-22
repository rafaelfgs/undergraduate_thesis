%% Calibra e segmenta de cores

% Inicia a variável de Calibração
Partida.Calibracao = 1;

% Caso não exista um padrão de calibração, determina um novo padrão
if exist('Calibracao','var') ~= 1
    Calibracao = [ [22;1;3;6;10;14;18]./24 [1;3;6;10;14;18;22]./24 repmat([0 1],7,2)];
end

% Chama a função para criar a tela de calibração
CriarCalibracao

% Desabilita os botões de Parar a Câmera e de Calibração
set(TelaPrincipal.Botao([1 5]),'enable','off')

% Determina se pode ou não habilitar o botão de Iniciar Jogo
if isrunning(Camera.Video) && exist('Relacao','var') && exist('Constantes','var') && Partida.Comunicacao == 1 && Partida.Jogo == 0
    set(TelaPrincipal.Botao(4),'enable','on')
end

% Chama a função para exibir a segmentação da cor escolhida
ProcessarImagem