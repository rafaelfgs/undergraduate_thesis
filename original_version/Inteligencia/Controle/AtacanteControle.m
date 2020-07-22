%% Chama as funções necessárias para controlar o Atacante

function Atacante = AtacanteControle(Atacante,Adv,Bola,Constantes,Campo)

% Determina a posição desejada para o Atacante
Atacante.Desejado = AtacanteDesejado(Atacante.Posicao,Adv,Bola,Campo);

% Determina o erro da distância do Atacante para o ponto desejado
ErroDist = rssq(Atacante.Posicao(1:2)-Atacante.Desejado);

% Caso o Atacante não estiver no ponto desejado
if ErroDist > Constantes.Erro(1)
    
    % Determina o erro do ângulo do Atacante para o ponto desejado (-180º~180º)
    ErroAng = Atacante.Posicao(3) - atan2d(Atacante.Desejado(2)-Atacante.Posicao(2),Atacante.Desejado(1)-Atacante.Posicao(1));
    ErroAng = (ErroAng<-180)*(ErroAng+360) + (ErroAng>=-180&&ErroAng<=180)*ErroAng + (ErroAng>180)*(ErroAng-360);
    
    % Traça uma trajetória até o ponto
    Atacante.Saida = TracarTrajetoria(ErroDist,ErroAng,Constantes.Saturacao(1,1:2),Constantes.Curva(1,1:2));
    
    if abs(Atacante.Saida(1)) > Constantes.Saturacao(1)
        Atacante.Saida(1) = sign(Atacante.Saida(2))*Constantes.Saturacao(1);
    end
    
    if abs(Atacante.Saida(2)) > Constantes.Saturacao(2)
        Atacante.Saida(2) = sign(Atacante.Saida(2))*Constantes.Saturacao(2);
    end
    
    % Caso o Atacante estiver no ponto desejado
else
    
    % Verifica se a bola não está recuada
    if Campo * Bola.Posicao(1) < 350
        
        % Determina o erro do ângulo do Atacante para a bola (-180º~180º)
        ErroAng = Atacante.Posicao(3) - atan2d(Atacante.Desejado(2)-Bola.Posicao(2),Atacante.Desejado(1)-Bola.Posicao(1));
        ErroAng = (ErroAng<-180)*(ErroAng+360) + (ErroAng>=-180&&ErroAng<=180)*ErroAng + (ErroAng>180)*(ErroAng-360);
        
        % Caso o Atacante não estiver na orientação desejada
        if abs(ErroAng) > Constantes.Erro(2) && abs(ErroAng) < 180-Constantes.Erro(2)
            
            % Orienta na direção da bola
            Atacante.Saida = OrientarRobo(ErroAng,Constantes.Saturacao(2,2),Constantes.Curva(2,2));
            
        % Caso o Atacante estiver na orientação desejada
        else
            
            % Chuta a bola
            Atacante.Saida = ChutarBola(ErroAng,Constantes.Saturacao(2,1));
            
        end
        
    else
        
        % Fica parado
        Atacante.Saida = [0;0];
        
    end
    
end