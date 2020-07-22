%% Chama as funções necessárias para controlar o Robô

function Saida = ControlarSimples(Posicao,Desejado,ConstantesINT)

% Determina o erro da distância do Robô para o ponto desejado
ErroDist = rssq(Posicao(1:2)-Desejado);

% Determina o erro do ângulo do Robô para o ponto desejado (-180º~180º)
ErroAng = Posicao(3) - atan2d(Desejado(2)-Posicao(2),Desejado(1)-Posicao(1));
ErroAng = (ErroAng<-180)*(ErroAng+360) + (ErroAng>=-180&&ErroAng<=180)*ErroAng + (ErroAng>180)*(ErroAng-360);

% Traça uma trajetória até o ponto
Saida = TracarTrajetoria(ErroDist,ErroAng,ConstantesINT.Saturacao(1,:),ConstantesINT.Inclinacao(1,:));