%% Filtro de Kalman multi-dimensional

function [Xpred,MSE] = FiltroKalman(Xobs,Xpred,MSE,VARW,VARN)

% Onde: 
%		Xobs  - valor observado
%		Xpred - valor da predi��o
%
%		VARW - vari�ncia do sistema
%		VARN - vari�ncia da observa��o
%		MSE  - erro m�dio quadr�tico  

% Caso necess�rio, atualiza o �ngulo observados para valores positivos
if (Xobs(3)*Xpred(3)) < 0 && all(abs([Xobs(3) Xpred(3)]) > 90) 
    Xobs(3) = Xobs(3) - sign(Xobs(3))*360;
end

% Gerando vari�vel observada

% C�lculo do ganho de inova��o
GanhoK = (MSE + VARN)\MSE;

% Predi��o
Xpred = Xpred + GanhoK*(Xobs - Xpred);

% Estima��o do erro m�dio quadr�tico
MSE = (eye(size(GanhoK))-GanhoK)*MSE + VARW;

% Caso necess�rio, atualiza os �ngulos filtrados para valores negativos
if abs(Xpred(3)) > 180
    Xpred(3) = Xpred(3) - sign(Xpred(3))*360;
end