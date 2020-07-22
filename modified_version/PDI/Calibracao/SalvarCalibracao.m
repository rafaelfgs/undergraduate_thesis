%% Salva o padrão atualizado das cores

% Pergunta se o usuário deseja atualizar a calibração das cores
Escolha.Calibracao = questdlg(['Deseja salvar a nova calibração em',10,...
                               '             Calibracao.mat?'],'Calibração das Cores','Sim','Não','Sim');

% Salva a calibração
if strcmp(Escolha.Calibracao,'Sim')
    save('Arquivos/Calibracao','Calibracao')
end