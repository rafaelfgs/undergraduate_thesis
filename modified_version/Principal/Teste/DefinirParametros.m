%% Seleciona a posição desejada dos Robôs

% Determina o tipo do teste a ser feito
Partida.TipoTeste = TelaJogo.Parametro(1).Value;

% Caso for determinar a potência das rodas
if Partida.TipoTeste == 1
    
    % Finaliza a Demo e habilita os botões
    Partida.EmDemo = false;
    set(TelaJogo.Parametro(2:4),'enable','on')
    
    % Determina as potências para o Robô selecionado
    Robo(TelaJogo.Parametro(2).Value).Potencia = [str2double(TelaJogo.Parametro(3).String);...
                                                  str2double(TelaJogo.Parametro(4).String)];
    
% Caso for traçar a trajetória
elseif Partida.TipoTeste == 2
    
    % Finaliza a Demo e habilita e desabilita os botões
    Partida.EmDemo = false;
    set(TelaJogo.Parametro(2),'enable','on')
    set(TelaJogo.Parametro(3:4),'enable','off')
    
    % Determina a posição desejada do Robô selecionado
    Robo(TelaJogo.Parametro(2).Value).Desejado = ginput(1)';
    
    % Controla de forma simples o movimento do Robô selecionado
    Robo(TelaJogo.Parametro(2).Value).Saida = ControlarSimples(Robo(TelaJogo.Parametro(2).Value).Posicao,...
                                              Robo(TelaJogo.Parametro(2).Value).Desejado,ConstantesINT);

% Caso for iniciar a demo
else
    
    % Inicia a demo e desabilita os botões
    Partida.EmDemo = true;
    set(TelaJogo.Parametro(2:4),'enable','off')
    
end