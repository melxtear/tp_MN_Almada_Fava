% TP INTEGRADOR 2024 - EJERCICIO 2 - ALMADA MELODY Y LARA FAVA
% 
% ¿Cuál es la posición final de la masa ??? Compare el resultado computacional obtenido con la siguiente 
% expresión analítica: Xfm2 = (a*m1*g)/((a^2)*densidad*g+k*A);


Inicializacion_Variables
t0 = 0 ; % Tiempo Inicial [s]
tf = 25 ; % Tiempo Final [s]
x0 = [0 0] ; % Condiciones Iniciales

h1 = 0.001;  % Pasos de solución en segundos (?t = 1 ms)
M1 = (tf-t0)/h1; 
[t, X]= Ec_Dif_Runge_Kutta_O4_Sistemas('Ec_Dif_1',t0, tf, x0, M1); %utilizamos Runge Kutta para resolver la ecuación diferencial
%t es el vector tiempo, X almacena en una matriz de dos columnas la posición x(t)

n=length(X);
x_computacional=X(n);
disp('Ultima posicion (calculada con Runge Kutta)');
x_computacional % nos dio 0.2002

T=t0:0.001:tf;
disp('Ultima posicion (calculada la expresión analítica)');
x_=(a*m1*g)/((a^2)*densidad*g+k*A);
x_ % nos dio 0.2001
X_=zeros(size(T));
X_(:)=x_;
%comparamos valor real y aproximado

y = X(:,1);  % Solución aproximada de la ecuación diferencial

% realizamos un grafico por las dudas (es igual al EJERCICIO 1)
H2=figure(2);
set(H2,'name','TP INTEGRADOR 2024 - Ejercicio 2','position',[20 50 1200 600],'NumberTitle','off');
plot(t,y,'r'); plot(t,y,'r',T,X_,'b--');
grid
xlabel('t (s)');
ylabel('x (t)');

