% Estrutura do pacote
% pacote = ['B' 'D' n [dados= n*Bytes] 'P' 10 13]
% n e dados precisa adicionar + 16


function pacote = MontarPacote(V)
for ii = 1:size(V,2)
    if V(ii) > 100
        V(ii) = 100;
    elseif V(ii) < -100
        V(ii) = -100;
    end
end

vel = zeros(1, 6);
for ii = 1:size(V,2)
    if V(ii) > 0
        vel(ii) = uint8(V(ii));
    else
        vel(ii) = uint8(128 + abs(V(ii)));
    end
end

pacote = ['BD' 16+[6, vel(1:6)], 'P' 10 13]+0;