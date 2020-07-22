%% Chama as funções necessárias para controlar o Goleiro

function Goleiro = GoleiroControle(Goleiro,Adv,Bola,ConstantesINT)

% Determina a posição desejada para o Goleiro
Goleiro.Desejado = GoleiroDesejado(Goleiro.Posicao,Adv,Bola,ConstantesINT.Campo);

% Determina o erro da distância do Goleiro para o ponto desejado
ErroDist = rssq(Goleiro.Posicao(1:2)-Goleiro.Desejado);

% Caso o Goleiro não estiver no ponto desejado
if ErroDist > ConstantesINT.Erro(1)
    
    % Determina o erro do ângulo do Goleiro para o ponto desejado (-180º~180º)
    ErroAng = Goleiro.Posicao(3) - atan2d(Goleiro.Desejado(2)-Goleiro.Posicao(2),Goleiro.Desejado(1)-Goleiro.Posicao(1));
    ErroAng = (ErroAng<-180)*(ErroAng+360) + (ErroAng>=-180&&ErroAng<=180)*ErroAng + (ErroAng>180)*(ErroAng-360);
    
    % Traça uma trajetória até o ponto
    Goleiro.Saida = TracarTrajetoria(ErroDist,ErroAng,ConstantesINT.Saturacao(1,:),ConstantesINT.Inclinacao(1,:));
    
% Caso o Goleiro estiver no ponto desejado
else
    
    % Caso a bola estiver longe do gol
    if ConstantesINT.Campo * Bola.Posicao(1) < 500
        
        % Determina o erro do ângulo do Goleiro para 90º (-180º~180º)
        ErroAng = Goleiro.Posicao(3) - 90;
        ErroAng = (ErroAng<-180)*(ErroAng+360) + (ErroAng>=-180&&ErroAng<=180)*ErroAng + (ErroAng>180)*(ErroAng-360);
        
        % Caso o Goleiro não estiver na orientação desejada
        if abs(ErroAng) > ConstantesINT.Erro(2) && abs(ErroAng) < 180-ConstantesINT.Erro(2)
            
            % Orienta na direção de 90º
            Goleiro.Saida = OrientarRobo(ErroAng,ConstantesINT.Saturacao(1,:),ConstantesINT.Inclinacao(1,:));
            
        % Caso o Goleiro estiver na orientação desejada
        else
            
            % Fica Parado
            Goleiro.Saida = [0;0];
            
        end
        
    % Caso a bola estiver perto do gol
    else
        
        % Determina o sentido do giro
        Sentido = ConstantesINT.Campo * Bola.Posicao(2) - Goleiro.Posicao(2);
        
        % Gira para defender
        Goleiro.Saida = GirarBola(Sentido,ConstantesINT.Saturacao(3,:));
        
    end
    
end