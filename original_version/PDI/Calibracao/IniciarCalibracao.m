%% Calibra e segmenta de cores

% Inicia a vari�vel de Calibra��o
Partida.Calibracao = 1;

% Caso n�o exista um padr�o de calibra��o, determina um novo padr�o
if exist('Calibracao','var') ~= 1
    Calibracao = [ [22;1;3;6;10;14;18]./24 [1;3;6;10;14;18;22]./24 repmat([0 1],7,2)];
end

% Chama a fun��o para criar a tela de calibra��o
CriarCalibracao

% Desabilita os bot�es de Parar a C�mera e de Calibra��o
set(TelaPrincipal.Botao([1 5]),'enable','off')

% Determina se pode ou n�o habilitar o bot�o de Iniciar Jogo
if isrunning(Camera.Video) && exist('Relacao','var') && exist('Constantes','var') && Partida.Comunicacao == 1 && Partida.Jogo == 0
    set(TelaPrincipal.Botao(4),'enable','on')
end

% Chama a fun��o para exibir a segmenta��o da cor escolhida
ProcessarImagem