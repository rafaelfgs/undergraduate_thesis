%% Inicia o jogo

% Inicia o jogo
Partida.EmJogo = 1;

% Determina o lado do nosso campo (-1 para a esquerda e 1 para a direita)
Partida.Campo = TelaPrincipal.Campo.SelectedObject.Position(1)*4-1;

% Pre-aloca as variáveis dos Robôs e da Bola
PrealocarVariaveis

% Chama a função para selecionar os Robôs
SelecionarRobo

% Cria a tela para mostrar os resultados
CriarJogo

% Inicia a contagem de tempo para cada setor
Tempo.Partida = tic;
Tempo.Robos = tic;
Tempo.Resultados = tic;

% Loop para chamar as funções, acaba quando parar o jogo
while Partida.EmJogo
    
    % Inicia o controle da Partida
    if toc(Tempo.Partida) >= Constantes.TmaxPartida
        
        Tempo.Partida = tic;
        
        % Chama a função para ler a matriz comunicada
        LerEntradas
        
        % Controla o Robô 1
        if Robo(1).Ativado == 1
            if strcmp(Robo(1).Funcao,'Goleiro')
                Robo(1) = GoleiroControle(Robo(1),Adv,Bola,Constantes,Partida.Campo);
            elseif strcmp(Robo(1).Funcao,'Zagueiro')
                Robo(1) = ZagueiroControle(Robo(1),Adv,Bola,Constantes,Partida.Campo);
            elseif strcmp(Robo(1).Funcao,'Atacante')
                Robo(1) = AtacanteControle(Robo(1),Adv,Bola,Constantes,Partida.Campo);
            end
            Robo(1).SaidaD = Robo(1).Saida;
        else
            Robo(1).SaidaD = [0;0];
        end
        
        % Controla o Robô 2
        if Robo(2).Ativado == 1
            if strcmp(Robo(2).Funcao,'Goleiro')
                Robo(2) = GoleiroControle(Robo(2),Adv,Bola,Constantes,Partida.Campo);
            elseif strcmp(Robo(2).Funcao,'Zagueiro')
                Robo(2) = ZagueiroControle(Robo(2),Adv,Bola,Constantes,Partida.Campo);
            elseif strcmp(Robo(2).Funcao,'Atacante')
                Robo(2) = AtacanteControle(Robo(2),Adv,Bola,Constantes,Partida.Campo);
            end
            Robo(2).SaidaD = Robo(2).Saida;
        else
            Robo(2).SaidaD = [0;0];
        end
        
        % Controla o Robô 3
        if Robo(3).Ativado == 1
            if strcmp(Robo(3).Funcao,'Goleiro')
                Robo(3) = GoleiroControle(Robo(3),Adv,Bola,Constantes,Partida.Campo);
            elseif strcmp(Robo(3).Funcao,'Zagueiro')
                Robo(3) = ZagueiroControle(Robo(3),Adv,Bola,Constantes,Partida.Campo);
            elseif strcmp(Robo(3).Funcao,'Atacante')
                Robo(3) = AtacanteControle(Robo(3),Adv,Bola,Constantes,Partida.Campo);
            end
            Robo(3).SaidaD = Robo(3).Saida;
        else
            Robo(3).SaidaD = [0;0];
        end
        
        % Converte as saídas de velocidade para potência
        DeterminarPotencias
        
        Saida.Potencia = (1-Partida.Pause) .* Constantes.Ganho .* [Robo(1).Potencia';Robo(2).Potencia';Robo(3).Potencia'];
        
    end
    
    % Cria o pacote e envia as potências de cada roda para os Robôs
    if toc(Tempo.Robos) >= Constantes.TmaxRobos
        
        Tempo.Robos = tic;
        
        % Correção do sentido e da ordem das rodas
        Saida.Potencia = -Saida.Potencia(:,2:-1:1);
        
        % Monta e envia o pacote para os robôs
        Saida.Pacote = MontarPacote([Saida.Potencia(1,2:-1:1) Saida.Potencia(2,2:-1:1) Saida.Potencia(3,2:-1:1)]);
        % EnviarPacote(S,Saida.Pacote)
        
    end
    
    % Chama a função para Mostrar Resultados, se necessário
    if toc(Tempo.Resultados) >= Constantes.TmaxResult && Partida.Resultados == 1
        Tempo.Resultados = tic;
        ExibirResultados
    end
    
    % Força as mudanças realizadas nesse loop
    drawnow
    
end