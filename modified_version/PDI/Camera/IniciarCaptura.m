%% Inicia a Captura de Imagens

% Configura o trigger da c�mera
triggerconfig(Camera.Video,'manual');
Camera.Video.FramesPerTrigger = 1;

% Inicia e otimiza a captura dependendo do tipo da c�mera
if Camera.Tipo == 2
    OtimizarCamera
    start(Camera.Video)
else
    start(Camera.Video)
    OtimizarCamera
end