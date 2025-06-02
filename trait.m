function [f0,S_filtre] = trait(S,Fe);

% [f0,S_filtre] = trait(S,Fe);
%
% Cette fonction détermine la fréquence f0 du signal S puis le filtre
% 
% Entrée S        signal à traier (dim NxK)
%        Fe       fréquence d'échantillonnage
%
% Sortie f0       fréquence centrale
%        S_filtre signal filtré

clc
[f0,delta_f] = para(S,Fe);
S_filtre = filtrage(S,f0,delta_f,Fe);