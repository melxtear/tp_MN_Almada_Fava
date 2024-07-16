% TP INTEGRADOR 2024 - EJERCICIO 9 - ALMADA MELODY Y LARA FAVA
% Se desea realizar la comparaci�n estad�stica del submuestreo e interpolaci�n por el m�todo interpolador de Spline C�bicas 
% del Ejercicio#8. La comparaci�n se realizar� con la se�al temporal de posici�n vertical del Ejercicio#1. Para ello, se pide: 
%     a) Realice un ajuste lineal entre xm2(t) y xsint_SC(t), calculando pendiente, ordenada al origen y coeficiente de 
%     correlaci�n A, B y ? y respectivamente. 
%     b) Grafique la nube de puntos de la relaci�n lineal en un gr�fico ?? junto a las rectas de ajuste lineal. Realice un 
%     c�lculo de residuos en su error cuadr�tico medio.
% Muestre estos errores cuadr�ticos medios junto al gr�fico de correlaci�n lineal.

% utilizamos los resultados del EJERCICIO 8 en el cual se us� el m�todo interpolador de Spline C�bicas en el submuestreo
% el EJERCICIO 8 tiene implementado los datos del EJERCICIO 1, o sea, el vector de posiciones X
Ejercicio_8

% realizamos ejercio 9 a)
% guardamos en un nuevo vector las X calculadas en el EJERCICIO 
X_1 = y; 
% utilizamos el Ajuste Lineal para calcular la pendiente, ordenada de origen y coeficiente correlaci�n a partir del vector de posiciones
[A,B,CC] = Ajuste_Lineal_MC(X_1,x_s_int); 
disp('Pendiente: ')
A
disp('Ordenada de Origen: ')
B
disp('Coeficiente de Correlaci�n: ')
CC 

% realizamos ejercicio 9 b)
% calculamos la sumtoria que se realiza con los valores de Xm2 y xsintsc para calcular el error medio cuadratico seg�n la formula
E = 0; % inicializamos
for k = 1:M1+1
    E=  E +((X_1(k)-x_s_int(k))^2);
end

% calculamos error medio cuadratico
E = (1/(M1+1))*sqrt(E);
Xt = X_1;
y = A*Xt+B; % calculamos la y(x) aproximada a partir de vector de posiciones, pendiente y ordenada de origen para luego graficarla 

% Grafico de la nube de puntos junto a las rectas de ajuste lineal
H12 = figure(12);
set(H12,'name','TP INTEGRADOR 2024 - Ejercicio 9','position',[20 50 1200 600],'NumberTitle','off');
%scatter(X_1, x_s_int, 'bo');
plot(X_1,x_s_int,'rx',Xt,y,'b');
grid
xlabel('Se�al Original x(t)');
ylabel('Se�al Interpolada x_{int}(t)');
title('Nube de Puntos: Se�al Original vs Se�al Interpolada');

% Create textbox
annotation(H12,'textbox',...
    [0.149263762501475 0.810815567729297 0.184793070259869 0.0825688073394497],...
    'String',{'Error Cuadratico Medio';['Error = ' num2str(E)]},...
    'FitBoxToText','off',...
    'BackgroundColor',[0.800000011920929 0.800000011920929 0.800000011920929]);
