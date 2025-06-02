function S = sim_2_d(theta1,theta2,Fe_f0,d_lambda,delta_f_f0,L,N)

% S = sim_2_d(theta1,theta2,Fe) 
%
% Cette fonction cr�e les signaux capteurs sur K points provenant de deux sources
% d�corr�lees de m�me puissance situ�es en theta1 et theta2 sans bruit.
%
% Entr�e : theta1 angle d'�mission de la 1�re source (en dregr�)
%          theta2 angle d'�mission de la 2�me source (en dregr�)
%          Fe_f0  nombre d'�chantillon par p�riode
%          d_lambda ration distance inter-antennes et longueur d'onde centrale
%          delta_f_f0 �cart fr�quentielle divis� par la fr�quence centrale 
%
% Sortie : S      signaux capteurs (dim NxK)

s1 = s_quasi(Fe_f0,delta_f_f0,L); s2 = s_quasi(Fe_f0,delta_f_f0,L);
s = s1+s2; S = s;
n1 = d_lambda*Fe_f0*sin(theta1/180*pi); n2 = d_lambda*Fe_f0*sin(theta2/180*pi);
for n = 2:N
    S = [S;retard(s1,(n-1)*n1,1)+retard(s2,(n-1)*n2,1)];
end