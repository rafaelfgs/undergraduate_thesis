%% Salva o padr�o atualizado das cores

% Pergunta se o usu�rio deseja atualizar a calibra��o das cores
Escolha.Calibracao = questdlg(['Deseja salvar a nova calibra��o em',10,...
                               '             Calibracao.mat?'],'Calibra��o das Cores','Sim','N�o','Sim');

% Salva a calibra��o
if strcmp(Escolha.Calibracao,'Sim')
    save('Arquivos/Calibracao','Calibracao')
end