%% Encerra a execução do Jogo e fecha as telas

% Habilita novamente os botões
set(TelaPrincipal.Botao(:),'enable','on')

% Finaliza as variáveis do jogo
Partida.EmDemo = false;
Partida.EmEnvio = false;
Partida.EmJogo = false;
Partida.EmTeste = false;
Partida.ExibeSegmentacao = false;
Partida.ExibeResultados = false;

% Fecha a tela do jogo
closereq
clear TelaJogo