%% Programa para definir as posi��es e velocidades dos Rob�s e da Bola

% Inicia a vari�vel do jogo
Partida.Jogo = 1;

% Chama a fun��o para ler e pr� alocar as vari�veis
PrealocarVariaveis

% Chama a fun��o para criar a tela de jogo
CriarJogo

% Inicia a contagem dos tempos e o valor de tempo m�ximo
Tempo.TiVeloc = tic;
Tempo.TiEnviar = tic;

Distancia.Anterior1 = [999;999];
Distancia.Anterior2 = [999;999];
Distancia.Anterior3 = [999;999];

% MediaDist=zeros(1,2);MediaArea=zeros(1,2);t= 0;

% Cria um loop at� a partida sair de execu��o
while Partida.Jogo == 1
    
    % Chama a fun��o que cont�m a rotina de jogo
    IniciarRotina
    
    drawnow
    
end

% ti=tic;n=n+1;to=(1000*toc(ti)+(n-1)*to)/n;