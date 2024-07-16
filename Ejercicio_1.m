% TP INTEGRADOR 2024 - EJERCICIO 1 - ALMADA MELODY Y LARA FAVA
%
% Calcule la posici�n de la masa m2, es decir, xm2(t) medida desde su centro de masa, cuando el sistema 
% parte del equilibrio. Tenga presente para su an�lisis, un tiempo inicial t0 = 0 s, tf = 25 s y una resoluci�n 
% en el c�lculo de la ecuaci�n diferencial ?t = 1 ms.

Inicializacion_Variables 
t0 = 0 ; % Tiempo Inicial [s]
tf = 25 ; % Tiempo Final [s]
x0 = [0 0] ; % Condiciones Iniciales

h1 = 0.001;  % Pasos de soluci�n en segundos (?t = 1 ms)
M1 = (tf-t0)/h1; 
[t, X] = Ec_Dif_Runge_Kutta_O4_Sistemas('Ec_Dif_1',t0, tf, x0, M1); %utilizamos Runge Kutta para resolver la ecuaci�n diferencial
%t es el vector tiempo, X almacena en una matriz de dos columnas la posici�n x(t)

n = size(X);
y = X(:,1);  % Soluci�n aproximada de la ecuaci�n diferencial, solo nos interesa la 1era columna que almacena las posiciones x(t)
disp('Valores de la posici�n de la masa m2 en funci�n de t: ') 
y % imprimimos los valores

%Graficamos las posiciones x(t) en funci�n del tiempo t(s)
H1 = figure(1);
set(H1,'name','TP INTEGRADOR 2024 - Ejercicio 1','position',[20 50 1200 600],'NumberTitle','off');
plot(t,y,'r');
grid
xlabel('t (s)');
ylabel('x (t) (metros ');