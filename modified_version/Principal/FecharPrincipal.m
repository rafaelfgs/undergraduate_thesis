%% Fecha a tela principal

% Finaliza as variáveis de estado
Partida.EmComunicacao = false;
Partida.EmDemo = false;
Partida.EmEnvio = false;
Partida.EmJogo = false;
Partida.EmTeste = false;
Partida.EmVideo = false;
Partida.ExibeSegmentacao = false;
Partida.ExibeResultados = false;

% Limpa a variável da câmera
try closepreview(Camera.Video), catch, end
try stop(Camera.Video), catch, end
delete(imaqfind)
clear Camera

% Limpa a variável da comunicação com os robôs
try fclose(instrfindall); catch, end
try fclose(S); catch, end
try delete(S), catch, end
try clear S, catch, end

% Fecha as janelas abertas
try close(TelaCalibracao.Fig), catch, end
try close(TelaConstantesPDI.Fig), catch, end
try close(TelaCampo.Fig), catch, end
try close(TelaConstantesINT.Fig), catch, end
try close(TelaPDI.Fig), catch, end
try close(TelaINT.Fig), catch, end
try close(TelaJogo.Fig), catch, end
try close(TelaTeste.Fig), catch, end
delete(imaqfind)
closereq