%% Determina as constantes do Jogo

% Determina um padrão para as distâncias, as áreas e a cor
if ~exist('Constantes','var')
    Constantes.DistMin = 20;
    Constantes.DistMax = 50;
    Constantes.Area1Min = 8;
    Constantes.Area1Max = 40;
    Constantes.Area2Min = 2;
    Constantes.Area2Max = 20;
    Constantes.CorRobo = [1 4 7];
    Constantes.CorNos = 6;
    Constantes.CorAdv = 3;
    Constantes.CorBola = 2;
    Constantes.Areas1 = zeros(1,7);
    Constantes.Areas2 = zeros(1,7);
    Constantes.Distancias = zeros(1,7);
    Constantes.AlturaCam = 2000;
    Constantes.AlturaRobo = 70;
    Constantes.AlturaBola = 42.7;
    Constantes.TEnviar = 0.05;
end

try
    
    % Salva as áreas primárias encontradas na variável de constantes
    Constantes.Areas1 = [Cores.AreasM(Cores.AreasM(:,Constantes.CorNos)>0,Constantes.CorNos);...
                         Cores.AreasM(Cores.AreasM(:,Constantes.CorAdv)>0,Constantes.CorAdv);...
                         Cores.AreasM(Cores.AreasM(:,Constantes.CorBola)>0,Constantes.CorBola)]';
    Constantes.Areas1(size(Constantes.Areas1,2)+1:7) = 0;
    Constantes.Areas1(8:size(Constantes.Areas1,2)) = [];
    
    % Salva as áreas secundárias encontradas na variável de constantesCorRobo(1)
    Constantes.Areas2 = [Cores.AreasM(Cores.AreasM(:,Constantes.CorRobo(1))>0,Constantes.CorRobo(1));...
                         Cores.AreasM(Cores.AreasM(:,Constantes.CorRobo(2))>0,Constantes.CorRobo(2));...
                         Cores.AreasM(Cores.AreasM(:,Constantes.CorRobo(3))>0,Constantes.CorRobo(3))]';
    Constantes.Areas2(size(Constantes.Areas2,2)+1:7) = 0;
    Constantes.Areas2(8:size(Constantes.Areas2,2)) = [];
    
    % Salva as distâncias encontradas na variável de constantes
    Constantes.Distancias = Robos.Distancias(~isnan(Robos.Distancias))';
    Constantes.Distancias(size(Constantes.Distancias,2)+1:7) = 0;
    Constantes.Distancias(8:size(Constantes.Distancias,2)) = [];
    
catch
    
end

% Chama a função para criar a tela de constantes
CriarConstantes

% Desabilita o botão de Definir Constantes
set(TelaPrincipal.Botao(8),'enable','off')

% Determina se pode ou não habilitar o botão de Iniciar Jogo
if isrunning(Camera.Video) && exist('Calibracao','var') && exist('Relacao','var') && Partida.Comunicacao == 1 && Partida.Jogo == 0
    set(TelaPrincipal.Botao(4),'enable','on')
end