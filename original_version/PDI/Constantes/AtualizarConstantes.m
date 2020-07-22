%% Atualiza os valores das Constantes

% Determina as cores dos robôs e da bola
Constantes.CorNos = TelaConstantes.Cores(1).Value;
Constantes.CorAdv = TelaConstantes.Cores(2).Value;
Constantes.CorBola = TelaConstantes.Cores(3).Value;
Constantes.CorRobo = [TelaConstantes.Cores(4:6).Value];

% Determina as distâncias e as áreas digitadas
Constantes.DistMin  = str2double(TelaConstantes.Valor(1).String);
Constantes.DistMax  = str2double(TelaConstantes.Valor(2).String);
Constantes.Area1Min = str2double(TelaConstantes.Valor(3).String);
Constantes.Area1Max = str2double(TelaConstantes.Valor(4).String);
Constantes.Area2Min = str2double(TelaConstantes.Valor(5).String);
Constantes.Area2Max = str2double(TelaConstantes.Valor(6).String);

% Determina as alturas e o tempo de envio
Constantes.TEnviar    = str2double(TelaConstantes.Altura(1).String);
Constantes.AlturaCam  = str2double(TelaConstantes.Altura(2).String);
Constantes.AlturaRobo = str2double(TelaConstantes.Altura(3).String);
Constantes.AlturaBola = str2double(TelaConstantes.Altura(4).String);