%inicializamos las variables con las cuales vamos a trabajar a lo largo del TP
m1=510;% [kg]
m2=50;% [kg]
RH=3*10^3;% [Ns/m^3]
bt=10;% [Ns/m];
bm=30;% [Ns/m]
k=25;% [N/m]
A=1;% [m^2]
a=10^-3;% [m^2]
densidad=920;% [kg/m^3]
g=9.81;% [m/s^2]

b_total= bm +((a/A)^2)*bt+ RH*a^2;% [Ns/m]
k_total= (((a^2)*densidad*g)/A) + k;% [Ns/m]
m_total= m2 +((a/A)^2)*m1;% [kg]

const1= ((a/A)*g*m1)/m_total; % multiplicado por u(t)
const_btotal= b_total/m_total; 
const_ktotal= k_total/m_total;
