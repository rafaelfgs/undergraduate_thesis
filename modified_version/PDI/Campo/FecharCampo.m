%% Fecha a Janela do Campo

% Habilita o bot�o de Definir Campo
set(TelaPDI.Botao(5),'enable','on')

% Habilita o bot�o de Encerrar C�mera
if exist('TelaCalibracao','var') ~= 1
    set(TelaPDI.Botao(1),'enable','on')
elseif ~isvalid(TelaCalibracao.Fig)
    set(TelaPDI.Botao(1),'enable','on')
end

% Fecha a janela
closereq