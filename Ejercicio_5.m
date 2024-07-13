%ejercicio 5
%Calcule la Potencia de la Posición de la masa m2 (Ejercicio#1) y de la velocidad 
%de la masa m2(Ejercicio#4), es decir su energía en el tiempo de análisis.

Inicializacion_Variables
Ejercicio_1 
%en este ejercicio se calculó la posición de la masa m2 en un intervalo de tiempo
%reutilizamos t y X obtenidos (columna de tiempo y de posción)}

Ejercicio_4
%en este ejercicio se calculó la velocidad de la masa m2 con derivacion numerica 
%reutilizamos t y V obtenidos

X_1=X(:,1);
Velocidades_1=Velocidades(:,1);

%elevo al cuadrado a todos los elementos de los vectores de posición y velocidad
XC=X_1.^2;
XpC=Velocidades_1.^2;

%Calculamos las integrales
%Usamos la Regla Trapezoidal Compuesta
Integral_X_Trapezoidal_Compuesta = Regla_Trapezoidal_Compuesta(XC,t0,tf,M1); %posiciones
Integral_V_Trapezoidal_Compuesta = Regla_Trapezoidal_Compuesta(XpC,t0,tf,M1); %velocidades
%Calculo de potencia de posicion y velocidad con formula dada en consigna
Potencia_X_Trapezoidal_Compuesta = (1/(tf-t0))*Integral_X_Trapezoidal_Compuesta;  
Potencia_V_Trapezoidal_Compuesta =(1/(tf-t0))*Integral_V_Trapezoidal_Compuesta;

%Usamos la Regla de Simpson Compuesta
Integral_X_Simpson_Compuesta = Regla_Simpson_Compuesta(XC,t0,tf,M1/2);
Integral_V_Simpson_Compuesta = Regla_Simpson_Compuesta(XpC,t0,tf,M1/2);
%calculo de potencia de posicion y velocidad con formula dada en consigna
Potencia_X_Simpson_Compuesta =(1/(tf-t0))*Integral_X_Simpson_Compuesta;
Potencia_V_Simpson_Compuesta =(1/(tf-t0))*Integral_V_Simpson_Compuesta;


H3=figure;
set(H3,'name','TP INTEGRADOR 2024 - Ejercicio 6','position',[20 50 1200 600],'NumberTitle','off');
area(t,X,'FaceColor',[0.4940 0.1840 0.5560],'EdgeColor',[0.494 0.184 0.556]);
grid
xlabel('t(s)');
ylabel('x(t)[metros]');
title('Potencia de la Posicion Vertical de la Masa');

% Create textbox
annotation(H3,'textbox',...
    [0.699912887107379 0.689921457329543 0.186717998075078 0.0825688073394499],...
    'String',{'Regla de Simpson Compuesta';['Potencia = ' num2str(Potencia_X_Simpson_Compuesta)]},...
    'FitBoxToText','off',...
    'BackgroundColor',[0.800000011920929 0.800000011920929 0.800000011920929]);

% Create textbox
annotation(H3,'textbox',...
    [0.701636188642926 0.801223241590214 0.184793070259869 0.0825688073394497],...
    'String',{'Regla Trapezoidal Compuesta';['Potencia = ' num2str(Potencia_X_Trapezoidal_Compuesta)]},...
    'FitBoxToText','off',...
    'BackgroundColor',[0.800000011920929 0.800000011920929 0.800000011920929]);

J=figure;
set(J,'name','TP INTEGRADOR 2024- Ejercicio 6','position',[20 50 1200 600],'NumberTitle','off');
area(t,Velocidades_1,'FaceColor',[0.4945 0.1845 0.5565],'EdgeColor',[0.4945 0.1845 0.5565]);
grid
xlabel('t(s)');
ylabel('v(t)[metros/s]');
title('Potencia de la Velocidad de la Masa');

% Create textbox
annotation(J,'textbox',...
    [0.699912887107379 0.689921457329543 0.186717998075078 0.0825688073394499],...
    'String',{'Regla de Simpson Compuesta';['Potencia = ' num2str(Potencia_V_Simpson_Compuesta)]},...
    'FitBoxToText','off',...
    'BackgroundColor',[0.800000011920929 0.800000011920929 0.800000011920929]);

% Create textbox
annotation(J,'textbox',...
    [0.701636188642926 0.801223241590214 0.184793070259869 0.0825688073394497],...
    'String',{'Regla Trapezoidal Compuesta';['Potencia = ' num2str(Potencia_V_Trapezoidal_Compuesta)]},...
    'FitBoxToText','off',...
    'BackgroundColor',[0.800000011920929 0.800000011920929 0.800000011920929]);