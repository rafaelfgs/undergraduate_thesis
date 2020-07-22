%% Inicia a demonstração

% Movimento do Círculo defasados em 120°
if Partida.TipoTeste == 3
Robo(1).Desejado = 200 * [cosd(ConstantesINT.Frequencia*toc(Tempo.Demo)    ); ...
                          sind(ConstantesINT.Frequencia*toc(Tempo.Demo)    )];
Robo(2).Desejado = 200 * [cosd(ConstantesINT.Frequencia*toc(Tempo.Demo)+120); ...
                          sind(ConstantesINT.Frequencia*toc(Tempo.Demo)+120)];
Robo(3).Desejado = 200 * [cosd(ConstantesINT.Frequencia*toc(Tempo.Demo)-120); ...
                          sind(ConstantesINT.Frequencia*toc(Tempo.Demo)-120)];

% Movimento do Oito defasados em 120°
elseif Partida.TipoTeste == 4
Robo(1).Desejado = 200 * [2*sind(ConstantesINT.Frequencia*toc(Tempo.Demo)    ); ...
                         sind(2*(ConstantesINT.Frequencia*toc(Tempo.Demo)    ))];
Robo(2).Desejado = 200 * [2*sind(ConstantesINT.Frequencia*toc(Tempo.Demo)+120); ...
                         sind(2*(ConstantesINT.Frequencia*toc(Tempo.Demo)+120))];
Robo(3).Desejado = 200 * [2*sind(ConstantesINT.Frequencia*toc(Tempo.Demo)-120); ...
                         sind(2*(ConstantesINT.Frequencia*toc(Tempo.Demo)-120))];

end

% Controla de forma simples o movimento dos Robôs 1, 2 e 3
Robo(1).Saida = ControlarSimples(Robo(1).Posicao,Robo(1).Desejado,ConstantesINT);
Robo(2).Saida = ControlarSimples(Robo(2).Posicao,Robo(2).Desejado,ConstantesINT);
Robo(3).Saida = ControlarSimples(Robo(3).Posicao,Robo(3).Desejado,ConstantesINT);