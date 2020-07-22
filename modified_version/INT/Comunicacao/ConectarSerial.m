%% Cria a conex�o com a serial

function S = ConectarSerial(COM)

% Verifica todas as poss�veis conex�es
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

% Cria a vari�vel S vazia, caso n�o haja serial
if exist('S','var') ~= 1
    S = [];
    disp('N�o foram encontradas portas conectadas!')
end

% Determina as portas serais v�lidas
valida = false(1,length(S));
for ii = 1:length(S)
    try
        fopen(S(ii));
        fwrite(S(ii),65);
        valida(ii) = true;
        disp(['Porta ' S(ii).Port ' conectada!'])
    catch
        disp(['Porta ' S(ii).Port ' n�o conectada!'])
    end
end

% Limpa as portas n�o-v�lidas da vari�vel S
if length(valida) > 1
    S(~valida) = [];
elseif ~valida
    S = [];
end

% Caso n�o houver serial v�lida
if all(~valida)
    disp('Verifique a conex�o do dispositivo!')
end