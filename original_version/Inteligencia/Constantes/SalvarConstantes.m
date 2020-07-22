%% Salva as constantes atuais

% Pergunta se o usuário deseja salvar as constantes
Escolha.Constantes = questdlg('Deseja salvar as novas constantes?','Constantes','Sim','Não','Sim');

% Salva as constantes
if strcmp(Escolha.Constantes,'Sim')
    
    save('Constantes/Constantes','Constantes')
    
end