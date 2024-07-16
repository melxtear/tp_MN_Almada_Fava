% TP INTEGRADOR 2024 - EJERCICIO 3 - ALMADA MELODY Y LARA FAVA
%
% Otra forma alternativa de analizar el comportamiento dinámico de este sistema físico es teniendo en cuenta 
% su Modelo de Estados, caracterizado por la ecuación matricial de Estado y la ecuación matricial de Salida.
% A las matrices A, B, C, y D se las llama Matriz de Estado, Entrada, Salida y Transmisión Directa.
% Calcule la posición de la masa M2, es decir, xm2(t) medida desde su centro de masa, cuando el sistema 
% parte del equilibrio. Tenga presente para su análisis, un tiempo inicial to = 0 s, tf = 25 s y una resolución 
% en el cálculo de la ecuación diferencial ?t = 1 ms

Inicializacion_Variables
t0 = 0 ; % Tiempo Inicial [s]
tf = 25 ; % Tiempo Final [s]
x0 = [0 0] ; % Condiciones Iniciales

h1 = 0.001;  % Pasos de solución en segundos (?t = 1 ms)
M1 = (tf-t0)/h1; 
[t, X] = Ec_Dif_Runge_Kutta_O4_Sistemas('Ec_Dif_3',t0, tf, x0, M1); 

X_ = zeros(size(t));
C = [0 1/k_total]; % matriz C de salida
D = 0; % matriz D de transmisión directa
N = length(t);

for i = 1:N
    X_(i) = C*X(i,:)';
end


y_aproximada = X_(:,1);  % Solucion aproximada de la Ecuación Diferencial
disp('Valores de la posicion de la masa en funcion de t: ')
y_aproximada
%Graficamos y_aproximada (contiene las posiciones) en funcion de t

H3 = figure(3);
set(H3,'name','TP INTEGRADOR 2024 - Ejercicio 3','position',[20 50 1200 600],'NumberTitle','off');
plot(t,y_aproximada,'g');
grid
xlabel('t (s)');
ylabel('x (t) (metros)')