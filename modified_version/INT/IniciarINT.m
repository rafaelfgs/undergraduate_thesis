%% Rotina para realizar a Intelig�ncia

OrganizarEntrada

if Partida.EmJogo
    ControlarRobos
end

if Partida.EmTeste && Partida.TipoTeste >= 3
    IniciarDemo
end

if ~(Partida.EmTeste && Partida.TipoTeste == 1)
    DeterminarPotencias
end

OrganizarSaida