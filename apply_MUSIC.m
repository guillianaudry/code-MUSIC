function doa_estimates = apply_MUSIC(R_g, K, d_lambda)
    % Applique la méthode MUSIC pour estimer les Directions d'Arrivée (DOA)
    % R_avg : Matrice d'intercorrélation (ou de covariance) de taille N x N
    % K : Nombre de sources
    % d_lambda : Ratio distance entre antennes (d) et longueur d'onde
    % assurer que R_g est hermitienne
    R_avg = (R_g + R_g')/2;
    % Décomposition en valeurs propres et vecteurs propres de la matrice d'intercorrélation
    [V, D] = eig(R_avg);
    
    % Trier les valeurs propres et les vecteurs propres
    [~, idx] = sort(diag(D), 'descend');  % Tri des valeurs propres en ordre décroissant
    V = V(:, idx);  % Vecteurs propres triés par ordre décroissant des valeurs propres
    
    % Le sous-espace du bruit est formé par les vecteurs propres associés aux plus petites valeurs propres
    N = length(R_avg);
    noise_subspace = zeros(N,N);  % Sous-espace de bruit
    for k = N-K+1:N
        noise_subspace = noise_subspace + V(:,k)*V(:,k)';
    end
    
    % Calcul du vecteur d'onde (steering vector) et de la fonction MUSIC
    angles_deg = -90:0.1:90;  % Plage d'angles à tester (de -90° à 90°)
    doa_estimates = zeros(size(angles_deg));
    
    
    % Calcul de la fonction MUSIC pour chaque angle
    for i = 1:length(angles_deg)
        theta = deg2rad(angles_deg(i));  % Convertir l'angle en radians
        % Calcul du vecteur d'onde pour cet angle, d_lambda étant le ratio d/lambda
        steering_vector = exp(-1j * 2 * pi * (0:N-1)' * d_lambda * sin(theta));
        
        % Calcul de la fonction MUSIC (fonction de pseudospectre)
        steering_vector_herm = steering_vector';  % Transposée conjuguée du vecteur d'onde
        doa_estimates(i) = 1 / abs((steering_vector_herm * noise_subspace) * (noise_subspace' * steering_vector));
    end
    
    % Normalisation de la fonction MUSIC pour obtenir une amplitude entre 0 et 1
    %doa_estimates = abs(doa_estimates) / max(abs(doa_estimates));
    % Affichage des résultats
    figure;
    plot(angles_deg, doa_estimates, 'LineWidth', 2);
    title('Estimation des Directions d''Arrivée (DOA) - MUSIC');
    xlabel('Angle (degrés)');
    ylabel('Amplitude');
    grid on;
end
