%% Chama as fun��es necess�rias para controlar o Goleiro

function Goleiro = GoleiroControle(Goleiro,Adv,Bola,Constantes,Campo)

% Determina a posi��o desejada para o Goleiro
Goleiro.Desejado = GoleiroDesejado(Goleiro.Posicao,Adv,Bola,Campo);

% Determina o erro da dist�ncia do Goleiro para o ponto desejado
ErroDist = rssq(Goleiro.Posicao(1:2)-Goleiro.Desejado);

% Caso o Goleiro n�o estiver no ponto desejado
if ErroDist > Constantes.Erro(1)
    
    % Determina o erro do �ngulo do Goleiro para o ponto desejado (-180�~180�)
    ErroAng = Goleiro.Posicao(3) - atan2d(Goleiro.Desejado(2)-Goleiro.Posicao(2),Goleiro.Desejado(1)-Goleiro.Posicao(1));
    ErroAng = (ErroAng<-180)*(ErroAng+360) + (ErroAng>=-180&&ErroAng<=180)*ErroAng + (ErroAng>180)*(ErroAng-360);
    
    % Tra�a uma trajet�ria at� o ponto
    Goleiro.Saida = TracarTrajetoria(ErroDist,ErroAng,Constantes.Saturacao(1,1:2),Constantes.Curva(1,1:2));
    
% Caso o Goleiro estiver no ponto desejado
else
    
    % Determina o erro do �ngulo do Goleiro para 90� (-180�~180�)
    ErroAng = Goleiro.Posicao(3) - 90;
    ErroAng = (ErroAng<-180)*(ErroAng+360) + (ErroAng>=-180&&ErroAng<=180)*ErroAng + (ErroAng>180)*(ErroAng-360);
    
    % Caso o Goleiro n�o estiver na orienta��o desejada
    if abs(ErroAng) > Constantes.Erro(2) && abs(ErroAng) < 180-Constantes.Erro(2)
        
        % Orienta na dire��o da bola
        Goleiro.Saida = OrientarRobo(ErroAng,Constantes.Saturacao(2,2),Constantes.Curva(2,2));
        
    % Caso o Goleiro estiver na orienta��o desejada
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