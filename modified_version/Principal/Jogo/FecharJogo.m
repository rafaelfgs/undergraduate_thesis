%% Encerra a execu��o do Jogo e fecha as telas

% Habilita novamente os bot�es
set(TelaPrincipal.Botao(:),'enable','on')

% Finaliza as vari�veis do jogo
Partida.EmDemo = false;
Partida.EmEnvio = false;
Partida.EmJogo = false;
Partida.EmTeste = false;
Partida.ExibeSegmentacao = false;
Partida.ExibeResultados = false;

% Fecha a tela do jogo
closereq
clear TelaJogo