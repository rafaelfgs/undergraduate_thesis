%% Rotina para realizar a Inteligência

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