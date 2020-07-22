%% Monta o Pacote de Acordo com a Saída V

function pacote = MontarPacote(V)

% Limita o vetor entre -100 e 100
for ii = 1:size(V,2)
    if V(ii) > 100
        V(ii) = 100;
    elseif V(ii) < -100
        V(ii) = -100;
    end
end

% Cria as velocidades negativas como 128+abs(X)
vel = zeros(1,6);
for ii = 1:size(V,2)
    if V(ii) > 0
        vel(ii) = uint8(V(ii));
    else
        vel(ii) = uint8(128 + abs(V(ii)));
    end
end

% Saida [ 'B' 'D' 16+vel1 16+vel2 16+vel3 16+vel4 16+vel5 16+vel6 'P' 10 13]
pacote = ['BD' 16+[6, vel(1:6)], 'P' 10 13]+0;