%% Chama as funções necessárias para controlar o Zagueiro

function Zagueiro = ZagueiroControle(Zagueiro,Adv,Bola,Constantes,Campo)

% Determina a posição desejada para o Zagueiro
Zagueiro.Desejado = ZagueiroDesejado(Zagueiro.Posicao,Adv,Bola,Campo);

% Determina o erro da distância do Zagueiro para o ponto desejado
ErroDist = rssq(Zagueiro.Posicao(1:2)-Zagueiro.Desejado);

% Caso o Zagueiro não estiver no ponto desejado
if ErroDist > Constantes.Erro(1)
    
    % Determina o erro do ângulo do Zagueiro para o ponto desejado (-180º~180º)
    ErroAng = Zagueiro.Posicao(3) - atan2d(Zagueiro.Desejado(2)-Zagueiro.Posicao(2),Zagueiro.Desejado(1)-Zagueiro.Posicao(1));
    ErroAng = (ErroAng<-180)*(ErroAng+360) + (ErroAng>=-180&&ErroAng<=180)*ErroAng + (ErroAng>180)*(ErroAng-360);
    
    % Traça uma trajetória até o ponto
    Zagueiro.Saida = TracarTrajetoria(ErroDist,ErroAng,Constantes.Saturacao(1,1:2),Constantes.Curva(1,1:2));
    
    % Caso o Zagueiro estiver no ponto desejado
else
    
    % Verifica se a bola não está avançada e fora da área de defesa
    if Campo*Bola.Posicao(1) > -100 && (Campo*Bola.Posicao(1) < 550 || abs(Bola.Posicao(2)) > 400)
        
        % Determina o erro do ângulo do Zagueiro para a bola (-180º~180º)
        ErroAng = Zagueiro.Posicao(3) - atan2d(Zagueiro.Desejado(2)-Bola.Posicao(2),Zagueiro.Desejado(1)-Bola.Posicao(1));
        ErroAng = (ErroAng<-180)*(ErroAng+360) + (ErroAng>=-180&&ErroAng<=180)*ErroAng + (ErroAng>180)*(ErroAng-360);
        
        % Caso o Zagueiro não estiver na orientação desejada
        if abs(ErroAng) > Constantes.Erro(2) && abs(ErroAng) < 180-Constantes.Erro(2)
            
            % Orienta na direção da bola
            Zagueiro.Saida = OrientarRobo(ErroAng,Constantes.Saturacao(2,2),Constantes.Curva(2,2));
            
            % Caso o Zagueiro estiver na orientação desejada
        else
            
            % Chuta a bola
            Zagueiro.Saida = ChutarBola(ErroAng,Constantes.Saturacao(2,1));
            
        end
        
    else
        
        % Chuta a bola
        Zagueiro.Saida = [0;0];
        
    end
    
end