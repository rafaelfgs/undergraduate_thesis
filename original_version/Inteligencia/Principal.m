%% Tela principal

% close all
clear
clc


%% Organização das pastas

% Define a pasta atual e carrega seu conteúdo
Raiz.PastaPrincipal = pwd;
Raiz.NomePastas = dir(pwd);

% Verifica e adiciona as pastas ao path
for ii = 1:length(Raiz.NomePastas)
    if Raiz.NomePastas(ii).isdir && Raiz.NomePastas(ii).name(1) ~= '.'
        addpath(genpath([Raiz.PastaPrincipal '\' Raiz.NomePastas(ii).name]))
    end
end

% Retorna à pasta inicial
cd(Raiz.PastaPrincipal)


%% Inicia o programa

% Inicia a tela do programa principal
CriarPrincipal

% Tenta ler o arquivo que contem as contantes
try load Constantes.mat, catch, end

% Inicia as variáveis de partida
Entrada.NErros = [0 0];
Partida.EmJogo = 0;
Partida.EmTeste = 0;
Partida.ComunicacaoPDI = 0;
Partida.ComunicacaoRobos = 0;
Partida.Resultados = 0;
Partida.Pause = 1;