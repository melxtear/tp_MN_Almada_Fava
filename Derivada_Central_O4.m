function Velocidades = Derivada_Central_O4(x,t)

if nargin<2
    disp('Debe ingresar el nombre de la funci?n, la abscisa de derivaci?n y el error de tolerancia');
    return;
end

h = 0.01;
N=length(x);
D(1) = (-3*x(1)+4*x(2)-x(3))/(2*h); % aplicamos derivada hacia adelante con error cuadratico
D(N) = (3*x(N)-4*x(N-1)+x(N-2))/(2*h); % aplicamos derivada hacia atras con error cuadratico
D(2) = (x(3)-x(1))/(2*h); % aplicamos derivada central con error cuadratico
D(N-1) = (x(N)-x(N-2))/(2*h); % aplicamos derivada central con error cuadratico

for k=3:1:N-2
    % aplicamos derivada central con error 4
    D(k)=(-x(k+2)+8*x(k+1)-8*x(k-1)+x(k-2))/(12*h); % vector de velocidades
end
Velocidades = D';