%% Faz as modifica��es para otimizar a imagem e maximizar o fps

% Inicia as propriedades da c�mera
Camera.Source = getselectedsource(Camera.Video);

if Camera.Tipo == 1
    
    % Altera o obturador da c�mera para um n�mero qualquer
    Camera.Source.Shutter = 400;
    
    % Altera a exposi��o, o brilho, o ganho, a satura��o e a nitidez da c�mera
    Camera.Source.AutoExposure = 50;
    Camera.Source.Brightness = 0;
    Camera.Source.Gain = 80;
    Camera.Source.Saturation = 511;
    Camera.Source.Sharpness = 0;
    
    % Altera novamente o obturador da c�mera para for�ar a mudan�a
    Camera.Source.Shutter = 800;
    
elseif Camera.Tipo == 2
    
    % Liga a luz de fundo da c�mera
    Camera.Source.BacklightCompensation = 'on';
    
    % Altera a satura��o e a nitidez da c�mera
    Camera.Source.Saturation = 48;
    Camera.Source.Sharpness = 1;
    
    % Desliga a luz de fundo da c�mera para for�ar a mudan�a
    Camera.Source.BacklightCompensation = 'off';
    
end