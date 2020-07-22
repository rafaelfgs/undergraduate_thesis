%% Chama as fun��es necess�rias para controlar o Rob�

function Saida = ControlarRobo(Posicao,Desejado,Constantes)

% Determina o erro da dist�ncia do Rob� para o ponto desejado
ErroDist = rssq(Posicao(1:2)-Desejado);

% Determina o erro do �ngulo do Rob� para o ponto desejado (-180�~180�)
ErroAng = Posicao(3) - atan2d(Desejado(2)-Posicao(2),Desejado(1)-Posicao(1));
ErroAng = (ErroAng<-180)*(ErroAng+360) + (ErroAng>=-180&&ErroAng<=180)*ErroAng + (ErroAng>180)*(ErroAng-360);

% Tra�a uma trajet�ria at� o ponto
Saida = TracarTrajetoria(ErroDist,ErroAng,Constantes.Saturacao(1,1:2),Constantes.Curva(1,1:2));