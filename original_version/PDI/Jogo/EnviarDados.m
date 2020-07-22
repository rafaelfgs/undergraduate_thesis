%% Organiza e envia os dados na rede

% Aguarda o tempo de envio
while toc(Tempo.TiEnviar) < Constantes.TEnviar
end

% Inicia o tempo de envio
Tempo.TiEnviar = tic;

% As velocidades estão divididas por K por conta da saturação
% Nesse caso a velocidade enviada varia de K à 999*K
% Caso queira aumentar a saturação (e diminuir a precisão), aumente o K
% ##### DEVE ESTAR IGUAL NA INTELIGÊNCIA #####
Saida.K = 3;

% Garante a saturação das posturas (até 999 mm ou 999°)
Postura.Robo1 = (abs(Filtro.Robo1.Xpred)> 999) .* (sign(Filtro.Robo1.Xpred)*999) + ...
                (abs(Filtro.Robo1.Xpred)<=999) .* Filtro.Robo1.Xpred;
Postura.Robo2 = (abs(Filtro.Robo2.Xpred)> 999) .* (sign(Filtro.Robo2.Xpred)*999) + ...
                (abs(Filtro.Robo2.Xpred)<=999) .* Filtro.Robo2.Xpred;
Postura.Robo3 = (abs(Filtro.Robo3.Xpred)> 999) .* (sign(Filtro.Robo3.Xpred)*999) + ...
                (abs(Filtro.Robo3.Xpred)<=999) .* Filtro.Robo3.Xpred;
Postura.Adv1  = (abs(Filtro.Adv1.Xpred) > 999) .* (sign(Filtro.Adv1.Xpred) *999) + ...
                (abs(Filtro.Adv1.Xpred) <=999) .* Filtro.Adv1.Xpred;
Postura.Adv2  = (abs(Filtro.Adv2.Xpred) > 999) .* (sign(Filtro.Adv2.Xpred) *999) + ...
                (abs(Filtro.Adv2.Xpred) <=999) .* Filtro.Adv2.Xpred;
Postura.Adv3  = (abs(Filtro.Adv3.Xpred) > 999) .* (sign(Filtro.Adv3.Xpred) *999) + ...
                (abs(Filtro.Adv3.Xpred) <=999) .* Filtro.Adv3.Xpred;
Postura.Bola  = (abs(Filtro.Bola.Xpred) > 999) .* (sign(Filtro.Bola.Xpred) *999) + ...
                (abs(Filtro.Bola.Xpred) <=999) .* Filtro.Bola.Xpred;

% Garante a saturação das velocidades (até 999*K mm/s ou 999*K °/s)
Velocidade.Robo1 = (abs(Filtro.Robo1.dXpred)> Saida.K*999) .* (sign(Filtro.Robo1.dXpred)*Saida.K*999) + ...
                   (abs(Filtro.Robo1.dXpred)<=Saida.K*999) .* Filtro.Robo1.dXpred;
Velocidade.Robo2 = (abs(Filtro.Robo2.dXpred)> Saida.K*999) .* (sign(Filtro.Robo2.dXpred)*Saida.K*999) + ...
                   (abs(Filtro.Robo2.dXpred)<=Saida.K*999) .* Filtro.Robo2.dXpred;
Velocidade.Robo3 = (abs(Filtro.Robo3.dXpred)> Saida.K*999) .* (sign(Filtro.Robo3.dXpred)*Saida.K*999) + ...
                   (abs(Filtro.Robo3.dXpred)<=Saida.K*999) .* Filtro.Robo3.dXpred;
Velocidade.Adv1  = (abs(Filtro.Adv1.dXpred) > Saida.K*999) .* (sign(Filtro.Adv1.dXpred) *Saida.K*999) + ...
                   (abs(Filtro.Adv1.dXpred) <=Saida.K*999) .* Filtro.Adv1.dXpred;
Velocidade.Adv2  = (abs(Filtro.Adv2.dXpred) > Saida.K*999) .* (sign(Filtro.Adv2.dXpred) *Saida.K*999) + ...
                   (abs(Filtro.Adv2.dXpred) <=Saida.K*999) .* Filtro.Adv2.dXpred;
Velocidade.Adv3  = (abs(Filtro.Adv3.dXpred) > Saida.K*999) .* (sign(Filtro.Adv3.dXpred) *Saida.K*999) + ...
                   (abs(Filtro.Adv3.dXpred) <=Saida.K*999) .* Filtro.Adv3.dXpred;
Velocidade.Bola  = (abs(Filtro.Bola.dXpred) > Saida.K*999) .* (sign(Filtro.Bola.dXpred) *Saida.K*999) + ...
                   (abs(Filtro.Bola.dXpred) <=Saida.K*999) .* Filtro.Bola.dXpred;

% Saída de cada objeto no formato indicado
% [ Xp em mm; Yp em mm; Wp em °; Vx/K mm/s; Vy/K mm/s; Vw/K °/s ]
Saida.Robo1 = sprintf('%4.0f%4.0f%4.0f%4.0f%4.0f%4.0f',[Postura.Robo1 Velocidade.Robo1/Saida.K]);
Saida.Robo2 = sprintf('%4.0f%4.0f%4.0f%4.0f%4.0f%4.0f',[Postura.Robo2 Velocidade.Robo2/Saida.K]);
Saida.Robo3 = sprintf('%4.0f%4.0f%4.0f%4.0f%4.0f%4.0f',[Postura.Robo3 Velocidade.Robo3/Saida.K]);
Saida.Adv1  = sprintf('%4.0f%4.0f%4.0f%4.0f%4.0f%4.0f',[Postura.Adv1  Velocidade.Adv1 /Saida.K]);
Saida.Adv2  = sprintf('%4.0f%4.0f%4.0f%4.0f%4.0f%4.0f',[Postura.Adv2  Velocidade.Adv2 /Saida.K]);
Saida.Adv3  = sprintf('%4.0f%4.0f%4.0f%4.0f%4.0f%4.0f',[Postura.Adv3  Velocidade.Adv3 /Saida.K]);
Saida.Bola  = sprintf('%4.0f%4.0f%4.0f%4.0f%4.0f%4.0f',[Postura.Bola  Velocidade.Bola /Saida.K]);

% Vetor final de saída
Saida.Dados = [ Saida.Robo1 Saida.Robo2 Saida.Robo3 Saida.Adv1 Saida.Adv2 Saida.Adv3 Saida.Bola ];

% disp([Saida.Robo1 '    ' Saida.Robo2 '    ' Saida.Robo3 '    ' Saida.Bola])
% disp([Saida.Bola])
% Tenta enviar a matriz criada
try fwrite(Comunicacao.U1,Saida.Dados), catch, end