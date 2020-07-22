%% Finaliza a Tela do PDI

% Habilita os botões de preparar PDI
set(TelaPrincipal.Botao(1:2),'enable','on')

% Fecha as janelas
try close(TelaCalibracao.Fig), catch, end
try close(TelaConstantesPDI.Fig), catch, end
try close(TelaCampo.Fig), catch, end
closereq