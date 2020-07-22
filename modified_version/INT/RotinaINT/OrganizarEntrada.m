%% Organiza as Variáveis do PDI para serem trabalhadas pela Inteligência

Robo(1).Ativo = ConstantesINT.Ativo(1);
Robo(2).Ativo = ConstantesINT.Ativo(1);
Robo(3).Ativo = ConstantesINT.Ativo(1);

Robo(1).Funcao = ConstantesINT.Tipo(ConstantesINT.Funcao(1));
Robo(2).Funcao = ConstantesINT.Tipo(ConstantesINT.Funcao(2));
Robo(3).Funcao = ConstantesINT.Tipo(ConstantesINT.Funcao(3));

Robo(1).Posicao = Filtro.Robo1.Xpred;
Robo(2).Posicao = Filtro.Robo2.Xpred;
Robo(3).Posicao = Filtro.Robo3.Xpred;
Adv(1).Posicao  = Filtro.Adv1.Xpred;
Adv(2).Posicao  = Filtro.Adv2.Xpred;
Adv(3).Posicao  = Filtro.Adv3.Xpred;
Bola.Posicao    = Filtro.Bola.Xpred;

Robo(1).Velocidade = Filtro.Robo1.dXpred;
Robo(2).Velocidade = Filtro.Robo2.dXpred;
Robo(3).Velocidade = Filtro.Robo3.dXpred;
Adv(1).Velocidade  = Filtro.Adv1.dXpred;
Adv(2).Velocidade  = Filtro.Adv2.dXpred;
Adv(3).Velocidade  = Filtro.Adv3.dXpred;
Bola.Velocidade    = Filtro.Bola.dXpred;