%% Determina e salva a rela��o de pixels para metros do campo

% Pergunta se o usu�rio deseja salvar o campo
Escolha.Campo = questdlg(['Deseja salvar o novo campo em',10,...
                          '             Relacao.mat?'],'Rela��o PX2MM','Sim','N�o','Sim');

% Salva o campo
if strcmp(Escolha.Campo,'Sim')
    save('Arquivos/Relacao','Relacao')
end