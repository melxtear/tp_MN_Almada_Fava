Inicializacion_Variables
t0 = 0 ; % Tiempo Inicial [s]
tf = 25 ; % Tiempo Final [s]
x0 = [0 0] ; % Condiciones Iniciales

h1 = 0.001;  % Pasos de solución en segundos (?t = 1 ms)
M1 = (tf-t0)/h1; 
[t, X]= Ec_Dif_Runge_Kutta_O4_Sistemas('Ec_Dif_1',t0, tf, x0, M1); 

n=length(X);
x_computacional=X(n);
disp('Ultima posicion');
x_computacional %nos dio 0.2002

x_=(a*m1*g)/((a^2)*densidad*g+k*A);
x_ %nos dio 0.2001
y = X(:,1);  % Solución aproximada de la ecuación diferencial
H=figure;
set(H,'name','TP INTEGRADOR 2024 - Ejercicio 1','position',[20 50 1200 600],'NumberTitle','off');
plot(t,y,'r');
grid
xlabel('t (s)');
ylabel('x (t) ');