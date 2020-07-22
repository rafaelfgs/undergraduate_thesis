%% Chama as funções necessárias para controlar o Goleiro

function Goleiro = GoleiroControle(Goleiro,Adv,Bola,Constantes,Campo)

% Determina a posição desejada para o Goleiro
Goleiro.Desejado = GoleiroDesejado(Goleiro.Posicao,Adv,Bola,Campo);

% Determina o erro da distância do Goleiro para o ponto desejado
ErroDist = rssq(Goleiro.Posicao(1:2)-Goleiro.Desejado);

% Caso o Goleiro não estiver no ponto desejado
if ErroDist > Constantes.Erro(1)
    
    % Determina o erro do ângulo do Goleiro para o ponto desejado (-180º~180º)
    ErroAng = Goleiro.Posicao(3) - atan2d(Goleiro.Desejado(2)-Goleiro.Posicao(2),Goleiro.Desejado(1)-Goleiro.Posicao(1));
    ErroAng = (ErroAng<-180)*(ErroAng+360) + (ErroAng>=-180&&ErroAng<=180)*ErroAng + (ErroAng>180)*(ErroAng-360);
    
    % Traça uma trajetória até o ponto
    Goleiro.Saida = TracarTrajetoria(ErroDist,ErroAng,Constantes.Saturacao(1,1:2),Constantes.Curva(1,1:2));
    
% Caso o Goleiro estiver no ponto desejado
else
    
    % Determina o erro do ângulo do Goleiro para 90º (-180º~180º)
    ErroAng = Goleiro.Posicao(3) - 90;
    ErroAng = (ErroAng<-180)*(ErroAng+360) + (ErroAng>=-180&&ErroAng<=180)*ErroAng + (ErroAng>180)*(ErroAng-360);
    
    % Caso o Goleiro não estiver na orientação desejada
    if abs(ErroAng) > Constantes.Erro(2) && abs(ErroAng) < 180-Constantes.Erro(2)
        
        % Orienta na direção da bola
        Goleiro.Saida = OrientarRobo(ErroAng,Constantes.Saturacao(2,2),Constantes.Curva(2,2));
        
    % Caso o Goleiro estiver na orientação desejada
    else
        
        if Campo * Bola.Posicao(1) > 500
            
            Sentido = Campo * Bola.Posicao(2) - Goleiro.Posicao(2);
            
            % Chuta a bola
            Goleiro.Saida = GirarBola(Sentido,900);
            
        else
            
            % Chuta a bola
            Goleiro.Saida = [0;0];
            
        end
        
    end
    
end
    
end