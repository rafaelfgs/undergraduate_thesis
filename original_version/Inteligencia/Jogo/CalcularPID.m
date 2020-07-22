for ii = 1:length(Robo)
     
    Robo(ii).PID.erroAnterior = Robo(ii).PID.erroAtual;
    Robo(ii).PID.erroAtual = Robo(ii).SaidaD - Robo(ii).Velocidade;
    Robo(ii).PID.erroAcumulado =  Robo(ii).PID.erroAcumulado + Robo(ii).PID.erroAtual;
    if Partida.Pause
            Robo(ii).PID.erroAnterior = [0;0];
            Robo(ii).PID.erroAtual = [0;0];
            Robo(ii).PID.erroAcumulado = [0;0];
    end
    if Robo(ii).PID.on
        if abs(Robo(ii).PID.erroAcumulado) > 10000;
            Robo(ii).PID.erroAcumulado = 10000*sign(abs(Robo(ii).PID.erroAcumulado));
        end
        Robo(ii).PID.dErro = (Robo(ii).PID.erroAtual -  Robo(ii).PID.erroAnterior) / Constantes.TmaxPartida;
        Robo(ii).PID.Saida = Robo(ii).PID.erroAtual*Robo(ii).PID.kp + ...
            Robo(ii).PID.erroAcumulado*Robo(ii).PID.ki + ...
            Robo(ii).PID.dErro*Robo(ii).PID.kd;
        
        
        
        
        
        
        Robo(ii).Saida =  Robo(ii).PID.Saida;
        if abs(Robo(ii).Saida(1)) > 500
            Robo(ii).Saida(1) = 500*sign(Robo(ii).Saida(1));
        end
        if abs(Robo(ii).Saida(2)) > 300
            Robo(ii).Saida(2) = 300*sign(Robo(ii).Saida(2));
        end
    else
        Robo(ii).Saida =  Robo(ii).SaidaD;
    end
%     Robo(ii).Saida = Robo(ii).SaidaD;
end