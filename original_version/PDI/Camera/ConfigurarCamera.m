%% Configura a C�mera

% Determina o nome do adaptador e o formato da imagem utilizado
Camera.Nome = {'dcam','winvideo'};
Camera.Formato = {'RGB24_640x480','MJPG_640x480'};
Camera.Tipo = 0;
Camera.Redimensionar = 0.5;

try
    
    % Inicia a c�mera tipo DCAM
    Camera.Video = videoinput(Camera.Nome{1},1,Camera.Formato{1});
    Camera.Tipo = 1;
    triggerconfig(Camera.Video,'manual');
    Camera.Video.FramesPerTrigger = 1;
    msgbox('C�mera DCAM iniciada no formato RGB24_640x480')
    
catch
    
    try
        
        % Inicia a c�mera tipo WINVIDEO
        Camera.Video = videoinput(Camera.Nome{2},1,Camera.Formato{2});
        Camera.Tipo = 2;
        triggerconfig(Camera.Video,'manual');
        Camera.Video.FramesPerTrigger = 1;
        msgbox('C�mera WINVIDEO iniciada no formato MJPG_640x480')
        
    catch
        
        % Apresenta uma mensagem de erro
        errordlg(['               N�o foi poss�vel iniciar a c�mera!' 10 ... 
                  'Utilize o comando imaqhwinfo e verifique a instala��o!'])
        
    end
    
end