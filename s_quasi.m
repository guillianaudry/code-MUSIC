function s = s_quasi(Fe_f0,delta_f_f0,L)

% s = s_quasi(fo,delta_f,Fe,K)
%
% Ce programme génère un signal quasimonochromatique de fréquence fo et 
% d'ecart delta_f  sur K points à la frequence Fe.
%
% Entrée : Fe_f0      nombre d'échantillons par période de la porteuse
%          delta_f_f0 écart fréquentielle divisé par la fréquence centrale
%          L       nombre de points
% 
% Sortie : s       signal

s = randn(1,L); TF_s = fft(s,L);
n1 = round((1/Fe_f0)*(1-delta_f_f0)*L); n2 = round(((1/Fe_f0)*(1+delta_f_f0)*L));
H = zeros(1,L); H(n1+1:n2) = ones(1,n2-n1);
H(L-n1:-1:L-n2+1) = ones(1,n2-n1);
TF_s = H.*TF_s; s = real(ifft(TF_s));