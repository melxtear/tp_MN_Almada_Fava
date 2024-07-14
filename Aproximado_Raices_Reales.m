%7. Realice un algoritmo en MatLab, con el M�todo Aproximado de ubicaci�n de 
%Ra�ces reales, que realiza una estimaci�n inicial de las ubicaciones de las ra�ces de 
%la ecuaci�n (xf ) = 0 , utilizando los 2 criterios vistos en la teor�a:
%(i) (yk-1)*(yk)<0 o
%(ii) |yk|< ? k
%y y ( )( ) 0 yk ? yk?1
%yk+1 ? yk < epsilon y (yk-yk-1)*(yk+1-yk-1)<0

%Es decir, si ( ) k?1
%xf y ( ) k
%xf tienen signos opuestos o si ( ) k
%xf es peque�o y la 
%pendiente de la curva y = (xf ) cambia el signo cerca de ( ( )) k k
%x , xf . 
%El algoritmo debe recibir como par�metros de entrada el vector de abscisas X (con 
%cierta resoluci�n), y la tolerancia. Como par�metros de salida, deber� entregar un 
%vector R, conteniendo las ra�ces aproximadas. La funci�n (xf ) debe haberse 
%almacenado previamente como una funci�n objeto MatLab, por ejemplo f.m. 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Ejercicio Nro. 7 TP#4 M�todos Num�ricos
%%%
%%% Raices de funciones no lineales por M�todo Aproximado de ubicaci�n de Ra�ces reales
%%%
%%% function [c,err,y_r] = Aproximado_Raices_Reales(f,a,b,delta)
%%%
%%% Par�metros de Entrada:
%%%
%%%       f= funcion
%%%       df= derivada de la funcion 
%%%       X= vector de abscisas
%%%       epsilon = m�nimo valor aceptado de la funci�n en el cero obtenido
%%%       M=tolerancia
%%% Par�metros de Salida:
%%%
%%%     R = vector que contiene las raices
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [R] = Aproximado_Raices_Reales(t,epsilon, X)

if nargin<3
    disp('Debe ingresar t, epsilon y X');
    return;
end
N1=length(X);
R = [];
%variacion_x=(xf-x0)/Max;
%%vector de rango
%X=x0:variacion_x:xf;
N=length(t);
%x_aux=X(1):1:X(N1); 

Max=length(X);
%xk=x0;
i=1;
for k=2:Max-1
    if k+1<=Max && k-1>0
       yk = X(k);
       yk_minus_1= X(k-1);
       if (yk_minus_1*yk)<0
          r=(X(k)+X(k-1))/2;
          R=[R, r];
       else%if(abs(yk) < epsilon && (yk - yk_minus_1)*(yk_plus_1 - yk)< 0)
          punto_1 = X(k) - X(k-1);
          punto_2 = X(k+1) - X(k);
          pend=punto_1*punto_2;
          if pend<0 && X(k) < epsilon
            r=X(k);
            R=[R,r];
            i=i+1;
          end
       end
    end
end


    


