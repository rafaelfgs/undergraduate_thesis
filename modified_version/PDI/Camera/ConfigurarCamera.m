%% Configura a Câmera

% Determina o nome do adaptador e o formato da imagem utilizado
Camera.Nome = {'dcam','winvideo'};
Camera.Formato = {'RGB24_640x480','MJPG_640x480'};
Camera.Redimensionar = 0.5;

try
    
    % Inicia a câmera tipo DCAM
    Camera.Video = videoinput(Camera.Nome{1},1,Camera.Formato{1});
    Camera.Tipo = 1;
    disp(['Câmera DCAM encontrada!', 10, ...
          'Configurada no formato RGB24_640x480!'])
    
catch
    
    try
        
        % Inicia a câmera tipo WINVIDEO
        Camera.Video = videoinput(Camera.Nome{2},1,Camera.Formato{2});
        Camera.Tipo = 2;
        disp(['Câmera WINVIDEO encontrada!', 10, ...
              'Configurada no formato MJPG_640x480!'])
        
    catch
        
        % Apresenta uma mensagem de erro
        clear Camera
        error(['Não foi possível encontrar uma câmera!', 10, ...
               'Verifique a instalação com comando imaqhwinfo!'])
        
    end
    
end