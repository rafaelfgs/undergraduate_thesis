%% Atualiza os Valores das Constantes para os Valores Digitados

ConstantesINT.Porta = TelaINT.Edit(1).String;

ConstantesINT.TempoEnvio = str2double(TelaINT.Edit(2).String);

ConstantesINT.Frequencia = str2double(TelaINT.Edit(3).String);

ConstantesINT.Ativo = cell2mat(get(TelaINT.AtivRobo,'value'))' ~= 0;

ConstantesINT.Funcao = [find(cell2mat(get(TelaINT.RadioRobo(:,1),'value'))) ...
                        find(cell2mat(get(TelaINT.RadioRobo(:,2),'value'))) ...
                        find(cell2mat(get(TelaINT.RadioRobo(:,3),'value')))];

ConstantesINT.Campo = find(cell2mat(get(TelaINT.RadioCampo,'value')))*2-3;

try

% Satura��o da velocidade
ConstantesINT.Saturacao = [str2double(TelaConstantesINT.Saturacao(1,1).String) ...
                           str2double(TelaConstantesINT.Saturacao(1,2).String); ...
                           str2double(TelaConstantesINT.Saturacao(2,1).String) ...
                           str2double(TelaConstantesINT.Saturacao(2,2).String)];

% Inclina��o da curva de velocidade
ConstantesINT.Inclinacao = [str2double(TelaConstantesINT.Inclinacao(1).String); ...
                            str2double(TelaConstantesINT.Inclinacao(2).String); ...
                            str2double(TelaConstantesINT.Inclinacao(3).String)];

% Ganhos de cada roda
ConstantesINT.Ganho = [str2double(TelaConstantesINT.Ganho(1,1).String) ...
                       str2double(TelaConstantesINT.Ganho(1,2).String); ...
                       str2double(TelaConstantesINT.Ganho(2,1).String) ...
                       str2double(TelaConstantesINT.Ganho(2,2).String); ...
                       str2double(TelaConstantesINT.Ganho(3,1).String) ...
                       str2double(TelaConstantesINT.Ganho(3,2).String)];

% Erro m�ximo da orienta��o e da posi��o

ConstantesINT.Erro = [str2double(TelaConstantesINT.Erro(1).String); ...
                      str2double(TelaConstantesINT.Erro(2).String)];
catch
end