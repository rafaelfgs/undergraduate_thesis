%% Fecha as telas de calibra��o de cores e habilita os bot�es

% Habilita o bot�o de Calibrar Cores
set(TelaPDI.Botao(4),'enable','on')

% Habilita o bot�o de Encerrar C�mera
if exist('TelaCampo','var') ~= 1
    set(TelaPDI.Botao(1),'enable','on')
elseif ~isvalid(TelaCampo.Fig)
    set(TelaPDI.Botao(1),'enable','on')
end

% Fecha as janelas
try close(TelaPixels.fig), catch, end
closereq