%% Salva as constantes atuais

% Pergunta se o usu�rio deseja salvar as constantes
Escolha.Constantes = questdlg(['Deseja salvar as novas constantes em',10,...
                               '              Constantes.mat?'],'Constantes','Sim','N�o','Sim');

% Salva as constantes
if strcmp(Escolha.Constantes,'Sim')
    save('Arquivos/Constantes','Constantes')
end