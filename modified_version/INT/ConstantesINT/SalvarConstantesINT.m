%% Salva as Constantes Atuais

% Pergunta se o usuário deseja salvar as constantes
Escolha.ConstantesINT = questdlg('Deseja salvar as novas constantes?','Constantes da Inteligência','Sim','Não','Sim');

% Salva as constantes
if strcmp(Escolha.ConstantesINT,'Sim')
    save('Arquivos/ConstantesINT','ConstantesINT')
end