function [f0,S_filtre] = trait(S,Fe);

% [f0,S_filtre] = trait(S,Fe);
%
% Cette fonction d�termine la fr�quence f0 du signal S puis le filtre
% 
% Entr�e S        signal � traier (dim NxK)
%        Fe       fr�quence d'�chantillonnage
%
% Sortie f0       fr�quence centrale
%        S_filtre signal filtr�

clc
[f0,delta_f] = para(S,Fe);
S_filtre = filtrage(S,f0,delta_f,Fe);