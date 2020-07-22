%% Seleciona a posi��o desejada dos Rob�s

% Determina o tipo do teste a ser feito
Partida.TipoTeste = TelaJogo.Parametro(1).Value;

% Caso for determinar a pot�ncia das rodas
if Partida.TipoTeste == 1
    
    % Finaliza a Demo e habilita os bot�es
    Partida.EmDemo = false;
    set(TelaJogo.Parametro(2:4),'enable','on')
    
    % Determina as pot�ncias para o Rob� selecionado
    Robo(TelaJogo.Parametro(2).Value).Potencia = [str2double(TelaJogo.Parametro(3).String);...
                                                  str2double(TelaJogo.Parametro(4).String)];
    
% Caso for tra�ar a trajet�ria
elseif Partida.TipoTeste == 2
    
    % Finaliza a Demo e habilita e desabilita os bot�es
    Partida.EmDemo = false;
    set(TelaJogo.Parametro(2),'enable','on')
    set(TelaJogo.Parametro(3:4),'enable','off')
    
    % Determina a posi��o desejada do Rob� selecionado
    Robo(TelaJogo.Parametro(2).Value).Desejado = ginput(1)';
    
    % Controla de forma simples o movimento do Rob� selecionado
    Robo(TelaJogo.Parametro(2).Value).Saida = ControlarSimples(Robo(TelaJogo.Parametro(2).Value).Posicao,...
                                              Robo(TelaJogo.Parametro(2).Value).Desejado,ConstantesINT);

% Caso for iniciar a demo
else
    
    % Inicia a demo e desabilita os bot�es
    Partida.EmDemo = true;
    set(TelaJogo.Parametro(2:4),'enable','off')
    
end