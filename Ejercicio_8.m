%ejercicio 8
%Teniendo en cuenta la se�al de posici�n submuestreada de la masa m2, xs[n] del ejercicio anterior, se pide: 
%Encontrar una interpolaci�n mediante polinomios interpoladores de tercer grado, es decir, mediante Spline 
%C�bicas. Esta se�al interpolada se denominar� . Realice un gr�fico conjunto de las posiciones 
%submuestreadas y su correspondiente interpolaci�n polinomial, con un ?? = 1 ms. De esta forma, se 
%obtendr� una se�al interpolada de posici�n de la masa ?? de la misma longitud temporal de la se�al original 
%de la posici�n de la masa ??, es decir, (?). 

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

MC=Spline_Cubica(ts,X_s');
MC

N=size(MC,1);
L=100;
x=zeros(N,L+1);
for k=1:N
    d=0.001; %armado de abscisas temporales, es delta t=1ms
    x(k,:)=ts(k):d:ts(k+1);
end

% Armado y graficado de los polinomios interpoladores con mejor resolucion
n2=size(x,2);
Poli_Int=zeros(N,n2);
x_s_int=zeros(size(t));
H8=figure;
set(H8, 'name', 'TP INTEGRADOR 2024 - Ejercicio 8', 'position', [20 50 1200 600], 'NumberTitle', 'off');
for k=1:N
    Poli_Int_k = Eval_Polinomio2(x(k,:), MC(k,:), ts(k)); 
    Poli_Int(k,:) = Poli_Int_k(:); % Asegurarse de que sea un vector fila
    plot(x(k,:),Poli_Int(k,:))
    hold on
end
hold off
grid
xlabel('t (s)');
ylabel('x(t) (metros)');

cont=1;
for k=1:N
    for i=1:L
        x_s_int(cont)=Poli_Int(k,i);
        cont=cont+1;
    end
   
end
x_s_int(M1+1)=x_s_int(M1);

