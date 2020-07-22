%% Filtro de Kalman multi-dimensional

function [Xpred,MSE] = FiltroKalman(Xobs,Xpred,MSE,VARW,VARN)

% Onde: 
%		Xobs  - valor observado
%		Xpred - valor da predição
%
%		VARW - variância do sistema
%		VARN - variância da observação
%		MSE  - erro médio quadrático  

% Caso necessário, atualiza o ângulo observados para valores positivos
if (Xobs(3)*Xpred(3)) < 0 && all(abs([Xobs(3) Xpred(3)]) > 90) 
    Xobs(3) = Xobs(3) - sign(Xobs(3))*360;
end

% Gerando variável observada

% Cálculo do ganho de inovação
GanhoK = (MSE + VARN)\MSE;

% Predição
Xpred = Xpred + GanhoK*(Xobs - Xpred);

% Estimação do erro médio quadrático
MSE = (eye(size(GanhoK))-GanhoK)*MSE + VARW;

% Caso necessário, atualiza os ângulos filtrados para valores negativos
if abs(Xpred(3)) > 180
    Xpred(3) = Xpred(3) - sign(Xpred(3))*360;
end