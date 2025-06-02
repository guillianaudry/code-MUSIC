function E = env(S,f0,Fe)

% E = env(S,fo,Fe)
%
% Cette fonction détermine l'enveloppe complexe E du signal S.
%
% Entrée : S  signal quasi-monochromatique dont on cherche l'enveloppe (dim Kx N)
%          f0 fréquence du signal quasi-monochromatique
%          Fe fréquence d'échantillonnage
%
% Sortie : E  enveloppe du signal (dim N x K)

dim = size(S); N = dim(1); K = dim(2);
E = [];
z = zeros(1,K/2);
t = (0:K-1)/Fe;
p = exp(-j*2*pi*f0*t);
no  =round(f0/Fe*K);
for n = 1:N;
    s = S(n,:); TF_s = fft(s);
    TF_e = 2*[TF_s(1:K/2) z]; e = ifft(TF_e).*p;
    E = [E;e];	
    end