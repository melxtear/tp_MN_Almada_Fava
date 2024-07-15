% TP INTEGRADOR 2024 - EJERCICIO 4 - ALMADA MELODY Y LARA FAVA
%
% Calcule la velocidad de la masa m2, es decir, vm2(t) =dxm2(t)/dt del Ejercicio#1, mediante el uso de la rutina 
% de cálculo de derivada numérica que considere más conveniente según la naturaleza de la señal a derivar.

Inicializacion_Variables
Ejercicio_1 % utilizamos los resultados de X (posiciones) calculados en el ejercicio 1, almacenados en un vector con el mismo nombre

X_= X(:,1); % almacenamos los valores de la 1era columna en un nuevo vector con el que vamos a trabajar para calcular las derivadas
Velocidades = Derivada_Central_O4(X_,t); % calculamos las velocidades a partir de derivar la posicion: dx(t)/dt con Derivada Central

Velocidades %imprimimos para ver los valores de velocidades en pantalla

H4=figure(4);
set(H4,'name','TP INTEGRADOR 2024 - Ejercicio 4','position',[20 50 1200 600],'NumberTitle','off');
plot(t,Velocidades,'b');
grid
xlabel('t(s)');
ylabel('v = dx(t)/dt [m/s]');
%subplot(2,1,1);
%plot(t,X_,'r')
%grid
%xlabel('t(s)');
%ylabel('x(t)[m]');

%subplot(2,1,2);
%plot(t,Velocidades,'b');
%grid
%xlabel('t(s)');
%ylabel('v=dx(t)/dt [m/s]');


H5=figure(5);
set(H5,'name','TP INTEGRADOR 2024 - Ejercicio 1 vs Ejercicio 4','position',[20 50 1200 600],'NumberTitle','off');
subplot(2,1,1);
plot(t,X_,'r')
grid
xlabel('t (s)');
ylabel('x (t) [m]');

subplot(2,1,2);
plot(t,Velocidades,'b');
grid
xlabel('t (s)');
ylabel('v = dx(t)/dt [m/s]');

