%% Salva as Constantes Atuais

% Pergunta se o usu�rio deseja salvar as constantes
Escolha.ConstantesINT = questdlg('Deseja salvar as novas constantes?','Constantes da Intelig�ncia','Sim','N�o','Sim');

% Salva as constantes
if strcmp(Escolha.ConstantesINT,'Sim')
    save('Arquivos/ConstantesINT','ConstantesINT')
end