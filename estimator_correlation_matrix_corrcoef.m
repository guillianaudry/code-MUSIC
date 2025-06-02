function R_g = estimator_correlation_matrix_corrcoef(x)
    % Calcule la matrice d'intercorrélation entre les N signaux
    % x : Matrice de taille N x L (N signaux, L échantillons)
    % R_g : Matrice d'intercorrélation glissante (N x N )
    
    [N,L]= size(x);
    
    % Initialisation de la matrice de corrélation glissante
    R_g = zeros(N, N);
     
    % Calculer la matrice de corrélation pour cette fenêtre en utilisant corrcoef
    R_g(:, :) = corrcoef(x');
end
