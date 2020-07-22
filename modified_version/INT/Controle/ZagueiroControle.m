%% Chama as funções necessárias para controlar o Zagueiro

function Zagueiro = ZagueiroControle(Zagueiro,Adv,Bola,ConstantesINT)

% Determina a posição desejada para o Zagueiro
Zagueiro.Desejado = ZagueiroDesejado(Zagueiro.Posicao,Adv,Bola,ConstantesINT.Campo);

% Determina o erro da distância do Zagueiro para o ponto desejado
ErroDist = rssq(Zagueiro.Posicao(1:2)-Zagueiro.Desejado);

% Caso o Zagueiro não estiver no ponto desejado
if ErroDist > ConstantesINT.Erro(1)
    
    % Determina o erro do ângulo do Zagueiro para o ponto desejado (-180º~180º)
    ErroAng = Zagueiro.Posicao(3) - atan2d(Zagueiro.Desejado(2)-Zagueiro.Posicao(2),Zagueiro.Desejado(1)-Zagueiro.Posicao(1));
    ErroAng = (ErroAng<-180)*(ErroAng+360) + (ErroAng>=-180&&ErroAng<=180)*ErroAng + (ErroAng>180)*(ErroAng-360);
    
    % Traça uma trajetória até o ponto
    Zagueiro.Saida = TracarTrajetoria(ErroDist,ErroAng,ConstantesINT.Saturacao(1,:),ConstantesINT.Inclinacao(1,:));
    
% Caso o Zagueiro estiver no ponto desejado
else
    
    % Caso a bola não estiver muito avançada e fora da área do goleiro
    if ConstantesINT.Campo*Bola.Posicao(1) > -100 && (ConstantesINT.Campo*Bola.Posicao(1) < 550 || abs(Bola.Posicao(2)) > 400)
        
        % Determina o erro do ângulo do Zagueiro para a bola (-180º~180º)
        ErroAng = Zagueiro.Posicao(3) - atan2d(Zagueiro.Desejado(2)-Bola.Posicao(2),Zagueiro.Desejado(1)-Bola.Posicao(1));
        ErroAng = (ErroAng<-180)*(ErroAng+360) + (ErroAng>=-180&&ErroAng<=180)*ErroAng + (ErroAng>180)*(ErroAng-360);
        
        % Caso o Zagueiro não estiver na orientação desejada
        if abs(ErroAng) > ConstantesINT.Erro(2) && abs(ErroAng) < 180-ConstantesINT.Erro(2)
            
            % Orienta na direção da bola
            Zagueiro.Saida = OrientarRobo(ErroAng,ConstantesINT.Saturacao(2,:),ConstantesINT.Curva(2,:));
            
        % Caso o Zagueiro estiver na orientação desejada
        else
            
            % Determina o sentido do chute
            Sentido = 2*(abs(ErroAng)<=90)-1;
            
            % Chuta a bola
            Zagueiro.Saida = ChutarBola(Sentido,ConstantesINT.Saturacao(3,:));
            
        end
        
    % Caso a bola estiver muito avançada ou dentro da área do goleiro
    else
        
        % Fica Parado
        Zagueiro.Saida = [0;0];
        
    end
    
end