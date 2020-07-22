%% Fecha a Janela do Campo

% Habilita o botão de Definir Campo
set(TelaPDI.Botao(5),'enable','on')

% Habilita o botão de Encerrar Câmera
if exist('TelaCalibracao','var') ~= 1
    set(TelaPDI.Botao(1),'enable','on')
elseif ~isvalid(TelaCalibracao.Fig)
    set(TelaPDI.Botao(1),'enable','on')
end

% Fecha a janela
closereq