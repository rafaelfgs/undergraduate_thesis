%% Escreve o Pacote na Serial

function EnviarPacote(S,Pacote)

for ii = 1:length(S)
    fwrite(S(ii),Pacote);
end