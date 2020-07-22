%% Tela principal

close all
clear
clc


%% Adiciona as pastas ao path

% Define a pasta atual e carrega seu conte�do
Raiz.PastaPrincipal = pwd;
Raiz.NomePastas = dir(pwd);

% Verifica e adiciona as subpastas ao path
for ii = 1:length(Raiz.NomePastas)
    if Raiz.NomePastas(ii).isdir && Raiz.NomePastas(ii).name(1) ~= '.'
        addpath(genpath([Raiz.PastaPrincipal '\' Raiz.NomePastas(ii).name]))
    end
end

% Retorna � pasta inicial
cd(Raiz.PastaPrincipal)


%% Criar a tela principal e inicia as vari�veis

CriarPrincipal

% Inicia as vari�veis de estado do programa
Partida.EmComunicacao = false;
Partida.EmDemo = false;
Partida.EmEnvio = false;
Partida.EmJogo = false;
Partida.EmTeste = false;
Partida.EmVideo = false;
Partida.ExibeSegmentacao = false;
Partida.ExibeResultados = false;