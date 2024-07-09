%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Ejercicio Nro. 0 TP#6 M�todos Num�ricos
%%%
%%% Aproximaci�n central de derivada de orden cuadr�tico
%%%
%%% function [L,n] = Derivada_Central_O2(f,x,Tol)
%%%
%%% Par�metros de Entrada:
%%%
%%%       f = Nombre de la funci�n a derivar (almacenada en un .m)
%%%       x = abscisa donde se evaluar� la derivada
%%%       Tol = Tolerancia de Error para las aproximaciones k-�simas de la
%%%       derivada
%%%
%%% Par�metros de Salida:
%%%
%%%      L = [H,D,E] matriz que contiene los siguientes vectores:
%%%             H = vector conteniendo el tama�o de los Ax
%%%             D = vector que contiene las aproximaciones k-esimas de la
%%%             derivada
%%%             E = vector que contiene el error en la derivada k-�sima y
%%%             la k-�sima anterior
%%%      n = el valor de k en donde se produce la mejor aproximaci�n de la
%%%      derivada
%%%
%%% Dr. Ing. Franco Pessana
%%% Per�odo Lectivo 2015
%%% FICEN
%%% Universidad Favaloro
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [L,n] = Derivada_Central_O2(f,x,Tol)

if nargin<3
    disp('Debe ingresar el nombre de la funci�n, la abscisa de derivaci�n y el error de tolerancia');
    return;
end

h = 1;
H(1) = h;
D(1) = (feval(f,x+H(1))-feval(f,x-H(1)))/(2*H(1));
E(1) = abs(D(1));
H(2) = H(1)/10;
D(2) = (feval(f,x+H(2))-feval(f,x-H(2)))/(2*H(2));
E(2) = abs(D(2)-D(1));
H(3) = H(2)/10;
D(3) = (feval(f,x+H(3))-feval(f,x-H(3)))/(2*H(3));
E(3) = abs(D(3)-D(2));
k=2;
while (abs(D(k+1)-D(k)) < abs(D(k)-D(k-1))) && (Tol < E(k))
    H(k+2) = H(k+1)/10;
    D(k+2) = (feval(f,x+H(k+2))-feval(f,x-H(k+2)))/(2*H(k+2));
    E(k+2) = abs(D(k+2)-D(k+1));
    k = k+1;
end
n = k;
L = [H' D' E'];