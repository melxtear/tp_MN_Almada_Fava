%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Reutilizamos Algoritmo de TP#4 Métodos Numéricos
%%%
%%% Aproximación a las raices de f(x)=0 para un intervalo considerado
%%%
%%% function R = Raices_Aproximadas(X,epsilon)
%%%
%%% Parámetros de Entrada:
%%%
%%%       y = Vector conteniendo el intervalo con la resolución deseada
%%%           de estimación de raíces 
%%%       epsilon = Tolerancia para la aproximación de los ceros pares
%%%       t = vector de tiempos
%%%
%%% Parámetros de Salida:
%%%
%%%      R   = Vector conteniendo las raíces aproximadas de f(x),
%%%            resolución dependiente de X
%%%

function [R,r] = Raices_Aproximadas(t,epsilon,y)

if nargin<3
    disp('Debe ingresar el Vector T, epsilon y el vector Y');
    return;
end
N=length(t);
T=zeros(N+1,1);
Y=zeros(N+1,1);
for k=1:N
    Y(k)=y(k);
    T(k)=t(k);
end
Rango=max(Y)-min(Y);    % Rango de valores de la función para establecer la cota 
epsilon2=epsilon*Rango; % La cota es un porcentaje del rango
Cont=0;
Y(N+1)=Y(N);
T(N+1)=T(N);
R=NaN;
r=NaN;
for k=2:N
    if (Y(k)*Y(k-1))<=0
        if (abs(Y(k)+Y(k-1))/2) < epsilon2
            Cont=Cont+1;
            aux=R;
            AUX=r;
            R=zeros(Cont,1);
            r=zeros(Cont,2);
            for i=1:Cont-1
                R(i)=aux(i);
                r(i,:)=AUX(i,:);
            end
            R(Cont)=(T(k)+T(k-1))/2;
            r(Cont,:)=[k-1,k];
        end
    end
    pend1 = Y(k)-Y(k-1);
    pend2 = Y(k+1)-Y(k);
    pends = pend1*pend2;
    if (abs(Y(k))<0) && pends<0
       Cont=Cont+1;
            aux=R;
            AUX=r;
            R=zeros(Cont,1);
            r=zeros(Cont,2);
            for i=1:Cont-1
                R(i)=aux(i);
                r(i,:)=AUX(i,:);
            end
       R(Cont)=T(k);
       r(Cont,:)=[k,k];
   end

end
R=R';
end