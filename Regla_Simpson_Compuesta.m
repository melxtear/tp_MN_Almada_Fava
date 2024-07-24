%utilizamos código TP#6

function S = Regla_Simpson_Compuesta(X,a,b,M)

if nargin<4
    disp('Debe ingresar el nombre de la función, los límites de integración y la cantidad de intervalos (mismo M que Trapezoidal, luego se duplica');
    return;
end

h = (b-a)/(2*M);

Sum = 0;
for k=1:M-1
    Sum = Sum + (X(2*k-1)) + 4*X(2*k) + X(2*k+1);
    %Sum = Sum + x(2*k-1)) + 4*feval(f,x(2*k)) + feval(f,x(2*k+1));
end
%sumamos el ultimo elemento
Sum = Sum + (X(2*M-1) + 5*X(2*M));
S = Sum*h/3;
end

