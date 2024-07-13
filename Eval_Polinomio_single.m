%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Evaluaci�n de Polinomio de Grado N en un punto Xk. Se 
%%% genera una funci�n que var�a seg�n las abscisas ingresadas
%%%
%%% Variables de entrada:
%%%
%%%         Xk: Punto donde se eval�a el polinomio
%%%         C: Coeficientes del polinomio a evaluar
%%%         X0: Centro del polinomio
%%%
%%% Variables de Salida:
%%%
%%%         Poli_Eval: Polinomio evaluado en el entorno de (X-x0)
%%%
%%% Se eval�a en en entorno X al polinomio:
%%%   S(x)=CN*(x-xk0)^N+CN-1*(x-x0)^(N-1)+...+s1*(x-x0)+C0 
%%% 
%%% Dr. Ing. Franco Pessana
%%% Per�odo Lectivo 2020
%%% FICEN
%%% Universidad Favaloro
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Poli_Eval = Eval_Polinomio_single(x,C,x0)

N = length(C)-1; % Orden del Polinomio a Evaluar
Expo = N:-1:0;
Poli = (x-x0).^Expo;
Poli_Eval = C*Poli';
end