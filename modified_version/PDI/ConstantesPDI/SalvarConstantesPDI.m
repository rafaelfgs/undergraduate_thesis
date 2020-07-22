%% Salva as constantes atuais

% Pergunta se o usuário deseja salvar as constantes
Escolha.ConstantesPDI = questdlg('Deseja salvar as novas constantes?','Constantes do PDI','Sim','Não','Sim');

% Salva as constantes
if strcmp(Escolha.ConstantesPDI,'Sim')
    save('Arquivos/ConstantesPDI','ConstantesPDI')
end