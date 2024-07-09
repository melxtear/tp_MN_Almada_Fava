% EJERCICIO 1 Ecuación Diferencial
function Xp =Ec_Dif_1(t,X)
Inicializacion_Variables
X=X';

B=[0 const1]';
A= [0 1; -const_ktotal -const_btotal];
Xp = A*X + B;
Xp = Xp';
