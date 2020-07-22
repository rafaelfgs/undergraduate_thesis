%% Determina e salva a relação de pixels para metros do campo

% Pergunta se o usuário deseja salvar o campo
Escolha.Campo = questdlg(['Deseja salvar o novo campo em',10,...
                          '             Relacao.mat?'],'Relação PX2MM','Sim','Não','Sim');

% Salva o campo
if strcmp(Escolha.Campo,'Sim')
    save('Arquivos/Relacao','Relacao')
end