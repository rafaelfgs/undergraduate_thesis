%% Fecha as telas de calibração de cores e habilita os botões

% Habilita o botão de Calibrar Cores
set(TelaPDI.Botao(4),'enable','on')

% Habilita o botão de Encerrar Câmera
if exist('TelaCampo','var') ~= 1
    set(TelaPDI.Botao(1),'enable','on')
elseif ~isvalid(TelaCampo.Fig)
    set(TelaPDI.Botao(1),'enable','on')
end

% Fecha as janelas
try close(TelaPixels.fig), catch, end
closereq