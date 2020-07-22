%% Chama as funções necessárias para controlar o Atacante

function Atacante = AtacanteControle(Atacante,Adv,Bola,ConstantesINT)

% Determina a posição desejada para o Atacante
Atacante.Desejado = AtacanteDesejado(Atacante.Posicao,Adv,Bola,ConstantesINT.Campo);

% Determina o erro da distância do Atacante para o ponto desejado
ErroDist = rssq(Atacante.Posicao(1:2)-Atacante.Desejado);

% Caso o Atacante não estiver no ponto desejado
if ErroDist > ConstantesINT.Erro(1)
    
    % Determina o erro do ângulo do Atacante para o ponto desejado (-180º~180º)
    ErroAng = Atacante.Posicao(3) - atan2d(Atacante.Desejado(2)-Atacante.Posicao(2),Atacante.Desejado(1)-Atacante.Posicao(1));
    ErroAng = (ErroAng<-180)*(ErroAng+360) + (ErroAng>=-180&&ErroAng<=180)*ErroAng + (ErroAng>180)*(ErroAng-360);
    
    % Traça uma trajetória até o ponto
    Atacante.Saida = TracarTrajetoria(ErroDist,ErroAng,ConstantesINT.Saturacao(1,:),ConstantesINT.Inclinacao(1,:));
    
% Caso o Atacante estiver no ponto desejado
else
    
    % Caso a bola não estiver muito recuada
    if ConstantesINT.Campo * Bola.Posicao(1) < 350
        
        % Determina o erro do ângulo do Atacante para a bola (-180º~180º)
        ErroAng = Atacante.Posicao(3) - atan2d(Atacante.Desejado(2)-Bola.Posicao(2),Atacante.Desejado(1)-Bola.Posicao(1));
        ErroAng = (ErroAng<-180)*(ErroAng+360) + (ErroAng>=-180&&ErroAng<=180)*ErroAng + (ErroAng>180)*(ErroAng-360);
        
        % Caso o Atacante não estiver na orientação desejada
        if abs(ErroAng) > ConstantesINT.Erro(2) && abs(ErroAng) < 180-ConstantesINT.Erro(2)
            
            % Orienta na direção da bola
            Atacante.Saida = OrientarRobo(ErroAng,ConstantesINT.Saturacao(2,:),ConstantesINT.Curva(2,:));
            
        % Caso o Atacante estiver na orientação desejada
        else
            
            % Determina o sentido do chute
            Sentido = 2*(abs(ErroAng)<=90)-1;
            
            % Chuta a bola
            Atacante.Saida = ChutarBola(Sentido,ConstantesINT.Saturacao(3,:));
            
        end
        
    % Caso a bola estiver muito recuada
    else
        
        % Fica parado
        Atacante.Saida = [0;0];
        
    end
    
end