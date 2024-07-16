% TP INTEGRADOR 2024 - EJERCICIO 5 - ALMADA MELODY Y FAVA LARA
%
% Calcule la Potencia de la Posición de la masa m2 (Ejercicio#1) y de la velocidad 
% de la masa m2(Ejercicio#4), es decir su energía en el tiempo de análisis.

Inicializacion_Variables

% en este ejercicio se calculó la posición de la masa m2 en un intervalo de tiempo
% reutilizamos t y X obtenidos (columna de tiempo y de posición)
Ejercicio_1

% en este ejercicio se calculó la velocidad de la masa m2 con derivacion numerica 
% reutilizamos t y V obtenidos
Ejercicio_4

X_1 = X(:,1); % almacenamos en un nuevo vector las velocidades obtenidas del EJERCICIO 1
Velocidades_1=Velocidades(:,1); % almacenamos en un nuevo vector las velocidades obtenidas del EJERCICICIO 4

% elevo al cuadrado a todos los elementos de los vectores de posición y velocidad
XC = X_1.^2;
XpC = Velocidades_1.^2;

% Calculamos las integrales
% Usamos la Regla Trapezoidal Compuesta
Integral_X_Trapezoidal_Compuesta = Regla_Trapezoidal_Compuesta(XC,t0,tf,M1); %posiciones
Integral_V_Trapezoidal_Compuesta = Regla_Trapezoidal_Compuesta(XpC,t0,tf,M1); %velocidades

% Calculo de potencia de posicion y velocidad con formula dada en consigna
Potencia_X_Trapezoidal_Compuesta = (1/(tf-t0))*Integral_X_Trapezoidal_Compuesta;  
Potencia_V_Trapezoidal_Compuesta =(1/(tf-t0))*Integral_V_Trapezoidal_Compuesta;

% Usamos la Regla de Simpson Compuesta
Integral_X_Simpson_Compuesta = Regla_Simpson_Compuesta(XC,t0,tf,M1/2);
Integral_V_Simpson_Compuesta = Regla_Simpson_Compuesta(XpC,t0,tf,M1/2);
% Calculo de potencia de posicion y velocidad con formula dada en consigna
Potencia_X_Simpson_Compuesta =(1/(tf-t0))*Integral_X_Simpson_Compuesta;
Potencia_V_Simpson_Compuesta =(1/(tf-t0))*Integral_V_Simpson_Compuesta;

% Graficamos la potencia obtenida a partir de aplicar de la Regla Trapezoidal Compuesta y Simpson Compuesta 
% para las posiciones X
H6 = figure(6);
set(H6,'name','TP INTEGRADOR 2024 - Ejercicio 5','position',[20 50 1200 600],'NumberTitle','off');
area(t,X,'FaceColor',[0.4940 0.1840 0.5560],'EdgeColor',[0.494 0.184 0.556]);
grid
xlabel('t(s)');
ylabel('x(t)[metros]');
title('Potencia de la Posicion Vertical de la Masa');

% Create textbox con valor númerico de la potencia calculada con la Regla de Simpson Compuesta
annotation(H6,'textbox',...
    [0.699912887107379 0.689921457329543 0.186717998075078 0.0825688073394499],...
    'String',{'Regla de Simpson Compuesta';['Potencia = ' num2str(Potencia_X_Simpson_Compuesta)]},...
    'FitBoxToText','off',...
    'BackgroundColor',[0.800000011920929 0.800000011920929 0.800000011920929]);
 
% Create textbox con valor númerico de la potencia calculada con la Regla Trapezoidal Compuesta
annotation(H6,'textbox',...
    [0.701636188642926 0.801223241590214 0.184793070259869 0.0825688073394497],...
    'String',{'Regla Trapezoidal Compuesta';['Potencia = ' num2str(Potencia_X_Trapezoidal_Compuesta)]},...
    'FitBoxToText','off',...
    'BackgroundColor',[0.800000011920929 0.800000011920929 0.800000011920929]);

% Graficamos la potencia obtenida a partir de aplicar la Regla Trapezoidal Compuesta y Simpson Compuesta 
% para las velocidades (Velocidades_1)
H7 = figure(7);
set(H7,'name','TP INTEGRADOR 2024- Ejercicio 5','position',[20 50 1200 600],'NumberTitle','off');
area(t,Velocidades_1,'FaceColor',[0.4945 0.1845 0.5565],'EdgeColor',[0.4945 0.1845 0.5565]);
grid
xlabel('t(s)');
ylabel('v(t)[metros/s]');
title('Potencia de la Velocidad de la Masa');

% Create textbox con valor númerico de la potencia calculada con la Regla de Simpson Compuesta
annotation(H7,'textbox',...
    [0.699912887107379 0.689921457329543 0.186717998075078 0.0825688073394499],...
    'String',{'Regla de Simpson Compuesta';['Potencia = ' num2str(Potencia_V_Simpson_Compuesta)]},...
    'FitBoxToText','off',...
    'BackgroundColor',[0.800000011920929 0.800000011920929 0.800000011920929]);

% Create textbox con valor númerico de la potencia calculada con la Regla Trapezoidal Compuesta
annotation(J,'textbox',...
    [0.701636188642926 0.801223241590214 0.184793070259869 0.0825688073394497],...
    'String',{'Regla Trapezoidal Compuesta';['Potencia = ' num2str(Potencia_V_Trapezoidal_Compuesta)]},...
    'FitBoxToText','off',...
    'BackgroundColor',[0.800000011920929 0.800000011920929 0.800000011920929]);