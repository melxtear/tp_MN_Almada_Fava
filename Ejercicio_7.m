%ejercicio 7
Inicializacion_Variables
Ejercicio_1
X_=X(:,1);
M2=M1/100;%Reducimos la muestra 100 veces
X_s=zeros(M2+1,1);

for k=1:M2
    X_s(k)=X(100*k-99); %almacenamos en el nuevo vector una muestra cada 100 para realizar el submuestreo
end
X_s(M2+1)=(a*m1*g)/((a^2)*densidad*g+k*A);
X_s
%1:M:end
TS2=0.1; 
ts=t0:TS2:tf;

H=figure;
set(H,'name','TP INTEGRADOR 2024 - Ejercicio 7','position',[20 50 1200 600],'NumberTitle','off');
plot(t,X_,'r',ts,X_s,'o') %GRAFICAMOS SUBMUESTREO POR ENCIMA DEL MUESTREO ORIGINAL (marcamos los puntos)
grid
xlabel('t (s)');
ylabel('x (t) (metros)');