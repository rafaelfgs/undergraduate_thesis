%% Programa para definir as posições e velocidades dos Robôs e da Bola

% Inicia a variável do jogo
Partida.Jogo = 1;

% Chama a função para ler e pré alocar as variáveis
PrealocarVariaveis

% Chama a função para criar a tela de jogo
CriarJogo

% Inicia a contagem dos tempos e o valor de tempo máximo
Tempo.TiVeloc = tic;
Tempo.TiEnviar = tic;

Distancia.Anterior1 = [999;999];
Distancia.Anterior2 = [999;999];
Distancia.Anterior3 = [999;999];

% MediaDist=zeros(1,2);MediaArea=zeros(1,2);t= 0;

% Cria um loop até a partida sair de execução
while Partida.Jogo == 1
    
    % Chama a função que contém a rotina de jogo
    IniciarRotina
    
    drawnow
    
end

% ti=tic;n=n+1;to=(1000*toc(ti)+(n-1)*to)/n;