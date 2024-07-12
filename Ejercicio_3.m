%ejercicio 3
Inicializacion_Variables
t0 = 0 ; % Tiempo Inicial [s]
tf = 25 ; % Tiempo Final [s]
x0 = [0 0] ; % Condiciones Iniciales

h1 = 0.001;  % Pasos de solución en segundos (?t = 1 ms)
M1 = (tf-t0)/h1; 
[t, X]= Ec_Dif_Runge_Kutta_O4_Sistemas('Ec_Dif_3',t0, tf, x0, M1); 

X_=zeros(size(t));
C=[0 1/k_total];
D=0;
N=length(t);

for i=1:N
    X_(i)=C*X(i,:)';
end


y_aproximada = X_(:,1);  % Soluci?n aproximada de la Ec. Dif.
H1=figure(3);
set(H1,'name','TP INTEGRADOR 2024 - Ejercicio 3','position',[20 50 1200 600],'NumberTitle','off');
plot(t,y_aproximada,'g');
grid
xlabel('t (s)');
ylabel('x(t) (metros)')

   

