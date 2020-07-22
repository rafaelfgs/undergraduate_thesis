%% Inicia o teste

% Inicia a variável de teste
Partida.EmTeste = 1;
Partida.Tipo = 1;

% Pre-aloca as variáveis dos Robôs e da Bola
PrealocarVariaveis

% Cria a tela para mostrar os resultados
CriarTeste

% Define os valores das entradas do teste
DefinirParametros

% Inicia a contagem de tempo para cada setor
Tempo.Partida = tic;
Tempo.Robos = tic;
Tempo.Resultados = tic;
Tempo.Demo = tic;

% Loop para chamar as funções, acaba quando parar o jogo
while Partida.EmTeste
    
    % Inicia o controle do Teste
    if toc(Tempo.Partida) >= Constantes.TmaxPartida
        
        Tempo.Partida = tic;
        
        % Chama a função para ler a matriz comunicada
        LerEntradas
        
        if Partida.Tipo == 3
            
            % Frequência em graus por segundo do movimento
            Constantes.Frequencia = 15;
            
            % Movimento do Círculo defasados em 120°
%             Robo(1).Desejado = 200 * [cosd(Constantes.Frequencia*toc(Tempo.Demo)    ); sind(Constantes.Frequencia*toc(Tempo.Demo)    )];
%             Robo(2).Desejado = 200 * [cosd(Constantes.Frequencia*toc(Tempo.Demo)+120); sind(Constantes.Frequencia*toc(Tempo.Demo)+120)];
%             Robo(3).Desejado = 200 * [cosd(Constantes.Frequencia*toc(Tempo.Demo)-120); sind(Constantes.Frequencia*toc(Tempo.Demo)-120)];
            
            % Movimento do Oito defasados em 120°
            Robo(1).Desejado = 200 * [2*sind(Constantes.Frequencia*toc(Tempo.Demo)    ); sind(2*(Constantes.Frequencia*toc(Tempo.Demo)    ))];
            Robo(2).Desejado = 200 * [2*sind(Constantes.Frequencia*toc(Tempo.Demo)+120); sind(2*(Constantes.Frequencia*toc(Tempo.Demo)+120))];
            Robo(3).Desejado = 200 * [2*sind(Constantes.Frequencia*toc(Tempo.Demo)-120); sind(2*(Constantes.Frequencia*toc(Tempo.Demo)-120))];
            
        end
        
        if Partida.Tipo ~= 1
            
            % Controla a velocidade das rodas do Robô 1
            Robo(1).Saida = ControlarRobo(Robo(1).Posicao,Robo(1).Desejado,Constantes);
            
            % Controla a velocidade das rodas do Robô 2
            Robo(2).Saida = ControlarRobo(Robo(2).Posicao,Robo(2).Desejado,Constantes);
            
            % Controla a velocidade das rodas do Robô 3
            Robo(3).Saida = ControlarRobo(Robo(3).Posicao,Robo(3).Desejado,Constantes);
            
            % Converte as saídas de velocidade para potência
            DeterminarPotencias
            
        end
        
        Saida.Potencia = (1-Partida.Pause) .* Constantes.Ganho .* [Robo(1).Potencia';Robo(2).Potencia';Robo(3).Potencia'];
        
    end
    
    % Cria o pacote e envia as potências de cada roda para os Robôs (rodas invertidas)
    if toc(Tempo.Robos) >= Constantes.TmaxRobos
        
        Tempo.Robos = tic;
        
        % Correção do sentido e da ordem das rodas
        Saida.Potencia = Saida.Potencia(:,2:-1:1);
        
        % Monta e envia o pacote para os robôs
        Saida.Pacote = MontarPacote([Saida.Potencia(1,:) Saida.Potencia(2,:) Saida.Potencia(3,:)]);
        % EnviarPacote(S,Saida.Pacote)
        
    end
    
    % Chama a função para Exibir os Resultados
    if toc(Tempo.Resultados) >= Constantes.TmaxResult
        Tempo.Resultados = tic;
        ExibirTeste
    end
    
    % Força as mudanças realizadas nesse loop
    drawnow
    
end