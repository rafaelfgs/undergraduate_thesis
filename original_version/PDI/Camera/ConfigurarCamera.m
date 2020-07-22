%% Configura a Câmera

% Determina o nome do adaptador e o formato da imagem utilizado
Camera.Nome = {'dcam','winvideo'};
Camera.Formato = {'RGB24_640x480','MJPG_640x480'};
Camera.Tipo = 0;
Camera.Redimensionar = 0.5;

try
    
    % Inicia a câmera tipo DCAM
    Camera.Video = videoinput(Camera.Nome{1},1,Camera.Formato{1});
    Camera.Tipo = 1;
    triggerconfig(Camera.Video,'manual');
    Camera.Video.FramesPerTrigger = 1;
    msgbox('Câmera DCAM iniciada no formato RGB24_640x480')
    
catch
    
    try
        
        % Inicia a câmera tipo WINVIDEO
        Camera.Video = videoinput(Camera.Nome{2},1,Camera.Formato{2});
        Camera.Tipo = 2;
        triggerconfig(Camera.Video,'manual');
        Camera.Video.FramesPerTrigger = 1;
        msgbox('Câmera WINVIDEO iniciada no formato MJPG_640x480')
        
    catch
        
        % Apresenta uma mensagem de erro
        errordlg(['               Não foi possível iniciar a câmera!' 10 ... 
                  'Utilize o comando imaqhwinfo e verifique a instalação!'])
        
    end
    
end