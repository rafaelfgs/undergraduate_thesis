%% Inicia a Rotina de Jogo

% Desabilita os bot�es necess�rios
set(TelaPrincipal.Botao([1 3 5 6]),'enable','off')

% Inicia a vari�vel do jogo
Partida.EmJogo = true;

% Chama a fun��o para criar a tela de jogo
CriarJogo

% Inicia as contagens dos tempos para o Envio e para a Velocidade
Tempo.Acumulado = 0;
Tempo.Desvio = 0;
Tempo.Media = 0;
Tempo.Pause = 0;
Tempo.TiEnvio = tic;
Tempo.TiVeloc = tic;

% Exibe uma mensagem
disp('Jogo Iniciado!')

% Cria um loop at� o jogo sair de execu��o
while Partida.EmJogo
    
    % Func�es de rotina do PDI e da Intelig�ncia
    IniciarPDI
    IniciarINT
    
    % Exibe a Segmenta��o na Tela
    if Partida.ExibeSegmentacao
        ExibirSegmentacao
    end
    
    % Exibe os Resultados na Tela
    if Partida.ExibeResultados
        ExibirResultados
    end
    
    % Envia os Dados
    if Partida.EmEnvio
        EnviarDados
    end
    
    drawnow
    
end