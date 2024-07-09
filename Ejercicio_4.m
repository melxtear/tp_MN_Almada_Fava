%Calcule la velocidad de la masa ??, es decir, ???%(?) =%????%(?)%??%del Ejercicio#1, mediante el uso de la rutina 
%de cálculo de derivada numérica que considere más conveniente según la naturaleza de la señal a derivar.

Inicializacion_Variables
Ejercicio_1

X_=X(:,1);
Velocidades = Derivada_Central_O4(X_,t);

Velocidades
H1=figure;
set(H1,'name','TP INTEGRADOR 2024 - Ejercicio 4','position',[20 50 1200 600],'NumberTitle','off');
subplot(2,1,1);
plot(t,X_,'r')
grid
xlabel('t(s)');
ylabel('x(t)[m]');

subplot(2,1,2);
plot(t,Velocidades,'b');
grid
xlabel('t(s)');
ylabel('v=dx(t)/dt [m/s]');
