%% Inicia a Rotina do teste

% Desabilita os bot�es necess�rios
set(TelaPrincipal.Botao([1 3 5 6]),'enable','off')

% Inicia a vari�vel de teste
Partida.EmTeste = true;

% Cria a tela para mostrar os resultados
CriarTeste

% Determina o tipo do teste a ser feito
Partida.TipoTeste = TelaJogo.Parametro(1).Value;

% Zera as vari�veis das sa�das dos Rob�s
Robo(1).Potencia = [0;0];
Robo(2).Potencia = [0;0];
Robo(3).Potencia = [0;0];

% Prepara a tela para mosrtrar os resultados
CriarResultados

% Inicia as contagens dos tempos para o Envio e para a Velocidade
Tempo.Acumulado = 0;
Tempo.Desvio = 0;
Tempo.Media = 0;
Tempo.Pause = 0;
Tempo.Demo = tic;
Tempo.TiVeloc = tic;
Tempo.TiEnvio = tic;

% Exibe uma mensagem
disp('Teste Iniciado!')

% Loop para chamar as fun��es, acaba quando parar o jogo
while Partida.EmTeste
    
    % Func�es de rotina do PDI e de organiza��o dos seus resultados
    IniciarPDI
    IniciarINT
    
    % Exibe a Segmenta��o na Tela
    if Partida.EmDemo
        IniciarDemo
    end
    
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