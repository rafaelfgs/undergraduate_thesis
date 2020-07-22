%% Cria a conexão com a serial

function S = ConectarSerial(COM)

% Verifica todas as possíveis conexões
if nargin == 0
    out = instrhwinfo('serial');
    for ii = 1:length(out.ObjectConstructorName)
        S(ii) = eval(out.ObjectConstructorName{ii});
    end
else
    for ii = 1:length(COM)
        S(ii) = serial(COM{ii});
    end
end

% Cria a variável S vazia, caso não haja serial
if exist('S','var') ~= 1
    S = [];
    disp('Não foram encontradas portas conectadas!')
end

% Determina as portas serais válidas
valida = false(1,length(S));
for ii = 1:length(S)
    try
        fopen(S(ii));
        fwrite(S(ii),65);
        valida(ii) = true;
        disp(['Porta ' S(ii).Port ' conectada!'])
    catch
        disp(['Porta ' S(ii).Port ' não conectada!'])
    end
end

% Limpa as portas não-válidas da variável S
if length(valida) > 1
    S(~valida) = [];
elseif ~valida
    S = [];
end

% Caso não houver serial válida
if all(~valida)
    disp('Verifique a conexão do dispositivo!')
end