%% Tela principal

try closepreview(Camera), catch, end

% close all
clear
clc


%% Adiciona as pastas ao path

% Define a pasta atual e carrega seu conte�do
Raiz.PastaPrincipal = pwd;
Raiz.NomePastas = dir(pwd);

% Verifica e adiciona as subpastas ao path
for ii = 1:length(Raiz.NomePastas)
    if Raiz.NomePastas(ii).isdir && Raiz.NomePastas(ii).name(1) ~= '.'
        addpath(genpath([Raiz.PastaPrincipal '\' Raiz.NomePastas(ii).name]));
    end
end

% Retorna � pasta inicial
cd(Raiz.PastaPrincipal)


%% Inicia as vari�veis 

% L� as vari�veis externas salvas
try load Calibracao.mat, catch, end
try load Constantes.mat, catch, end
try load Relacao.mat, catch, end

% Inicia as vari�veis de estado do programa
Partida.Comunicacao = 0;
Partida.Calibracao = 0;
Partida.Jogo = 0;
Partida.Segmentacao = 0;
Partida.Resultados = 0;


%% Chama as fun��es necess�rias para iniciar o programa

% Configura as vari�veis da c�mera
ConfigurarCamera

% Caso consiga iniciar a c�mera, inicia a tela principal do programa
if Camera.Tipo ~= 0
    CriarPrincipal
end