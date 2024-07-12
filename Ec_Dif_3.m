function Xp=Ec_Dif_3(~,X)
Inicializacion_Variables
X=X';
A_=[-const_btotal -1/m_total;k_total 0];
as=(A*m_total);
ayd=a/as;
B=[ayd;0];
U=m1*g;
parte1=A_*X;
parte2=B*U;
Xp=parte1+parte2;
Xp=Xp';
end