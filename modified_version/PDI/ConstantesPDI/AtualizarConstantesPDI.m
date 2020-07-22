%% Atualiza os valores das Constantes do PDI

% Determina as cores dos robôs e da bola
ConstantesPDI.CorNos = TelaConstantesPDI.Cores(1).Value;
ConstantesPDI.CorAdv = TelaConstantesPDI.Cores(2).Value;
ConstantesPDI.CorBola = TelaConstantesPDI.Cores(3).Value;
ConstantesPDI.CorRobo = [TelaConstantesPDI.Cores(4:6).Value];

% Determina as distâncias e as áreas digitadas
ConstantesPDI.DistMin  = str2double(TelaConstantesPDI.Valor(1).String);
ConstantesPDI.DistMax  = str2double(TelaConstantesPDI.Valor(2).String);
ConstantesPDI.Area1Min = str2double(TelaConstantesPDI.Valor(3).String);
ConstantesPDI.Area1Max = str2double(TelaConstantesPDI.Valor(4).String);
ConstantesPDI.Area2Min = str2double(TelaConstantesPDI.Valor(5).String);
ConstantesPDI.Area2Max = str2double(TelaConstantesPDI.Valor(6).String);

% Determina as alturas dos objetos
ConstantesPDI.AlturaCam  = str2double(TelaConstantesPDI.Altura(1).String);
ConstantesPDI.AlturaRobo = str2double(TelaConstantesPDI.Altura(2).String);
ConstantesPDI.AlturaBola = str2double(TelaConstantesPDI.Altura(3).String);