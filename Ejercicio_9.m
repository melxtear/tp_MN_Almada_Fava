%ejercicio 9
Ejercicio_8
%ejercio 9 a)
X_1=X(:,1);
[A,B,CC]=Ajuste_Lineal_MC(X_1,x_s_int);
disp('Pendiente:')
A
disp('Ordenada de Origen:')
B
disp('Coeficiente de Correlación:')
CC 

%ejercicio 9 b)
E=0;
for k=1:M1+1
    E=E+((X_1(k)-x_s_int(k))^2);
end

E=(1/(M1+1))*sqrt(E);
Xt=-0.5:h1:2;
y=A*Xt+B;

H9=figure;
set(H9,'name','TP INTEGRADOR 2024 - Ejercicio 9','position',[20 50 1200 600],'NumberTitle','off');
%scatter(X_1, x_s_int, 'bo');
plot(X_1,x_s_int,'rx',Xt,y,'b');
xlabel('Señal Original x(t)');
ylabel('Señal Interpolada x_{int}(t)');
title('Nube de Puntos: Señal Original vs Señal Interpolada');
%Grafico de la nube de puntos junto a 
%las rectas de ajuste lineal


%plot(X,x_s_int,'rx',Xt,y,'b');
%grid
%xlabel('t (s)');
%ylabel('x(t)');

% Create textbox
annotation(H9,'textbox',...
    [0.149263762501475 0.810815567729297 0.184793070259869 0.0825688073394497],...
    'String',{'Error Cuadratico Medio';['Error = ' num2str(E)]},...
    'FitBoxToText','off',...
    'BackgroundColor',[0.800000011920929 0.800000011920929 0.800000011920929]);
