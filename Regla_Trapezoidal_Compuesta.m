%utilizamos código TP#6

function S = Regla_Trapezoidal_Compuesta(X,a,b,M)

if nargin<4
    disp('Debe ingresar el nombre de la función, los límites de integración y la cantidad de intervalos');
    return;
end

h = (b-a)/M;
Sum = 0;
for k=1:(M-1)
    %Sum = Sum + feval(f,x0+k*h);
    Sum = Sum + X(k);
end
S = h*(X(1) + X(M))/2 + h*Sum;



