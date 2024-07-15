% TP INTEGRADOR 2024 - EJERCICIO 6 - ALMADA MELODY Y FAVA LARA
% Calcule los tiempos de cruce por los puntos de equilibrio de la posici�n y velocidad de la masa xm2(t) 
% y vm2(t) respectivamente, de los Ejercicio#1 y #4. Almacene dichos valores en un vector y calcule sus 
% diferencias consecutivas, para conocer valor medio y desv�o est�ndar de los mismos.

Inicializacion_Variables
Ejercicio_4 % aca invocamos tambi�n al ejercicio 1, reutilizamos datos

Velocidades_6 = Velocidades; % almacenamos en un nuevo vector las velocidades del EJERCICIO 4

X_6 = X(:,1)-(a*m1*g)/((a^2)*densidad*g+k*A); % almacenamos en un nuevo vector las posiciones del EJERCICIO 1 y les restamos la posicion de equilibrio

Wn = (k_total/m_total)^(1/2);
epsilon = 0.001;
X_tce = pi/(Wn*sqrt(1-epsilon^2));

%calculamos raices aproximadas
R_Posiciones =  Raices_Aproximadas(t, epsilon, X_6);
Xf = zeros(size(R_Posiciones));
%xf =(a*m1*g)/((a^2)*densidad*g+k*A);
%Xf(:) = xf;

R_Velocidades = Raices_Aproximadas(t,epsilon,Velocidades_6);
Vf = zeros(size(R_Posiciones));

H8 = figure(8);
set(H8,'name','TP INTEGRADOR 2024 - Ejercicio 6','position',[20 50 1200 600],'NumberTitle','off');
plot(t,X_6,'r',R_Posiciones,Xf,'bo');
grid
xlabel('t (s)');
ylabel('x (t)');
title('Posicion de la masa');

H9 = figure(9);
set(H9,'name','TP INTEGRADOR 2024 - Ejercicio 6','position',[20 50 1200 600],'NumberTitle','off');
plot(t,Velocidades_6,'r',R_Velocidades,Vf,'bo');
grid
xlabel('t (s)');
ylabel('v (t) (m/s)');
title('Velocidad de la masa');

% calculamos TCE 
TCE = zeros(size(R_Posiciones));
TCE(1) = R_Posiciones(1);
for k = 1:length(R_Posiciones)-1
    TCE(k+1) = R_Posiciones(k+1)-R_Posiciones(k);
end

Valor_Medio_TCE = sum(TCE)/(length(TCE));
Desvio_Estandar_TCE = sqrt(sum((TCE-Valor_Medio_TCE).^2)/(length(TCE)-1));
Wn = sqrt(k_total/m_total);
Ep = bt/(2*sqrt(k_total*m_total));
%calculamos TCE teorico
TCER = pi/(Wn*sqrt(1-Ep^2));

% comparamos el valor obtenido de TCE con teorico
% Create textbox
annotation(H8,'textbox',...
    [0.699912887107379 0.689921457329543 0.186717998075078 0.0825688073394499],...
    'String',{'Valor Real';['TCE = ' num2str(Valor_Medio_TCE) ' +/- ' num2str(Desvio_Estandar_TCE)]},...
    'FitBoxToText','off',...
    'BackgroundColor',[0.800000011920929 0.800000011920929 0.800000011920929]);

% Create textbox
annotation(H8,'textbox',...
    [0.701636188642926 0.801223241590214 0.184793070259869 0.0825688073394497],...
    'String',{'Valor Teorico';['TCE = ' num2str(TCER)]},...
    'FitBoxToText','off',...
    'BackgroundColor',[0.800000011920929 0.800000011920929 0.800000011920929]);

%TCE2 = zeros (size(R_Velocidades));
%TCE2(1) = R_Velocidades(1);
%for k = 1:length(R_Velocidades)-1
%   TCE(k+1) =  R_Velocidades(k+1)-R_Velocidades(k);
%end

%Valor_Medio_TCE_2 =- sum(TCE2)/(length(TCE2));
%Desvio_Estandar_TCE_2 = sqrt(sum((TCE2-Valor_Medio_TCE_2).^2)/(length(TCE2)-1));

% Create textbox
%annotation(H9,'textbox',...
 %   [0.699912887107379 0.689921457329543 0.186717998075078 0.0825688073394499],...
  %  'String',{'Valor Real';['TCE 2= ' num2str(Valor_Medio_TCE_2) ' +/- ' num2str(Desvio_Estandar_TCE_2)]},...
   % 'FitBoxToText','off',...
    %'BackgroundColor',[0.800000011920929 0.800000011920929 0.800000011920929]);

% Create textbox
%annotation(H9,'textbox',...
 %   [0.701636188642926 0.801223241590214 0.184793070259869 0.0825688073394497],...
 %   'String',{'Valor Teorico';['TCE = ' num2str(TCER)]},...
  %  'FitBoxToText','off',...
   % 'BackgroundColor',[0.800000011920929 0.800000011920929 0.800000011920929]);
    