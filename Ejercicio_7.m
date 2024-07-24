% TP INTEGRADOR 2024 - EJERCICIO 7 - ALMADA MELODY Y LARA FAVA
%
% La técnica de Submuestreo consiste en tomar las muestras m-ésimas de una señal digital, es decir, reduciendo su 
% frecuencia de muestreo original ? veces. En consecuencia:x[n] ? x[nTS1] ? x[n] ? x[nM]? x[MTS2] 
% con TS2 =MTS1 y TS1 = 1/fs1.
%
% Realice un submuestreo de la posición de la masa Xm2(t) del Ejercicio#1, con un período de muestreo 100 veces 
% menor que el original, es decir, M = 100 o bien, TS2 = MTS1 = 0.1 seg. Grafique estos resultados junto a las 
% posiciones originales, observando esta reducción en la resolución temporal de las señales submuestreadas xs[n].

Inicializacion_Variables
Ejercicio_1 % Utilizamos las posiciones X calculadas en el EJERCICIO 1
X_= X(:,1);
M2 = M1/100; % Reducimos la muestra M1 calculada en el EJERCICIO 1, 100 veces
X_s = zeros(M2+1,1);

for k = 1:M2 
    X_s(k) = X(100*k-99); % almacenamos en el nuevo vector una muestra cada 100 para realizar el submuestre
end
% X_s(M2+1) = (a*m1*g)/((a^2)*densidad*g+k*A);
disp('Submuestreo de la posición de la masa Xm2: ')
X_s % imprimimos en pantalla los valores del submuestreo

TS2 = 0.1;  % dato
ts = t0:TS2:tf; % armo un vector de tiempos t para graficar el valor de X_s en funcion de t (con nuevo intervalo de tiempo, o sea TS2)

% Graficamos el submuestreo
H10 = figure(10);
set(H10,'name','TP INTEGRADOR 2024 - Ejercicio 7','position',[20 50 1200 600],'NumberTitle','off');
plot(t,X_,'r',ts,X_s,'o') % GRAFICAMOS SUBMUESTREO POR ENCIMA DEL MUESTREO ORIGINAL (marcamos los puntos)
grid
xlabel('t (s)');
ylabel('x (t) (metros)');