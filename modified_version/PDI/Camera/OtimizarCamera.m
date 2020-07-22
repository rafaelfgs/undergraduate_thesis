%% Faz as modificações para otimizar a imagem e maximizar o fps

% Inicia as propriedades da câmera
Camera.Source = getselectedsource(Camera.Video);

if Camera.Tipo == 1
    
    % Altera o obturador da câmera para um número qualquer
    Camera.Source.Shutter = 400;
    
    % Altera a exposição, o brilho, o ganho, a saturação e a nitidez da câmera
    Camera.Source.AutoExposure = 50;
    Camera.Source.Brightness = 0;
    Camera.Source.Gain = 80;
    Camera.Source.Saturation = 511;
    Camera.Source.Sharpness = 0;
    
    % Altera novamente o obturador da câmera para forçar a mudança
    Camera.Source.Shutter = 800;
    
elseif Camera.Tipo == 2
    
    % Liga a luz de fundo da câmera
    Camera.Source.BacklightCompensation = 'on';
    
    % Altera a saturação e a nitidez da câmera
    Camera.Source.Saturation = 48;
    Camera.Source.Sharpness = 1;
    
    % Desliga a luz de fundo da câmera para forçar a mudança
    Camera.Source.BacklightCompensation = 'off';
    
end