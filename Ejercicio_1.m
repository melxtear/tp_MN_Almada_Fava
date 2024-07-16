% TP INTEGRADOR 2024 - EJERCICIO 1 - ALMADA MELODY Y LARA FAVA
%
% Calcule la posición de la masa m2, es decir, xm2(t) medida desde su centro de masa, cuando el sistema 
% parte del equilibrio. Tenga presente para su análisis, un tiempo inicial t0 = 0 s, tf = 25 s y una resolución 
% en el cálculo de la ecuación diferencial ?t = 1 ms.

Inicializacion_Variables 
t0 = 0 ; % Tiempo Inicial [s]
tf = 25 ; % Tiempo Final [s]
x0 = [0 0] ; % Condiciones Iniciales

h1 = 0.001;  % Pasos de solución en segundos (?t = 1 ms)
M1 = (tf-t0)/h1; 
[t, X] = Ec_Dif_Runge_Kutta_O4_Sistemas('Ec_Dif_1',t0, tf, x0, M1); %utilizamos Runge Kutta para resolver la ecuación diferencial
%t es el vector tiempo, X almacena en una matriz de dos columnas la posición x(t)

n = size(X);
y = X(:,1);  % Solución aproximada de la ecuación diferencial, solo nos interesa la 1era columna que almacena las posiciones x(t)
disp('Valores de la posición de la masa m2 en función de t: ') 
y % imprimimos los valores

%Graficamos las posiciones x(t) en función del tiempo t(s)
H1 = figure(1);
set(H1,'name','TP INTEGRADOR 2024 - Ejercicio 1','position',[20 50 1200 600],'NumberTitle','off');
plot(t,y,'r');
grid
xlabel('t (s)');
ylabel('x (t) (metros ');