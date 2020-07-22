%% Determina a vari�vel de sa�da

% Determina a sa�da de acordo com os ganhos
Saida.Potencia = ConstantesINT.Ganho .* [Robo(1).Potencia';Robo(2).Potencia';Robo(3).Potencia'];

% Corre��o do sentido e da ordem das rodas
Saida.Corrigida = [ Saida.Potencia(1,1) Saida.Potencia(1,2) ...
                    Saida.Potencia(2,1) Saida.Potencia(2,2) ...
                    Saida.Potencia(3,1) Saida.Potencia(3,2) ];

% Monta o pacote para os rob�s
Saida.Pacote = MontarPacote(Saida.Corrigida);