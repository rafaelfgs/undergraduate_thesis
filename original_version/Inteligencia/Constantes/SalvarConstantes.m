%% Salva as constantes atuais

% Pergunta se o usu�rio deseja salvar as constantes
Escolha.Constantes = questdlg('Deseja salvar as novas constantes?','Constantes','Sim','N�o','Sim');

% Salva as constantes
if strcmp(Escolha.Constantes,'Sim')
    
    save('Constantes/Constantes','Constantes')
    
end