% TP INTEGRADOR 2024 - EJERCICIO 3 - Ecuaci�n Diferencial 3

function Xp=Ec_Dif_3(~,X)
Inicializacion_Variables
X=X';
A_=[-const_btotal -1/m_total;k_total 0]; % matriz A de estado

% hacemos lo siguiente para ver como se resolv�a al debugearlo
as=(A*m_total); 
ayd=a/as;
B=[ayd;0]; % matriz B de entrada
U=m1*g; 

parte1=A_*X;
parte2=B*U;
Xp=parte1+parte2;
Xp=Xp';

end